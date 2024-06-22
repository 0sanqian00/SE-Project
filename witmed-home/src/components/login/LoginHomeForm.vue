<script setup>
import { ref } from 'vue'
import { User, Lock } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus';
import { useRouter } from 'vue-router'
import { useTokenStore } from '@/stores/token.js'
import { useDataStore } from '@/stores/data.js'

const router = useRouter()

// 表单数据
const loginData = ref({
    username: '',
    password: '',
    type: 'doctor'
})

// 表单验证规则
const rules = {
    username: [
        { required: true, message: '请输入用户名', trigger: 'blur' }
    ],
    password: [
        { required: true, message: '请输入密码', trigger: 'blur' }
    ]
}

// 登陆请求
import { loginService } from '@/api/api.js';
const login = async () => {
    // console.log(loginData.value['username'])
    // console.log(loginData.value['password'])
    if (!(loginData.value['username'] && loginData.value['password'])) {
        ElMessage.error('账号或密码不能为空')
    } else {
        let result = await loginService(loginData.value);
        console.log(result)
        if (!result.state) {
            ElMessage.success('欢迎登陆管理系统') //暂时将除了正确账户密码的，都设为是管理员需求
            router.push('/admin')
        } else {
            ElMessage.success('成功登陆')

            // 保存token信息
            const tokenStore = useTokenStore();
            tokenStore.setToken(result.token);
            // console.log(tokenStore.token)

            // 保存家庭ID 1
            const dataStore = useDataStore();
            dataStore.setFamilyId(result.Id/2);
            router.push('/home')
        }
    }
}
</script>

<template>
    <div class="container">
        <div class="top">
            <img src="@/assets/med-logo.png" alt="" class="logo">
        </div>
        <div class="bottom">
            <h1 class="indication">网 页 端</h1>
            <!-- 登录表单 -->
            <el-form :model="loginData" :rules="rules">
                <el-form-item prop="username">

                    <el-input :prefix-icon="User" type="text" placeholder="用户名" v-model="loginData.username"></el-input>

                </el-form-item>
                <el-form-item prop="password">

                    <el-input :prefix-icon="Lock" type="password" placeholder="密码"
                        v-model="loginData.password"></el-input>

                </el-form-item>


                <!-- 暂时不提供注册功能 -->
                <!-- <span>
                    没有账号? <el-link type="primary" style="color: #0066ff">去注册</el-link>
                </span> -->
            </el-form>
            <el-button @click="login" type="primary" round color="#235cbe"
                style="width: 150px; margin-top: 20px; font-size: 18px;" size="large">登录</el-button>
        </div>
    </div>
</template>


<style lang="css" scoped>
.container {
    display: flex;
    height: 100%;
    flex-direction: column;
    text-align: center;
}

.top {
    flex: 1;
}

.logo {
    margin-top: 40px;
    height: 100px;
}

.bottom {
    flex: 3;
    align-items: center;
    justify-content: center;
}

.indication {
    margin-bottom: 40px;
}

.el-form {
    padding: 0 4rem;
}
</style>
