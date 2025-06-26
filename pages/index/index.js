// index.js
const defaultAvatarUrl = 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0'

Page({
  data: {
    motto: 'Hello World',
    userInfo: {
      avatarUrl: defaultAvatarUrl,
      nickName: '',
    },
    hasUserInfo: false,
    canIUseGetUserProfile: wx.canIUse('getUserProfile'),
    canIUseNicknameComp: wx.canIUse('input.type.nickname'),
    currentTime: '07:08',
    networkStatus: '5G',
    batteryLevel: 80
  },
  bindViewTap() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onChooseAvatar(e) {
    const { avatarUrl } = e.detail
    const { nickName } = this.data.userInfo
    this.setData({
      "userInfo.avatarUrl": avatarUrl,
      hasUserInfo: nickName && avatarUrl && avatarUrl !== defaultAvatarUrl,
    })
  },
  onInputChange(e) {
    const nickName = e.detail.value
    const { avatarUrl } = this.data.userInfo
    this.setData({
      "userInfo.nickName": nickName,
      hasUserInfo: nickName && avatarUrl && avatarUrl !== defaultAvatarUrl,
    })
  },
  getUserProfile(e) {
    // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认，开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
    wx.getUserProfile({
      desc: '展示用户信息', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        console.log(res)
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    })
  },
  onLoad() {
    this.updateTime()
    this.startTimeUpdate()
  },
  onUnload() {
    // 清除定时器
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
    }, 60000) // 每分钟更新一次
  },
  // 跳转到美食推荐页面
  goToFoodRecommendations() {
    wx.vibrateShort({ type: 'light' }); // 增加轻微震动反馈
    
    wx.showToast({
      title: '正在跳转...',
      icon: 'loading',
      duration: 500
    });
    
    setTimeout(() => {
      wx.navigateTo({
        url: '../test-page/test-page'
      });
    }, 500);
  },
  // 跳转到骑手排行榜页面
  goToRiderLeaderboard() {
    wx.vibrateShort({ type: 'light' });
    wx.navigateTo({
      url: '../rider-leaderboard/rider-leaderboard'
    });
  },
  // 页面分享
  onShareAppMessage() {
    return {
      title: '美食外卖 - 享受美食，快乐生活',
      path: '/pages/index/index'
    }
  },
  // 页面分享到朋友圈
  onShareTimeline() {
    return {
      title: '美食外卖 - 享受美食，快乐生活'
    }
  }
})
