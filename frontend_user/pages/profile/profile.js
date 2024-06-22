// pages/profile/profile.js
import instance from '../../utils/request'
import {
  toJS
} from 'mobx-miniprogram'
import {
  createStoreBindings
} from 'mobx-miniprogram-bindings'
import {
  store
} from '../../store/store'

Page({
  data: {
    phySignData: {},
    memberInfoWithSignData: [],
    selectedMember: null, // 添加一个新的字段来保存第一个成员信息
    reservationRecords: [], // 新增字段，用于存储预约记录
  },

  // 请求家庭成员信息
  async getMemberInfo() {
    const res = await instance.get('/family/getMemberInfo', {
      'familyId': store.familyId
    });
    console.log('getMemberInfo 响应:', res);
    store.familyMembers = res; // 更新全局状态
  
    // 检查结果并设置selectedMember
    if (res && res.length > 0) {
      this.setData({
        selectedMember: res[0] // 将获取到的第一个成员信息赋值给selectedMember
      });
    } else {
      // 如果没有成员信息，可以选择设置为null或其他默认值
      this.setData({
        selectedMember: null
      });
    }
  },

  // 请求用户的预约记录
  async getReservationRecords() {
    const res = await instance.get('/person/getAppointRecord', {
      'memberId': 1 // 这里memberID固定为1
    });
    console.log('getReservationRecords 响应:', res);
    if (Array.isArray(res) && res.length > 0) {
      // 直接使用res，因为它已经是拦截器返回的数据
      this.setData({
        reservationRecords: res // 更新预约记录
      });
    }
  },

  goToAdvicePage: function() {
    // 使用固定的 memberID 进行页面跳转
    wx.navigateTo({
      url: `/pages/advice/advice?memberID=1`
    });
  },

  goToEvaluatePage: function(event) {
    const doctorId = event.currentTarget.dataset.doctorid;
    wx.navigateTo({
      url: `/pages/evaluation/evaluation?doctorId=${doctorId}`
    });
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onShow() {
    // 初始化数据请求
    this.getTabBar().init();
    console.log('onLoad: 初始化数据请求');
    Promise.all([
      this.getMemberInfo(),
      this.getReservationRecords() // 调用请求预约记录的函数
    ]).then(() => {
      console.log('onLoad: 所有数据请求完成');
    }).catch(error => {
      console.error('onLoad: 数据请求失败', error);
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {
    this.storeBindings = createStoreBindings(this, {
      store, // 数据源
      fields: ['familyMembers', 'familyId'], // 绑定字段
      actions: []
    });
  
    // 请求数据
    console.log('onReady: 请求数据');
    this.getMemberInfo()
      .then(() => {
        console.log('onReady: getMemberInfo 完成');
      })
      .catch(error => {
        console.error('onReady: 数据请求失败', error);
      });
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {
    // 监听页面卸载
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  },
});
