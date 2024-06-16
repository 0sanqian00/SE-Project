/**
 * @description 消息提示框
 * @param { Object } options 参数和 wx.showToast 参数保持一致 
 */
const toast = ({
	title = '数据加载中...',
	icon = 'none',
	duration = 2000,
	mask = true
} = {}) => {
	wx.showToast({
		title,
		icon,
		duration,
		mask
	})
}

/**
 * 模态对话框
 * @param {Object } options 参数和wx.showModal参数保持一致
 */
const modal = (options = {}) => {
	return new Promise((resolve) => {
		const defaultOpt = {
			title: '提示',
			content: '您确定执行该操作吗？',
			confirmColor: '#0080ce',
		}
		const opts = Object.assign({}, defaultOpt, options)
		wx.showModal({
			...opts,
			complete: ({
				confirm,
				cancel
			}) => {
				confirm && resolve(true)
				cancel && resolve(false)
			}
		})
	})
}


// 挂载到 wx 全局对象上
wx.toast = toast
wx.modal = modal







/*
	// 使用示例
    wx.toast({
      title: '预约成功',
      icon: 'success'
    })


	// 函数前增加async 
    const res = await wx.modal({
      title: '新的提示',
    })
    console.log(res)
*/