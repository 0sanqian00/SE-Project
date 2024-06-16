<script>
import Header from './home-cmpt/Header.vue'
import MainPage from './mainPage/MainPage.vue'
import DoctorAppointment from './doctorAppointment/DoctorAppointment.vue';
import MedicineBox from './medicineBox/MedicineBox.vue';

export default {
    name: 'Home',
    components: {
        Header,
        MainPage,
        DoctorAppointment,
        MedicineBox,
    }
}



</script>

<template>
    <div class="layout">
        <el-container>
            <!-- <el-header>
                <Header></Header>
            </el-header> -->
            <el-main class="default-font-color">
                <router-view></router-view>
            </el-main>
        </el-container>
    </div>
</template>



<style lang="css" scoped>
/* 整体容器布局 */
.layout {
    height: 100%;
}

.el-container {
    height: 100vh;
}

.el-header {
    height: 60px;
    padding: 0;
    background-color: var(--header-color);
}

.el-main {
    /* background-color: var(--bgl1-color); */

    /* height: calc(100% - 60px); */
    height: 100%;
    width: 100%;
    background: url('@/assets/background.png');
    background-size: cover;
    padding: 0;
}

/* 主页面布局 */


</style>