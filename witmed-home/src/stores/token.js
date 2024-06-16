// token仓库
// 存放登陆token

import { defineStore } from 'pinia'
import { ref } from 'vue';

export const useTokenStore = defineStore('token', () => {
    const token = ref('')

    // 修改token
    const setToken = (newToken) => {
        token.value = newToken;
    }

    // 移除token
    const removeToken = () => {
        token.value = '';
    }

    return { token, setToken, removeToken };
}, {
    // 持久化存储
    persist: true
});

