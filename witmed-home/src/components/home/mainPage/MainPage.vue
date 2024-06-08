<script setup>
import { getMemberInfo, measurePhySign, getAppointRecord, getMedicalRecord, getMedicalRecord1 } from '@/api/apiUtils.js';
import { ref, defineComponent } from 'vue';
import { useDataStore } from '@/stores/data.js';
import { useRouter } from 'vue-router';
import { ElMessage, ElDialog } from 'element-plus';

import EnterPalmMqtt from './EnterPalmMqtt.vue'

// 路由
const router = useRouter()

// 数据仓库
const dataStore = useDataStore();
console.log(dataStore.memberInfo)
getMemberInfo();
// getphySignData();
// getAppointRecord();
getMedicalRecord(1)
// getMedicalRecord1(1)

// 体征测量参数
const measureParams = ref({
    measureType: '',
    measureId: ''
})
const setSelectedMemberId = (data) => { measureParams.value['measureId'] = data; }
const setSelectedMeasureType = (data) => { measureParams.value['measureType'] = data; }

// 体征测量网络请求
const measure = async () => {
    // console.log(loginData.value['username'])
    // console.log(loginData.value['password'])
    if (!(measureParams.value['measureType'] && measureParams.value['measureId'])) {
        ElMessage.error('请选择测量人员')
    } else {
        let result = await measurePhySign(measureParams);
        ElMessage.success('测量成功')
    }
}

// 是否存在预约
const hasAppointment = (memberId) => {
    return dataStore.appointRecord.some(record => record.personId === memberId);
};

// 设置(setting)抽屉
const drawer = ref(false);
const direction = ref('ltr');

// 录入掌纹对话框
const enterPalmVisible = ref(false);

function isAppoint(){
    if(dataStore.medicalRecord.length === 0) {
    return false;
} else {
    return true;
}
}
</script>

