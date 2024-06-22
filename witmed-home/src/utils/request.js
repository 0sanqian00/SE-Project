/*
* axios请求基本配置、请求拦截器、相应拦截器
* 创建请求实例 
*/

import axios from 'axios';
import { useTokenStore } from '@/stores/token.js';
import { ElMessage } from 'element-plus';
import router from '@/router/router';

// 解决跨域问题，代理设置在`vite.config.js`
const baseURL = '/api';
const instance = axios.create({ baseURL });

// 请求拦截器
instance.interceptors.request.use(
    (config) => {
        let tokenStore = useTokenStore()
        // 向请求头添加token
        if (tokenStore.token) {
            config.headers.token = tokenStore.token
        }
        return config
    },
    (err) => {
        Promise.reject(err)
    }
)

// 响应拦截器
instance.interceptors.response.use(
    result => {
        if (result.status === 200) {
            if(result.data.msg === 'token无效'){
                ElMessage.error('请先登录！')
                router.push('login')
                return Promise.reject(result.data);
            }
            return result.data;
        } else {
            // ElMessage.error('服务异常')
            // 异步的状态转化成失败的状态
            return Promise.reject(result.data);
        }
    },
    err => {
        if (err.response.status === 401) {
            ElMessage.error('请先登录！')
            router.push('login')
        } else {
            // ElMessage.error('服务异常')

        }

        // 异步的状态转化成失败的状态
        return Promise.reject(err);
    }
)


// 解决跨域问题，代理设置在`vite.config.js`
const baseURL1 = '/apii';
const instance1 = axios.create({ baseURL1 });
export {instance, instance1};

