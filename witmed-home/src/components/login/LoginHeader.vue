<script>
export default {
    name: 'LoginHeader',
}
</script>

<template>
    <div class="login-header ">
        <img class="image-logo" src="@/assets/icons/system.svg">
        <router-link to="/index" class="nav-text"> 家有良医</router-link>
    </div>
</template>



<style lang="css" scoped>
.login-header {
    height: 50px;
    background-color: #235cbe;
    line-height: 50px;
    display: flex;
    align-items: center;
}
.image-logo{
  margin-left: 1%;
  max-height: 100%;
  object-fit: contain;
}
.nav-text {
    font-size: 20px;
    color: #fff;
    font-weight: 700;
    padding-left: 30px;
    text-decoration: none;
}
</style>