<template>
    <div class="main-page-container">
        <div class="doc-header ">
            <img class="image-logo" src="@/assets/icons/system.svg">
                    <router-link to="/index" class="nav-text"> 医生端服务界面</router-link>
        </div>
        <div class="profile-panel-container">
            <div class="profile-panel border">


                <!-- <div class="profile-item" v-if="isAppoint()" v-for="(member, index) in dataStore.memberInfo" :key="member.id">
                    <div class="profile-info">
                        <div class="selected-box"
                            :class="{ 'show-border-box': member.id === measureParams['measureId'] }">
                            <div class="profile-info-image" @click="router.push(`/home/personalPanel/${member.id}`);">
                                <img :src="member.image" alt="profile image">
                            </div>
                            <div class="profile-info-right">
                                <div class="info-text-row info-text-row-1" style="font-weight: 700; font-size: 26px;">
                                    <div>{{ member.name }}</div>
                                    <div  @click="router.push(`/home/personalPanel/${member.id}`);"> <img src="@/assets/mainPage/jump-to.png"></div>
                                </div>

                                <div class="info-text-row info-text-row-2" style="font-size: 20px; color: #596E86;">
                                    <div class="info-text-reseravation">
                                        <el-tag type="danger"
                                            style="font-size: 16px; border-radius: 0px 10px 0px 10px; height: 30px; width: 60px;">有预约</el-tag>
                                       
                                    </div>
                                    {{ member.gender }} | {{ member.age }}岁
                                </div> -->
                <div class="profile-item" v-if="isAppoint()" v-for="(member, index) in dataStore.medicalRecord.sort(function(a, b) {
                return new Date('1970/01/01 ' + a.datetime) - new Date('1970/01/01 ' + b.datetime);})" :key="member.id">
                    <div class="profile-info">
                        <div class="selected-box"
                            :class="{ 'show-border-box': member.id === measureParams['measureId'] }">
                            <div class="profile-info-image" @click="router.push(`/home/personalPanel/${member.id}`);">
                                <img :src="member.image" alt="profile image">
                            </div>
                            <div class="profile-info-right">
                                <div class="info-text-row info-text-row-1" style="font-weight: 700; font-size: 26px;">
                                    <div>{{ member.name }}</div>
                                    <div  @click="router.push(`/home/personalPanel/${member.id}`);"> <img src="@/assets/mainPage/jump-to.png"></div>
                                </div>

                                <div class="info-text-row info-text-row-2" style="font-size: 20px; color: #596E86;">
                                    <div class="info-text-reseravation">
                                        <el-tag type="danger"
                                            style="font-size: 16px; border-radius: 0px 10px 0px 10px; height: 30px; width: 60px;">{{ member.datetime }}</el-tag>
                                        <!-- <el-tag v-else
                                            style="font-size: 16px; border-radius: 0px 10px 0px 10px; height: 30px; width: 60px;">无预约</el-tag> -->
                                    </div>
                                    {{ member.gender }} | {{ member.age }}岁
                                </div>

                                <!-- <div class="info-text-row select-measure-member"> -->
                                    <!-- <el-button @click="setSelectedMemberId(member.id)" type="primary" v-if="member.id !== measureParams['measureId']"
                                        style="font-size: 20px; height: 40px; width: 120px; ">选择测量</el-button>
                                    <el-button v-else
                                    style="font-size: 20px; height: 40px; width: 120px; background-color: #E0EFFF; color: #0D84FF; border-color: #BADCFF;" >已选择</el-button> -->
                                <!-- </div> -->
                            </div>
                            <div class="divider" v-if="index > 0"></div>
                        </div>
                    </div>
                    
                </div>   
                <p class="no-appointment-text" v-else><img class="image-container"  src="@/assets/icons/数据模型.png">当前无预约！</p>
                
            </div>
        </div>

        <div class="function-area">
            <div class="bottom-left-area">
                <div class="card-container">
                    <div class="card">
                        <div class="card-details" >
                            <div class="guide-icon">
                                <img class="" src="@/assets/icons/drugbox.svg">
                            </div>
                            <p class="text-title">预约详情</p>
                        </div>
                        <button class="card-button" @click="$router.push('/home/medicineBox')">查看详情</button>
                    </div>
                    <div class="card">
                        <div class="card-details" >
                            <div class="guide-icon">
                                <img class="" src="@/assets/icons/hospital.svg">
                            </div>
                            <p class="text-title">接待设置</p>
                        </div>
                        <button class="card-button" @click="$router.push('/home/doctorAppointment')">查看详情</button>
                    </div>
                </div>
                
                
                <!-- 药箱与预约医生区域 -->
                <!-- <div class="medicinebox-area bg-l2 border"  @click="$router.push('/home/medicineBox')">
                    
                    <div class="guide-icon">
                        <img class="" src="@/assets/icons/drugbox.svg">
                    </div>

                    <div class="guide-description">
                        预约详情
                    </div>
                    
                </div> -->

                

                <!-- <div class="appoint-area bg-l2 border"  @click="$router.push('/home/doctorAppointment')">
                    
                    <div class="guide-icon">
                        <img class="" src="@/assets/icons/hospital.svg">
                    </div>
                    <div class="guide-description">
                        接待设置
                    </div>
                    
                </div> -->
                
                <!-- 操作选项区域 -->
                <!-- <div class="options-area border" @click="drawer = true">
                    <el-drawer v-model="drawer" :direction="direction">
                        <template #header>
                            <h4>更多操作</h4>
                        </template>
                        <template #default>
                            <div class="options">
                                <div class="option border" @click="enterPalmVisible = true">
                                    <div class="option-description">
                                        录入掌纹
                                    </div>
                                    <el-dialog v-model="enterPalmVisible" :show-close="false" width="500">
                                        <template #header="{ close, titleId, titleClass }">
                                            <div class="enter-palm-header">
                                                <h4 :id="titleId" :class="titleClass">录入掌纹信息</h4>
                                                <el-button type="danger" @click="close">
                                                    关闭
                                                </el-button>
                                            </div>
                                        </template>
                                        <div class="enter-palm-container">
                                            <EnterPalmMqtt />
                                        </div>
                                    </el-dialog>
                                </div>
                            </div>
                        </template>
                        <template #footer>
                            <div style="flex: auto">
                                <el-button type="primary" @click="drawer = false">关闭</el-button>

                            </div>
                        </template>
                    </el-drawer>
                </div> -->
            </div>

            <!-- <dv-border-box11 title="测量区" :title-width="250" :animate="true"> -->
            <!-- <div class="measure-area bg-l2 border">
                <div class="measure-button-area">
                    <div class="measure-button-area-left">
                        <div class="measure-button-area-left-up">
                            <div class="measure-button measure-heartrate border"
                                @click="setSelectedMeasureType('heart_rate'); measure();">
                            </div>
                            <div class="measure-button measure-bloodoxygen border"
                                @click="setSelectedMeasureType('blood_oxygen'); measure();">
                            </div>
                            <div class="measure-button measure-temperature border"
                                @click="setSelectedMeasureType('body_tem'); measure();">
                            </div>
                        </div>
                        <div class="measure-button-area-left-bottom">
                            <div class="measure-button measure-bloodsugar border"
                                @click="setSelectedMeasureType('blood_sugar'); measure();">
                            </div>
                            <div class="measure-button measure-pressure border"
                                @click="setSelectedMeasureType('pressure'); measure();">
                            </div>
                        </div>
                    </div>

                    <div class="measure-button-area-right">
                        <div class="measure-button measure-all border"
                            @click="setSelectedMeasureType('all'); measurePhySign(measureParams);">
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
        <div class="container">
            <div class="text">made with <img class="image-table" src="@/assets/icons/heart.svg">     by ZDK</div>
        </div>
    </div>
