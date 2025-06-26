const RIDER_STORAGE_KEY = 'rider_list';

Page({
  data: {
    isEditMode: false,
    showAddModal: false,
    newRiderName: '',
    riders: []
  },

  onLoad(options) {
    const storedRiders = wx.getStorageSync(RIDER_STORAGE_KEY);
    if (storedRiders && storedRiders.length > 0) {
      this.setData({ riders: storedRiders });
    } else {
      this.setData({
        riders: [
          { id: 1, name: '周芳', avatar: '', likes: 120, avoids: 5, liked: false, avoided: false },
          { id: 2, name: '翟文聪', avatar: '', likes: 115, avoids: 3, liked: false, avoided: false },
          { id: 3, name: '江玉龙', avatar: '', likes: 98, avoids: 8, liked: false, avoided: false },
        ]
      });
      wx.setStorageSync(RIDER_STORAGE_KEY, this.data.riders);
    }
  },

  updateRiders(newRiders) {
    this.setData({ riders: newRiders });
    wx.setStorageSync(RIDER_STORAGE_KEY, newRiders);
  },

  toggleEditMode() {
    wx.vibrateShort({ type: 'light' });
    this.setData({
      isEditMode: !this.data.isEditMode
    });
  },

  handleLike(e) {
    wx.vibrateShort({ type: 'light' });
    const riderId = e.currentTarget.dataset.id;
    const riders = this.data.riders.map(rider => {
      if (rider.id === riderId) {
        if (rider.liked) {
          // Unlike
          rider.likes--;
          rider.liked = false;
        } else {
          // Like
          rider.likes++;
          rider.liked = true;
          // 如果之前避雷了，取消避雷
          if (rider.avoided) {
            rider.avoids--;
            rider.avoided = false;
          }
        }
      }
      return rider;
    });
    this.updateRiders(riders);
  },

  handleAvoid(e) {
    wx.vibrateShort({ type: 'light' });
    const riderId = e.currentTarget.dataset.id;
    const riders = this.data.riders.map(rider => {
      if (rider.id === riderId) {
        if (rider.avoided) {
          // 取消避雷
          rider.avoids--;
          rider.avoided = false;
        } else {
          // 避雷
          rider.avoids++;
          rider.avoided = true;
          // 如果之前点赞了，取消点赞
          if (rider.liked) {
            rider.likes--;
            rider.liked = false;
          }
        }
      }
      return rider;
    });
    this.updateRiders(riders);
  },

  updateLikes(e) {
    const riderId = e.currentTarget.dataset.id;
    const newLikes = parseInt(e.detail.value) || 0;
    const riders = this.data.riders.map(rider => {
      if (rider.id === riderId) {
        rider.likes = newLikes;
      }
      return rider;
    });
    this.updateRiders(riders);
  },

  updateAvoids(e) {
    const riderId = e.currentTarget.dataset.id;
    const newAvoids = parseInt(e.detail.value) || 0;
    const riders = this.data.riders.map(rider => {
      if (rider.id === riderId) {
        rider.avoids = newAvoids;
      }
      return rider;
    });
    this.updateRiders(riders);
  },

  showAddRiderModal() {
    this.setData({ showAddModal: true });
  },

  hideAddRiderModal() {
    this.setData({ showAddModal: false, newRiderName: '' });
  },

  onNewRiderNameInput(e) {
    this.setData({ newRiderName: e.detail.value });
  },

  onAddRiderConfirm() {
    const name = this.data.newRiderName.trim();
    if (!name) {
      wx.showToast({
        title: '骑手姓名不能为空',
        icon: 'none'
      });
      return;
    }

    const newRider = {
      id: Date.now(),
      name: name,
      avatar: '',
      likes: 0,
      avoids: 0,
      liked: false,
      avoided: false
    };

    this.updateRiders([...this.data.riders, newRider]);
    this.hideAddRiderModal();
  },

  deleteRider(e) {
    const riderId = e.currentTarget.dataset.id;
    wx.showModal({
      title: '确认删除',
      content: '您确定要删除这位骑手吗？此操作不可撤销。',
      confirmColor: '#FF7043',
      success: (res) => {
        if (res.confirm) {
          const newRiders = this.data.riders.filter(rider => rider.id !== riderId);
          this.updateRiders(newRiders);
        }
      }
    });
  }
}); 