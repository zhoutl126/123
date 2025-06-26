const MOONSHOT_API_KEY = 'sk-aBhdUJ5VNX71dDNHmu4yKTP5ETzGKBTF0TGikDWrkaLIiDGd';
const API_URL = 'https://api.moonshot.cn/v1/chat/completions';

Page({
  data: {
    messages: [],
    inputValue: '',
    messageCounter: 0,
    showTyping: false,
  },

  onLoad: function (options) {
    this.addMessage('bot', '您好！我是比格小助手，有什么可以帮您的吗？');
  },

  addMessage(sender, content) {
    const botAvatar = '../../images/beagle-with-cookies.png';
    const userAvatar = ''; // Placeholder for user avatar

    const newMessage = {
      id: this.data.messageCounter + 1,
      sender,
      content,
      avatar: sender === 'bot' ? botAvatar : userAvatar,
    };
    this.setData({
      messages: [...this.data.messages, newMessage],
      messageCounter: this.data.messageCounter + 1,
    });
    this.scrollToBottom();
  },

  onInput(e) {
    this.setData({
      inputValue: e.detail.value,
    });
  },

  sendMessage() {
    wx.vibrateShort({ type: 'light' });
    const content = this.data.inputValue.trim();
    if (!content) return;

    this.addMessage('user', content);
    this.setData({ inputValue: '' });
    
    this.getAiReply(content);
  },

  getAiReply(userInput) {
    this.setData({ showTyping: true });

    // 构建历史消息用于API请求
    const history = this.data.messages.map(msg => ({
        role: msg.sender === 'bot' ? 'assistant' : 'user',
        content: msg.content
    }));

    wx.request({
      url: API_URL,
      method: 'POST',
      header: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${MOONSHOT_API_KEY}`
      },
      data: {
        model: "moonshot-v1-8k",
        messages: [
          { role: "system", content: "你是比格小助手，一个智能美食推荐专家。" },
          ...history, // 将历史对话作为上下文
          { role: "user", content: userInput }
        ],
        temperature: 0.3
      },
      success: (res) => {
        if (res.statusCode === 200 && res.data.choices && res.data.choices.length > 0) {
          const aiResponse = res.data.choices[0].message.content;
          this.addMessage('bot', aiResponse);
        } else {
          // 处理API返回的错误
          this.addMessage('bot', '抱歉，我暂时无法回答，请稍后再试。');
        }
      },
      fail: (err) => {
        // 处理网络请求失败
        wx.showToast({
          title: '连接失败，请稍后重试',
          icon: 'none'
        });
      },
      complete: () => {
        this.setData({ showTyping: false });
      }
    });
  },

  scrollToBottom() {
    wx.nextTick(() => {
      this.setData({
        scrollTop: 999999,
      });
    });
  },

  goBack: function() {
    wx.navigateBack({
      delta: 1
    })
  }
}) 