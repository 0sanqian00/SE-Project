<!-- 登录页 -->
<script>
import LoginHeader from './LoginHeader.vue'
import LoginMain from './LoginMain.vue'

export default {
    name: 'Login',
    components: {
        LoginHeader,
        LoginMain,
    }
}
</script>

<template>
    <div class="login_container">
        <LoginHeader></LoginHeader>
        <LoginMain></LoginMain>
    </div>
</template>


<style lang="css" scoped>
.login_container {
    display: flex;
    flex-direction: column;
    height: 100%;
}
</style>