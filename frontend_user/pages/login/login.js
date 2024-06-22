// pages/login/login.js
import instance from '../../utils/request'
import {
  asyncSetStorage
} from '../../utils/storage'
import Message from '../../miniprogram_npm/tdesign-miniprogram/message/index';

Page({
  data: {
    account: '',
    psw: ''
  },
  // 输入账号密码
  onAccountInput(e) {
    const {
      value
    } = e.detail;
    this.setData({
      account: value
    });
  },
  onPswInput(e) {
    this.setData({
      psw: e.detail.value
    });
  },
  // 通知信息
  showSuccessMessage() {
    Message.success({
      context: this,
      offset: [20, 32],
      duration: 3000,
      content: '登录成功',
    });
  },

  showErrorMessage() {
    Message.error({
      context: this,
      offset: [20, 32],
      duration: 5000,
      content: '登录失败',
    });
  },
  // 登陆请求
  async loginRequest(account, psw) {
    const res = await instance.post('/user/login', {
      'username': account,
      'password': psw,
      'type': 'user'
    });
  
    if (res.state) {
      try {
        await asyncSetStorage('token', res.token);
        this.showSuccessMessage();
        wx.reLaunch({
          url: '/pages/profile/profile',
        });
        
        
        
      } catch (error) {
        console.error('Failed to set token:', error);
        this.showErrorMessage();
      }
    } else {
      this.showErrorMessage();
    }
  },
  
  loginHandle(e) {
    let account = this.data.account;
    let psw = this.data.psw;
    this.loginRequest(String(account), String(psw));
  },
})