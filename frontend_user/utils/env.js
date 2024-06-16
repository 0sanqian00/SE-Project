// 配置小程序环境变量
const {
	miniProgram
} = wx.getAccountInfoSync()

// 获取小程序版本
const {
	envVersion
} = miniProgram

let env = {
	baseURL: 'http://116.204.122.181:8077',
}

switch (envVersion) {
	// 开发版
	case 'develop':
		env.baseURL = 'http://116.204.122.181:8077'
		break;
		// 体验版
	case 'trial':
		env.baseURL = 'http://116.204.122.181:8077'
		break;
		// 正式版
	case 'release':
		env.baseURL = 'http://116.204.122.181:8077'
		break;
	default:
		env.baseURL = 'http://116.204.122.181:8077'
		break;
}

export {
	env
}