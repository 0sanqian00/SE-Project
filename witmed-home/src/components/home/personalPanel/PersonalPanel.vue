<script setup>
import { ref, onMounted, computed } from 'vue';
import { getMemberInfo, getphySignData, getMedicalRecord, getDrugPlan, getMeasureLog } from '@/api/apiUtils.js';
import { useRoute } from 'vue-router';
import { useDataStore } from '@/stores/data.js';

import MedicationPlan from './MedicationPlan.vue';
import PhysicalSignData from './PhysicalSignData.vue';
import DiseasePrediction from './DiseasePrediction.vue';


// 监听路由变化，获取当前用户id
const route = useRoute();
const userId = ref(null);
onMounted(() => {
    userId.value = route.params.id;
    getMedicalRecord(parseInt(userId.value));
    getDrugPlan(parseInt(userId.value));
    getMeasureLog(parseInt(userId.value))
});

// 数据仓库
const dataStore = useDataStore();
// getMemberInfo();
getphySignData();


// tab栏切换
const tabs = [
    { name: '用药计划' },
    { name: '体征数据' },
    { name: '疾病预测' }
]
const activeTabIndex = ref(0);


// 根据id匹配phySignData
function getSignData(personId) {
    return dataStore.phySignData.find(data => data.personId == personId) || {};
}

// 根据id匹配phySignData
function getMemberInfoData(personId) {
    return dataStore.memberInfo.find(data => data.id == personId) || {};
}

// 最新的预约记录
const latestAppointment = computed(() => {
    const appointments = dataStore.appointRecord.filter(appointment => appointment.personId == userId.value);
    if (appointments.length === 0) return null;
    return appointments.reduce((prev, current) => (new Date(prev.time) > new Date(current.time) ? prev : current));
});

// 格式化日期数据，仅保留 月日时间
function formatTimeRange(time) {
    // time = time.slice(5);
    time = time.slice(0, -3);
    time = time.replace('T', ' ');
    return time;
}
</script>

<template>
    <div class="personal-panel-container">
        <div class="header">
            <div class="options" style="display: flex; align-items: center;">
                <router-link to="/home">
                    <div class="nav-btn">
                        <img style="height: 20px; margin-right: 5px;" src="@/assets/mainPage/home.png">回到主页
                    </div>
                </router-link>
            </div>
            <div class="tabs-area">
                <div class="tabs">
                    <div v-for="(tab, index) in tabs" :key="index" class="tab" @click="activeTabIndex = index"
                        :class="{ 'active': activeTabIndex === index }">
                        {{ tab.name }}
                    </div>

                </div>
                <div class="underline" :style="{ left: (activeTabIndex * 33 + 15) + '%' }"></div>

            </div>
        </div>
        <div class="main">
            <div v-if="activeTabIndex == 0">
                <MedicationPlan :userId="userId"></MedicationPlan>
            </div>
            <div v-if="activeTabIndex == 1">
                <PhysicalSignData :userId="userId"></PhysicalSignData>
            </div>

            <div v-if="activeTabIndex == 2">
                <DiseasePrediction :userId="userId"></DiseasePrediction>
            </div>
        </div>
    </div>


</template>

<style scoped>
.personal-panel-container {
    height: 100%;
    width: 100%;
}

.header {
    height: 65px;
    width: 100%;
    background-color: rgba(255, 255, 255, 0.6);
    display: grid;
    grid-template-columns: 20% 80%;
    backdrop-filter: blur(5px);
}

.nav-btn {
    text-decoration: none;
    color: #0c12c0;
    height: 45px;
    width: 130px;
    margin-left: 25px;
    font-size: 20px;
    font-weight: 700;
    background-color: #c3d1ff;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
}


/* Tab栏区域 */
.tabs-area {
    /* display: flex;
    flex-direction: column; */
    position: relative;
    height: 65px;
}

.tabs {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    height: 100%;
}

.tab {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #73799C;
    font-size: 24px;
    font-weight: 700;
    cursor: pointer;
}

.underline {
    position: absolute;
    bottom: 7px;
    width: 4%;
    height: 3px;
    background-color: #108FFF;
    border-radius: 2px;
    transition: left 0.3s ease;
}

.active {
    color: #000;
}

.main {
    /* height: calc(100% - 65px - 50px);
    width: calc(100% - 50px);
    padding: 20px 25px 30px 25px; */

    height: calc(100% - 65px);
}
</style>
