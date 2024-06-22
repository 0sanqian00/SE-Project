// pages/phySign/phySign.js
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

  // 请求体征数据
  async getMegetPhySignDatamberInfo() {
    try {
      const res = await instance.get('/family/getPhySignData', {
        'familyId': store.familyId
      });
      console.log('getPhySignData 响应:', res);
      this.data.phySignData = res[0] || {};
      this.mergeDataWithFirstSign();
    } catch (error) {
      console.error('请求体征数据失败:', error);
    }
  },

  // 合并成员信息和第一个体征数据
mergeDataWithFirstSign() {
  // 使用 toJS 处理整个 familyMembers 对象
  let res = toJS(store.familyMembers);

  // 找到第一个体征数据对应的成员信息
  const firstSignData = this.data.phySignData;
  const matchingObj = res.find(memberObj => memberObj.id === firstSignData.personId);

  if (matchingObj) {
    // 更新成员信息
    matchingObj.bloodOxygen = firstSignData.bloodOxygen;
    matchingObj.bloodSugar = firstSignData.bloodSugar;
    matchingObj.highPreasure = firstSignData.highPreasure;
    matchingObj.lowPreasure = firstSignData.lowPreasure;
    matchingObj.bodyTem = firstSignData.bodyTem;
    matchingObj.heartRate = firstSignData.heartRate;
    matchingObj.chestPain = firstSignData.chestPain;
    matchingObj.anginaPectoris = firstSignData.anginaPectoris;
    matchingObj.prediction = firstSignData.prediction;
  }

  // 只设置第一个成员的体征信息
  this.setData({
    memberInfoWithSignData: [matchingObj] // 只包含第一个成员的体征信息
  });
},


  /**
   * 生命周期函数--监听页面加载
   */
  onLoad() {
    this.getMegetPhySignDatamberInfo()
    console.log(111)
    // this.storeBindings = createStoreBindings(this, {
    //   store, // 数据源
    //   fields: ['familyMembers', 'familyId'], // 绑定字段
    //   actions: []
    // });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {
    this.getMemberInfo()
    
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    this.getTabBar().init();
    this.getMegetPhySignDatamberInfo();
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

  }
})