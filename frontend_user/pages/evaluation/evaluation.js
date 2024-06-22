import instance from '../../utils/request'
import Message from '../../miniprogram_npm/tdesign-miniprogram/message/index';

Page({
  data: {
    doctorId: '', // 用于存储当前医生的ID
    evaluation: '', // 用户输入的评价内容
    errorMessage: '' // 用于存储错误提示信息
  },

  showWarnMessage() {
    Message.warning({
      context: this,
      offset: [20, 32],
      duration: 3000,
      content: '评价不能为空',
    });
  },

  showSuccessMessage() {
    Message.success({
      context: this,
      offset: [20, 32],
      duration: 3000,
      content: '评价提交成功',
    });
  },

  showErrorMessage() {
    Message.error({
      context: this,
      offset: [20, 32],
      duration: 5000,
      content: '评价提交失败',
    });
  },

  onLoad: function(options) {
    console.log('页面加载参数:', options); // 打印传递的参数
    // 假设从上一个页面传递医生ID
    this.setData({
      doctorId: options.doctorId || '', // 确保设置了doctorId
    });
    console.log('设置的doctorId:', this.data.doctorId); // 打印设置的doctorId
  },

  // 绑定评价文本输入框的数据
  handleEvaluationInput: function(e) {
    this.setData({
      evaluation: e.detail.value
    });
  },

  // 提交评价的函数
  submitEvaluation: function() {
    const that = this;

    // 验证评价内容是否为空
    if (!that.data.evaluation.trim()) {
      that.setData({
        errorMessage: '请输入评价'
      });
      this.showWarnMessage(); // 显示警告信息
      return;
    }

    // 清空错误提示信息
    that.setData({
      errorMessage: ''
    });

    // 准备提交的数据
    const evaluationData = {
      memberId: '1', // 固定的memberId
      doctorId: that.data.doctorId,
      evaluation: that.data.evaluation,
    };

    // 打印提交的数据
    console.log('提交的数据:', evaluationData);

    // 调用后端接口提交评价
    instance.post('/person/evaluate', evaluationData)
      .then((res) => {
        // 提交成功的处理
        this.showSuccessMessage(); // 使用箭头函数后this不会丢失
        console.log('评价提交成功，返回数据：', res);
        // 这里可以添加页面跳转或其他逻辑
      })
      .catch((error) => {
        // 提交失败的处理
        this.showErrorMessage(); // 使用箭头函数后this不会丢失
        console.error('评价提交失败：', error);
      });
  },

  // 其他事件处理函数...
});
