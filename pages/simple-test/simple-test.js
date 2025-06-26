Page({
  data: {
    message: "简单测试页面加载成功！"
  },

  onLoad() {
    console.log('简单测试页面加载成功')
    wx.showToast({
      title: '页面已加载',
      icon: 'success',
      duration: 2000
    })
  },

  goBack() {
    wx.navigateBack()
  },

  testFunction() {
    wx.showToast({
      title: '功能正常',
      icon: 'success',
      duration: 1000
    })
  }
}) 