<script>
import LoginHomeForm from './LoginHomeForm.vue'

export default {
    name: "LoginMain",
    components: {
        LoginHomeForm,
    }
}
</script>

<template>
    <div class="login-main">
        <!-- 粒子背景 -->
        <!-- <vue-particles  color="#39AFFD" :particleOpacity="0.4" :particlesNumber="30" shapeType="circle" :particleSize="4"
            linesColor="#409EFF" :linesWidth="1" :lineLinked="true" :lineOpacity="0.4" :linesDistance="150" :moveSpeed="2"
            :hoverEffect="true" hoverMode="grab" :clickEffect="true" clickMode="push" class="particle">
        </vue-particles> -->

        <!-- 登录卡片 -->
        <div class="login-box">
            <!-- 左侧 - logo -->
            <div class="left-card">
            </div>

            <!-- 右侧 - 登录表单 -->
            <div class="right-card">
                <LoginHomeForm></LoginHomeForm>

            </div>
        </div>
    </div>
</template>



<style lang="css" scoped>
.login-main {
    flex: 1;
    position: relative;
    width: 100%;
    height: 100%;
}

.particle {
    height: 99%;
    width: 100%;
    position: absolute;
    overflow: hidden;
}

.login-box {
    display: flex;
    width: 740px;
    height: 480px;
    background-color: rgba(240, 240, 240, 0.6);
    box-shadow: 0 0 30px #b8b8b8;
    border-radius: 30px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.left-card {
    flex: 2;
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px;
    border-right: 1px solid #e6e6e6;
    background-image: url("@/assets/login_bg.png");
    background-size: 100% 100%;
}

.right-card {
    flex: 3;
    border-top-right-radius: 30px;
    border-bottom-right-radius: 30px;
}
</style>