</template>



<style lang="css" scoped>

/* 图片效果 */
.image-table
{
    height: 30px;
    object-fit: contain;
    align-self: center;
    justify-self: center;
}
.image-logo{
  margin-left: 1%;
  max-height: 100%;
  object-fit: contain;
}

/* 卡片效果容器 */
.card-container{
    display: flex;
    margin: 20px;
    gap: 2%;
}

/* 容器动效 */
.container {
  width: 100%;
  height: 100%;
  background: lightblue;
  position: relative;
}

.container::before {
  content: "";
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, #3498db 10%, transparent 20%),
    radial-gradient(circle, transparent 10%, #3498db 20%);
  background-size: 30px 30px; /* Adjust the size of the pattern */
  /* animation: moveBackground 8s linear infinite; Adjust the animation duration and timing function */
  z-index: 0;
}

@keyframes moveBackground {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(0%, 0%);
  }
}

.container .text {
  position: absolute;
  top: 50%;  /* 居中显示 */
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;  /* 确保文本在伪元素之上 */
  font-size: 20px;
  color: #fff;
  font-weight: 700;
}


/* 卡片效果定义 */
.card {
 width: 50%;
 aspect-ratio: 2 / 1;
 border-radius: 20px;
 background: #ffffff;
 position: relative;
 padding: 1.8rem;
 border: 2px solid #c3c6ce;
 transition: 0.5s ease-out;
 overflow: visible;
 
}

.card-details {
 color: black;
 height: 100%;
 gap: .5em;
 display: grid;
 place-content: center;
}

.card-button {
 transform: translate(-50%, 125%);
 width: 60%;
 border-radius: 1rem;
 border: none;
 background-color: #008bf8;
 color: #fff;
 font-size: 1rem;
 padding: .5rem 1rem;
 position: absolute;
 left: 50%;
 bottom: 0;
 opacity: 0;
 transition: 0.3s ease-out;
}

.text-body {
 color: rgb(134, 134, 134);
}

/*Text*/
.text-title {
 font-size: 1.5em;
 font-weight: bold;
}

.no-appointment-text{
    font-size: 1.5em;
    font-weight: bold;
    display: flex;
    justify-content: center; /* 水平居中 */
    align-items: center; /* 垂直居中 */
    padding-left: 5%;
}

/*Hover*/
.card:hover {
 border-color: #008bf8;
 box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
}

.card:hover .card-button {
 transform: translate(-50%, 50%);
 opacity: 1;
}

/* 填充上方空白 */
.doc-header {
    height: 50px;
    background-color: #235cbe;
    line-height: 50px;
    /* display: flex; */
    display: flex;
    align-items: center;
}

.nav-text {
    font-size: 20px;
    color: #fff;
    font-weight: 700;
    padding-left: 30px;
    text-decoration: none;
}


.main-page-container {
    height: 100%;
    width: 100%;
    display: grid;
    grid-template-rows: 8% 28% 56% 5%;
    /* margin: 30px; */
}

/* ---------- 上方用户面板 ---------- */
.no-appointment{
    display: flex;
    justify-content: center; /* 水平居中 */
    align-items: center; /* 垂直居中 */
    height: 100%;
}

.image-container{
    max-height: 100%;
    display: flex;
    justify-content: center; /* 水平居中 */
    align-items: center; /* 垂直居中 */
}

.profile-panel-container {
    padding: 30px 25px 20px 25px;
    min-height: 130px;
}

