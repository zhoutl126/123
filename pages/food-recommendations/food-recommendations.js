Page({
  data: {
    messages: [
      {
        id: 1,
        type: "bot",
        content: "你好！我是比格小助手🐕，今天想吃什么呢？",
        time: "09:30",
      },
      {
        id: 2,
        type: "user",
        content: "有什么好吃的推荐吗？",
        time: "09:31",
      },
      {
        id: 3,
        type: "bot",
        content: "推荐：🍲麻婆豆腐 🥩红烧肉 🐟清蒸鲈鱼，都是高评分美食！",
        time: "09:31",
      },
      {
        id: 4,
        type: "user",
        content: "麻婆豆腐怎么样？",
        time: "09:32",
      },
      {
        id: 5,
        type: "bot",
        content: "香辣麻婆豆腐很棒！🌶️评分4.8⭐，价格¥28，25分钟送达！",
        time: "09:32",
      },
    ],
    inputValue: "",
    currentTime: "09:32",
    isTyping: false,
    lastMessageId: 5
  },

  onLoad() {
    this.updateTime()
    this.startTimeUpdate()
    this.scrollToBottom()
  },

  onUnload() {
    if (this.timeInterval) {
      clearInterval(this.timeInterval)
    }
  },

  // 更新时间
  updateTime() {
    const now = new Date()
    const hours = now.getHours().toString().padStart(2, '0')
    const minutes = now.getMinutes().toString().padStart(2, '0')
    this.setData({
      currentTime: `${hours}:${minutes}`
    })
  },

  // 开始时间更新
  startTimeUpdate() {
    this.timeInterval = setInterval(() => {
      this.updateTime()
    }, 60000)
  },

  // 滚动到底部
  scrollToBottom() {
    setTimeout(() => {
      this.setData({
        scrollTop: 9999
      })
    }, 100)
  },

  // 输入框内容变化
  onInputChange(e) {
    this.setData({
      inputValue: e.detail.value
    })
  },

  // 发送消息
  sendMessage() {
    const { inputValue, messages, lastMessageId } = this.data
    if (!inputValue.trim()) return

    // 显示正在输入状态
    this.setData({
      isTyping: true
    })

    // 添加用户消息
    const newMessageId = lastMessageId + 1
    const newMessages = [...messages, {
      id: newMessageId,
      type: "user",
      content: inputValue,
      time: this.data.currentTime
    }]

    this.setData({
      messages: newMessages,
      inputValue: "",
      lastMessageId: newMessageId
    })

    // 滚动到底部
    this.scrollToBottom()

    // 模拟机器人回复
    setTimeout(() => {
      const botReply = this.getBotReply(inputValue)
      const botMessageId = newMessageId + 1
      const finalMessages = [...newMessages, {
        id: botMessageId,
        type: "bot",
        content: botReply,
        time: this.data.currentTime
      }]

      this.setData({
        messages: finalMessages,
        lastMessageId: botMessageId,
        isTyping: false
      })

      // 再次滚动到底部
      this.scrollToBottom()
    }, 1000)
  },

  // 获取机器人回复 - 限制30字以内
  getBotReply(userInput) {
    const replies = {
      "麻婆豆腐": "香辣麻婆豆腐很棒！🌶️评分4.8⭐，价格¥28，25分钟送达！",
      "红烧肉": "招牌红烧肉很受欢迎！🍖评分4.9⭐，价格¥35，肥而不腻！",
      "鲈鱼": "清蒸鲈鱼很新鲜！🐟评分4.7⭐，价格¥45，鲜嫩多汁！",
      "下单": "好的！正在为您下单...麻婆豆腐¥28+配送费¥5=¥33，25分钟送达！",
      "推荐": "今天热门推荐：🍜兰州拉面 🍚黄焖鸡米饭 🥘水煮鱼片 🍖糖醋里脊！",
      "你好": "你好！我是比格小助手🐕，可以帮你推荐美食、查询菜品、协助下单！",
      "谢谢": "不客气！😊如果还有问题，随时问我哦！比格小助手随时为您服务！",
      "再见": "再见！👋记得常来找我聊天哦！比格小助手会一直在这里等你！"
    }

    for (const [key, reply] of Object.entries(replies)) {
      if (userInput.includes(key)) {
        return reply;
      }
    }

    return '抱歉，我没有理解您的意思。您可以试试：询问具体菜品（麻婆豆腐、红烧肉、鲈鱼），说"推荐"查看更多美食，说"下单"购买推荐菜品，或者直接问我"你好"';
  },

  // 返回首页
  goBack() {
    wx.navigateBack({
      delta: 1
    })
  },

  // 页面分享
  onShareAppMessage() {
    return {
      title: '比格每日优选 - 智能美食推荐',
      path: '/pages/food-recommendations/food-recommendations'
    }
  },

  // 页面分享到朋友圈
  onShareTimeline() {
    return {
      title: '比格每日优选 - 智能美食推荐'
    }
  }
}) 