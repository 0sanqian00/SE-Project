<script setup>
import { useDataStore } from '@/stores/data.js';
import { getMemberInfo, getphySignData, getMedicalRecord, getDrugPlan, getMeasureLog } from '@/api/apiUtils.js';
import { ref, onMounted, computed } from 'vue';
import { ElEmpty } from 'element-plus';

// 父向子传参，当前用户ID: props.userId
const props = defineProps(['userId']);
// const userId = ref(props.userId);

// 数据仓库
const dataStore = useDataStore();

// getMemberInfo();
// getphySignData();
// 根据id匹配phySignData
function getSignData(personId) {
    console.log(dataStore.phySignData);
    return dataStore.phySignData.find(data => data.personId == personId) || {};
}

// 根据id匹配phySignData
function getMemberInfoData(personId) {
    return dataStore.memberInfo.find(data => data.id == personId) || {};
}

// 最新的预约记录
const latestAppointment = computed(() => {
    const appointments = dataStore.appointRecord.filter(appointment => appointment.personId == props.userId);
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
    <div class="main-container">
        <div class="top-area">
            <!-- 个人面板 -->
            <div class="personal-panel border">
                <!-- 个人信息 -->
                <div class="profile-info">
                    <div class="profile-info-img border">
                        <img :src="getMemberInfoData(userId).image">
                    </div>
                    <div class="profile-info-text">
                        <div class="profile-info-text-name">
                            {{ getMemberInfoData(userId).name }}
                        </div>
                        <div>
                            <div class="profile-info-text-gender">
                                性别：{{ getMemberInfoData(userId).gender }}
                            </div>
                            <div class="profile-info-text-age">
                                年龄：{{ getMemberInfoData(userId).age }}岁
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 体征数据 -->
                <div class="profile-sign-data">
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/heart-icon.png">&nbsp;心率
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).heartRate }} bpm
                        </div>

                    </div>
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/tem-icon.png">&nbsp;体温
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).bodyTem }} °C
                        </div>
                    </div>
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/oxygen-icon.png">&nbsp;血氧
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).bloodOxygen }} %
                        </div>
                    </div>
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/sugar-icon.png">&nbsp;血糖
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).bloodSugar }} mmol/L
                        </div>
                    </div>
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/press-h-icon.png">&nbsp;收缩压
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).highPreasure }} mmHg
                        </div>
                    </div>
                    <div class="sign-data-item border">
                        <div class="sign-data-item-title">
                            <img class="phy-sign-icon" src="@/assets/medicationPlan/press-l-icon.png">&nbsp;舒张压
                        </div>
                        <div class="sign-data-item-value">
                            {{ getSignData(userId).lowPreasure }} mmHg
                        </div>
                    </div>
                </div>

            </div>
            <!-- 预约信息 -->
            <div class="reservation border">
                <div v-if="latestAppointment" class="appointment-info">
                    <div class="info-label-row">
                        <div class="info-label">预约医生：</div>
                        <div class="info-label">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室：</div>
                        <div class="info-label">预约时间：</div>
                        <div class="info-label">排&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</div>
                    </div>
                    <div class="info-data-row">
                        <div class="info-data">{{ latestAppointment.doctorName }}</div>
                        <div class="info-data">{{ latestAppointment.office }}</div>
                        <div class="info-data" style="font-size: 16px;">{{ formatTimeRange(latestAppointment.time) }}
                        </div>
                        <div class="info-data">{{ latestAppointment.order }}</div>
                    </div>
                </div>

                <div v-else style="display: grid; grid-template-rows:4fr 1fr;">
                    <div style="display: flex; align-items: center; justify-content: center;">
                        <img style="height: 100px;" src="@/assets/medicationPlan/no-reservation.png">
                    </div>
                    <div
                        style="display: flex; align-items: center; justify-content: center; color: #60758C; font-size: 20px;">
                        暂无预约信息</div>
                </div>

            </div>
        </div>
        <div class="bottom-area">
            <!-- 病历 -->
            <div class="medical-record border">
                <!-- 身体状况 -->
                <div class="health-condition">
                    <div class="health-condition-title">
                        <div>身体状况</div>
                        <div style="font-size: 16px;">{{ formatTimeRange(dataStore.medicalRecord[0].datetime) }}</div>
                    </div>
                    <div class="health-condition-content">
                        诊断：{{ dataStore.medicalRecord[0].condition }} <br />
                        症状：{{ dataStore.medicalRecord[0].sympton }}
                    </div>
                </div>
                <!-- 医生建议 -->
                <div class="doctor-advice">
                    <div class="doctor-advice-title">
                        医生建议
                    </div>
                    <div class="doctor-advice-content">
                        {{ dataStore.medicalRecord[0].advice }}
                    </div>
                </div>
                <!-- 更多病历 -->
                <div class="more-record">
                    <div class="more-record-btn">
                        更多病历<img style="height: 14px; margin-left: 5px;" src="@/assets/medicationPlan/jump-to.png"
                            alt="">
                    </div>
                </div>
            </div>
            <div class="medication-plan-table border">
                <div class="table-title">
                    <div class="title-name">药物</div>
                    <div class="title-usage">使用方法</div>
                    <div class="title-box">所在药箱</div>
                    <div class="title-time">下次用药时间</div>
                </div>
                <div class="table-body scrollbar-box">
                    <div class="drug-plan-tr" v-for="(medicine, index) in dataStore.drugPlan" :key="index">
                        <div class="drug-plan-medication">
                            <div class="drug-img">
                                <img src="@/assets/icons/drugType/drug_capsule.svg"
                                    v-if="medicine.type === 'capsule'" />
                                <img src="@/assets/icons/drugType/drug_tablet.svg" v-if="medicine.type === 'tablet'" />
                                <img src="@/assets/icons/drugType/drug_pellet.svg" v-if="medicine.type === 'pellet'" />
                                <img src="@/assets/icons/drugType/drug_liquid.svg" v-if="medicine.type === 'liquid'" />
                            </div>
                            <div class="drug-description">
                                <p class="drug-name">{{ medicine.name }}</p>
                                <p class="drug-attach">{{ medicine.description }}</p>
                            </div>
                        </div>
                        <div class="drug-usage">一日{{ medicine.useFrequency }}次,{{ medicine.useMethod }}</div>
                        <div class="drug-box">
                            <el-tag v-if="medicine.boxId == 1" size="large" style="font-size: 18px;">药箱 {{
                                medicine.boxId }}</el-tag>
                            <el-tag v-else-if="medicine.boxId == 2" type="success" size="large"
                                style="font-size: 18px;">药箱 {{
                                    medicine.boxId }}</el-tag>
                            <el-tag v-else-if="medicine.boxId == 3" type="warning" size="large"
                                style="font-size: 18px;">药箱 {{
                                    medicine.boxId }}</el-tag>
                            <el-tag v-else-if="medicine.boxId == 4" type="danger" size="large"
                                style="font-size: 18px;">药箱 {{
                                    medicine.boxId }}</el-tag>
                        </div>
                        <div class="drug-time">{{ formatTimeRange(medicine.nextUseTime).slice(5) }}</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</template>

