import instance from '../../utils/request'
import {
  store
} from '../../store/store'

import {
  toJS
} from 'mobx-miniprogram'

import Message from '../../miniprogram_npm/tdesign-miniprogram/message/index';

Page({
  data: {
    curDoctor: {},
    position: [{
      value: 'bottom'
    }],
    doctorList: [],
    availableslots:[0, 0, 0, 0, 0, 0],
    mode: '',
    dateVisible: false,
    date: new Date().getTime(), // 获取当前时间的时间戳
    start: new Date().getTime(),
    dateText: '',

    // 预约时间选择
    value: 0,
    schedule: ['09:00~10:00', '10:00~11:00', '13:00~14:00', '14:00~15:00', '15:00~16:00', '16:00~17:00'],
    availableStatus: [true, true, true, true, true, true], // 新增：每个时间段的可预约状态
    disabledSlots: [false, false, false, false, false, false], // 假设有6个时间段
    warnContent: '',
  },

  // 预约面板弹出处理
  handlePopup(e) {
    const doctor = e.currentTarget.dataset.doctor;
    this.setData({
      curDoctor: doctor,
      
    }, () => {
      // 弹出预约面板后，获取当前医生的可预约人数
      this.updateAvailableSlots(doctor.id).then(() => {
        this.setData({
          visible: true // 确保在获取数据后显示弹出面板
        });
      });
    });
  },

  onVisibleChange(e) {
    this.setData({
      visible: e.detail.visible,
    });
  },
  hideHandlePopup(e) {
    this.setData({
      visible: false,
    });
  },

  // 预约日期选择器
  showPicker(e) {
    const { mode } = e.currentTarget.dataset;
    this.setData({
      mode,
      [`${mode}Visible`]: true,
    });
  },
  hidePicker() {
    const { mode } = this.data;
    this.setData({
      [`${mode}Visible`]: false,
    });
  },
  onConfirm(e) {
    const { value } = e.detail;
    const { mode } = this.data;
  
    // 格式化日期为 YYYY-MM-DD
    const date = new Date(value);
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;
  
    this.setData({
      [mode]: value,
      [`${mode}Text`]: formattedDate, // 使用格式化的日期
    });
  
    this.hidePicker();
  },

  onColumnChange(e) {
    console.log('pick', e.detail.value);
  },

  // 选择预约时间
  onChange(e) {
    this.setData({
      value: e.detail.value
    });
  },

  showWarnMessage() {
    Message.warning({
      context: this,
      offset: [20, 32],
      duration: 3000,
      content: this.data.warnContent,
    });
  },
  showSuccessMessage() {
    Message.success({
      context: this,
      offset: [20, 32],
      duration: 3000,
      content: '预约成功',
    });
  },
  showErrorMessage() {
    Message.error({
      context: this,
      offset: [20, 32],
      duration: 5000,
      content: '预约失败',
    });
  },

  async appointDoctor(memberId, doctorId, appointmentTime) {
    console.log("Inside appointDoctor:");
    console.log("memberId:", memberId);
    console.log("doctorId:", doctorId);
    console.log("appointmentTime:", appointmentTime);
  
    try {
      const res = await instance.post('/doctor/appointDoctor', {
        memberId: parseInt(memberId), // 使用固定的memberId
        doctorId: parseInt(doctorId),
        appointmentTime: appointmentTime
      });
      if (res != null) { // 假设200是成功的状态码
        this.showSuccessMessage();
      } else {
        this.showErrorMessage();
      }
    } catch (error) {
      this.showErrorMessage();
      console.log('请求失败');
    }
  },

  // 预约请求
  requestAppoint(e) {
    let doctorId = this.data.curDoctor.id;
    let memberId = 1;
    let appointmentDate = this.data.dateText;
    console.log(appointmentDate);
    let timeSlot = this.data.schedule[this.data.value].substring(0, 5); // 提取时间段
    let appointmentTime = timeSlot
    let checkTime = `${appointmentDate}T${timeSlot}:00`;
    let date = new Date(checkTime);
    if (isNaN(date.getTime())) {
      this.setData({
        warnContent: '请选择要预约的时间'
      });
      this.showWarnMessage();
      return;
    }
    console.log("appointmentTime:", appointmentTime); // 确认时间
    this.appointDoctor(parseInt(memberId), parseInt(doctorId), appointmentTime);
  },

  // 请求医生信息
  async getDoctorList() {
    const res = await instance.get('/doctor/getDoctorList')
    this.setData({
      doctorList: res
    });
  },
  // 定义一个方法来请求后端数据
async fetchAppointmentState(doctorId) {
  try {
    console.log(`Fetching appointment state for doctorId: ${doctorId}`);
    const response = await instance.get('/doctor/appointmentState', { doctorId });
    
    console.log('First log - Response received:', response);

    if (response != null) {
      return response;
    } else {
      console.log('Request failed with status code:', response.statusCode);
      throw new Error('Failed to fetch appointment state');
    }
  } catch (error) {
    console.error('Error fetching appointment state:', error);
    // 错误处理...
  }
},
// 更新可预约人数的方法
updateAvailableSlots(doctorId) {
  return this.fetchAppointmentState(doctorId).then(appointmentData => {
    // 确保数据格式正确
    if (!appointmentData || appointmentData.length === 0 || !appointmentData[0].doctorId) {
      throw new Error('Invalid appointment data format');
    }

    // 解析返回的数据
    const data = appointmentData[0];
    const availableSlots = [];
    const disabledSlots = [];

    for (let i = 1; i <= 6; i++) {
      const num = data[`num${i}`];
      availableSlots.push(num);
      // 如果可预约人数小于等于0，则设置为true，表示不可预约（即禁用）
      disabledSlots.push(num <= 0);
    }

// 更新页面数据
    this.setData({
      availableSlots: availableSlots,
      disabledSlots: disabledSlots,
    });
  }).catch(error => {
    console.error('Failed to fetch appointment state:', error);
    // 显示错误信息
    this.showError('获取预约状态失败');
  });
},

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    this.getDoctorList()
  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    this.getTabBar().init();
  }
});