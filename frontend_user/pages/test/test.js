// import Message from '../../miniprogram_npm/tdesign-miniprogram/message/index';

// Page({
//     showInfoMessage() {
//       Message.info({
//         context: this,
//         offset: [20, 32],
//         duration: 5000,
//         content: '这是一条普通通知信息',
//       });
//     },

//     showWarnMessage() {
//       Message.warning({
//         context: this,
//         offset: [20, 32],
//         duration: 5000,
//         content: '这是一条需要用户关注到的警示通知',
//       });
//     },

//     showSuccessMessage() {
//       Message.success({
//         context: this,
//         offset: [20, 32],
//         duration: 5000,
//         content: '这是一条成功的提示消息',
//       });
//     },

//     showErrorMessage() {
//       Message.error({
//         context: this,
//         offset: [20, 32],
//         duration: 5000,
//         content: '这是一条错误提示通知',
//       });
//     },
// });
// 请求函数示例
async function fetchData() {
  try {
    const res = await instance.get('/person/getAppointRecord', {
      params: {
        key: '1', // 添加查询参数
      },
      headers: {
        'Authorization': `Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJleHAiOjE3MTg0NDQ5MzEsInVzZXJuYW1lIjoidXNlciJ9.7HY5uOHXGbL0hsgTcPpSadFuQlut9XNgW-6oYt4J49A`, // 添加请求头
      }
    });

    if (res.status === 200) {
      // 请求成功，处理响应数据
      console.log('响应数据:', res.data);
    } else {
      console.error('请求失败，状态码:', res.status, '响应:', res.data);
      wx.showToast({
        title: `请求失败: ${res.data.message || '未知错误'}`,
        icon: 'none',
        duration: 2000
      });
    }
  } catch (error) {
    // 捕获错误
    if (error.response) {
      // 服务器返回的状态码不在 2xx 范围内
      console.error('服务器响应错误:', error.response.status, '响应:', error.response.data);
      wx.showToast({
        title: `请求失败: ${error.response.data.message || '未知错误'}`,
        icon: 'none',
        duration: 2000
      });
    } else if (error.request) {
      // 请求已发出但没有收到响应
      console.error('请求错误:', error.request);
      wx.showToast({
        title: '请求错误，请检查网络',
        icon: 'none',
        duration: 2000
      });
    } else {
      // 其他错误
      console.error('请求出错:', error.message);
      wx.showToast({
        title: `请求出错: ${error.message}`,
        icon: 'none',
        duration: 2000
      });
    }
  }
}

// 在页面加载时调用
Page({
  onLoad() {
    fetchData();
  }
});