<style lang="css" scoped>
.main-container {
    height: calc(100vh - 65px - 50px);
    padding: 20px 25px 30px 25px;

    display: grid;
    grid-template-rows: 2fr 5fr;
    gap: 15px;


}

.top-area {
    display: grid;
    grid-template-columns: 7fr 2fr;
    gap: 15px;
}

/* 个人面板 */
.top-area .personal-panel {
    background-color: #fff;
    display: grid;
    grid-template-columns: 1.1fr 2fr;
}

/* 个人面板 - 个人信息 */
.profile-info {
    margin: 20px;
    display: flex;
    border-right: 1px solid #E9E9E9;
}


.profile-info-img {
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
}

.profile-info-img img {
    height: 150px;
    width: 150px;
}

.profile-info-text {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-left: 15px;
}

.profile-info-text-name {
    font-size: 28px;
    font-size: 700;
}

.profile-info-text-gender,
.profile-info-text-age {
    font-size: 20px;
    color: #656F8E;

}

.profile-info-text-age {
    margin-top: 5px;
    margin-bottom: 10px;
}

/* 个人面板 - 体征数据 */
.profile-sign-data {
    display: grid;
    grid-template-rows: 1fr 1fr;
    grid-template-columns: 1fr 1fr 1fr;
    margin: 20px 20px 20px 0;
}