.profile-panel {
    height: calc(100%);
    display: flex;
    background-color: var(--bgl2-color);
    padding: 0 5px;
}

.profile-item {
    flex-grow: 1;
    display: flex;
    flex-direction: column;
}



.profile-info {
    height: 100%;
    width: 100%;
}

.profile-info .selected-box {
    display: flex;
    margin: 5px 0;
    padding: 15px 20px;
    height: calc(100% - 40px);
    position: relative;
}

.show-border-box {
    transition: 0.35s;
    color: #1487ff;
    /* border: 1px solid #BADCFF; */
    background-color: #E0EFFF;
    border-radius: 10px;
}



.divider {
    position: absolute;
    top: 20px;
    bottom: 20px;
    left: 0px;
    width: 1px;
    background-color: #F2F2F2;
    margin: 0 auto;
}

.profile-info-image {
    display: flex;
    justify-content: center;
}

.profile-info-image img {
    width: 100px;
    height: 100px;
    border-radius: 10px;
}

/* 右侧区域 */
.profile-info-right {
    width: 100%;
    margin-left: 10px;
    display: flex;
    flex-direction: column;
    align-items: space-between;
}

.info-text-row {
    flex: 1;
    display: flex;
    align-items: center;
}

/* 姓名 + 跳转 */

.info-text-row-1 img {
    margin-left: 10px;
    height: 18px;
    width: 18px;
}

.info-text-row-2 {
    justify-content: space-between;
}


/* ---------- 下方功能区 ---------- */

.function-area {
    display: grid;
    grid-template-columns: 100% 0%;
    padding: 0px 25px 30px 25px;
}

/* 主要容器 */
.bottom-left-area {
    height: 100%;
    /* padding-right: 20px;
    display: grid;
    grid-template-rows: 5fr 5fr 2fr;
    gap: 15px; */
}

.guide-icon {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 70%;
}

.guide-icon img {
    height: 75%;
    margin-top: 15px;
}

.guide-description {
    display: flex;
    justify-content: center;
    align-items: top;
    height: 25%;
    font-size: 28px;
}

.options-area {
    background: url('@/assets/mainPage/more-option.png') no-repeat center;
    background-size: cover;
}

.options-area .options .option {
    height: 60px;
    margin: 10px 0 10px 0px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    color: #1487ff;
    border: 1px solid #BADCFF;
    background-color: #E0EFFF;
}


/* 右侧测量区 */

.measure-area {
    display: flex;
}

.measure-button-area {
    width: 100%;
    display: grid;
    grid-template-columns: 75% 25%;
    padding: 20px;
}

.measure-button-area-left {
    display: grid;
    grid-template-rows: 4fr 3fr;
}

.measure-button-area-left-up {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 15px;
    padding-bottom: 10px;
}

.measure-button-area-left-bottom {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
    padding-top: 10px;
}

.measure-button-area-right {
    display: grid;
    padding-left: 20px;
}

.measure-button {
    transition: transform ease-in 0.1s;
}

.measure-button:before,
.measure-button:after {
    position: absolute;
    display: block;
    width: 100%;
    height: 100%;
    z-index: -1000;
    transition: all ease-in-out 0.5s;
    background-repeat: no-repeat;
}

.measure-button:active {
    transform: scale(0.95);
}

/* 各按钮样式 */
/* 样式 - 测量心率 */
.measure-heartrate {
    background: url('@/assets/mainPage/measure-heartrate.png') no-repeat;
    background-size: cover;
}

/* 样式 - 测量血氧 */
.measure-bloodoxygen {
    background: url('@/assets/mainPage/measure-bloodoxygen.png') no-repeat;
    background-size: cover;
}

/* 样式 - 测量体温 */
.measure-temperature {
    background: url('@/assets/mainPage/measure-temperature.png') no-repeat;
    background-size: cover;
}

/* 样式 - 测量血糖 */
.measure-bloodsugar {
    background: url('@/assets/mainPage/measure-bloodsugar.png') no-repeat;
    background-size: cover;
}

/* 样式 - 测量血压 */
.measure-pressure {
    background: url('@/assets/mainPage/measure-pressure.png') no-repeat;
    background-size: cover;
}

/* 样式 - 一键测量 */
.measure-all {
    background: url('@/assets/mainPage/measure-all.png') no-repeat;
    background-size: cover;
}

/* 掌纹录入样式 */
.enter-palm-header {
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
}

.enter-palm-container {
    height: 500px;
}
</style>