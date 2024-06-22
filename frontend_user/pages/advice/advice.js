// pages/advice/advice.js
import instance from '../../utils/request';

Page({
  data: {
    adviceList: [],
    doctorList: [], // 存储医生列表
    noAdviceTip: false
  },
  
  onLoad(options) {
    this.getDoctorList().then(() => {
      this.getAdviceByMemberId(1); // 假设 memberID 固定为 1
    });
  },

  // 请求医生列表
  async getDoctorList() {
    const res = await instance.get('/doctor/getDoctorList');
    if (res && res.length) {
      this.setData({
        doctorList: res
      });
    }
  },

  // 根据 memberID 请求医嘱信息
  async getAdviceByMemberId(memberID) {
    const adviceRes = await instance.get('/person/getAdvice', { memberId: memberID  });
    if ( adviceRes) {
      const adviceListWithDoctorInfo = adviceRes.map(item => {
        // 在医生列表中查找对应的医生姓名和科室
        const doctor = this.data.doctorList.find(doctor => doctor.id === item.doctorId) || {};
        return {
          ...item,
          doctorName: doctor.name, // 医生姓名
          office: doctor.office, // 科室
        };
      });
      this.setData({
        adviceList: adviceListWithDoctorInfo,
        noAdviceTip: false
      });
    } else {
      this.setData({
        adviceList: [], // 确保 adviceList 为空数组
        noAdviceTip: true
      });
    }
  },

  // 其他页面逻辑...
});