.phy-sign-icon {
    height: 32px;
    width: 32px;
}

.sign-data-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.sign-data-item-title {
    display: flex;
    align-items: center;
    font-size: 20px;
    color: #404169;
}

.sign-data-item-value {
    margin-left: 40px;
    font-size: 20px;
}

/* 个人面板 - 预约信息 */
.top-area .reservation {
    background-color: #fff;
    padding: 30px 20px;

}

.appointment-info {
    display: flex;
    justify-content: center;
    height: 100%;
}

.info-label-row,
.info-data-row {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    font-size: 18px;
}

.info-label-row {

    color: #60758C;
}

.el-empty {
    padding: 0;
}

.el-empty :deep(.el-empty__description) {
    font-size: 24px !important;
}

/* 下方 */
.bottom-area {
    display: grid;
    grid-template-columns: 10fr 23fr;
    gap: 20px;
}

/* 病历 */
.bottom-area .medical-record {
    background: url('@/assets/medicationPlan/record-bg.png') no-repeat;
    background-size: cover;
    padding: 25px;
    display: grid;
    grid-template-rows: 1fr 2.2fr 0.4fr;
}

.health-condition {
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.health-condition-title,
.doctor-advice-title {
    font-size: 22px;
    color: rgba(255, 255, 255, 0.75)
}

.health-condition-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.doctor-advice-title {
    margin-top: 15px;
}

.health-condition-content,
.doctor-advice-content {
    font-size: 20px;
    color: #fff;
    margin-top: 15px;
}

.more-record {
    display: flex;
    justify-content: right;
    align-items: center;
}

.more-record-btn {
    width: 120px;
    height: 40px;
    background-color: rgba(235, 235, 255, 0.18);
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    color: #fff;
}

.more-record-btn:hover {
    background-color: rgba(235, 235, 255, 0.5);
}

/* 用药计划表格 */
.bottom-area .medication-plan-table {
    background-color: #fff;
    height: 100%;
    width: 100%;
    display: grid;
    grid-template-rows: 10% 90%;
}

.table-title {
    border-bottom: 1px solid #efefef;
    font-size: 20px;
    color: #0075D7;
    font-weight: 600;
    text-align: center;
    display: grid;
    margin: 0 20px;
    grid-template-columns: 4fr 3fr 2fr 2fr;
}

.title-name,
.title-usage,
.title-box,
.title-time {
    display: flex;
    align-items: center;
    justify-content: center;
}

.table-body {
    overflow-y: auto;
    padding: 0 20px;
    height: 420px;
}

.drug-plan-tr {
    display: grid;
    grid-template-columns: 4fr 3fr 2fr 2fr;
    transition: 0.2s;
    border-bottom: 1px solid #E9E9E9;
    height: 100px;
}

.drug-plan-medication {
    margin-left: 10px;
    display: flex;
}

.drug-plan-medication p {
    margin: 0;
}

.drug-img {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
}

.drug-img img {
    background-color: #e9f5ff;
    border-radius: 8px;
    height: 60px;
    width: 60px;
}

.drug-description {
    display: flex;
    flex-direction: column;
    justify-content: center;
    /* align-items: center; */
}

.drug-name {
    font-size: 20px;
    font-weight: 700;
}

.drug-attach {
    font-size: 16px;
    color: #7F7F7F;
}

.drug-usage,
.drug-box,
.drug-time {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}
</style>