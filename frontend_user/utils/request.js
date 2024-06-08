import WxRequest from 'mina-request'
import {
  getStorage,
  clearStorage
} from './storage'
import {
  env
} from './env'

// WxRequest 实例化
const instance = new WxRequest({
  baseURL: env.baseURL,
  timeout: 15000
})

// 请求拦截器
instance.interceptors.request = (config) => {
  const token = getStorage('token');
  if (token) {
    config.header['token'] = token;
  }
  console.log("Request config:", config); // 添加日志
  return config;
}

// 响应拦截器
instance.interceptors.response = async (response) => {
  console.log("Response received:", response); // 添加日志

  const { isSuccess, data } = response;

  if (!isSuccess) {
    wx.toast({
      title: '网络异常',
      icon: 'error'
    });
    return Promise.reject(response);
  }

  switch (response.statusCode) {
    case 200:
      return data;
    case 208:
      const res = await wx.modal({
        content: 'token失效',
        showCancel: false,
      });
      if (res) {
        clearStorage();
        wx.navigateTo({
          url: '/pages/login/login',
        });
      }
      return Promise.reject(response);
    default:
      wx.showToast({
        title: '服务异常',//wx.toast
        icon: 'error'
      });
      return Promise.reject(response);
  }
  return response;
}


export default instance