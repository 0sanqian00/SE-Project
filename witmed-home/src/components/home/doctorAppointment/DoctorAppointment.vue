<script setup>
import { getDoctorList, updateAppointmentStateByDoctor } from '@/api/apiUtils.js';
import { ref,computed } from 'vue';
import { useDataStore } from '@/stores/data.js'
import dayjs from 'dayjs'
import { ElMessage } from 'element-plus';

// 数据仓库
const dataStore = useDataStore();
getDoctorList();

// 预约医生参数
const appointData = ref({
    // appointmentNum: null,
    doctorId: 1,
    timeSlots:{
    '09:00':{
        appointmentNum: null,
    },
    '10:00':{
        appointmentNum: null,
    },
    '13:00':{
        appointmentNum: null,
    },
    '14:00':{
        appointmentNum: null,
    },
    '15:00':{
        appointmentNum: null,
    },
    '16:00':{
        appointmentNum: null,
    },
    }
    // appointmentTime: '',
})

// 判断appointData是否全空
const isNotAllNull = computed(() => {
  // 创建 appointData.value 的副本
  let copyData = { ...appointData.value };
  
  // 删除副本中的 doctorId
  delete copyData.doctorId;

  // 检查剩余的值是否全部为空
  return Object.values(copyData).some(
    timeSlot => timeSlot && timeSlot.appointmentNum !== null);
});

// 可预约时间段(起始, 加2h)
const availableTimeList = ['09:00', '10:00','13:00','14:00', '15:00', '16:00']

const availablePeopleList = [0,1,2,3,4,5,6,7,8,9,10];

// 医生级联选择器
const doctorSelectorOptions = [];
// 按照office将医生分类，并赋值给doctorSelectorOptions，用作级联选择器参数
dataStore.doctorList.forEach(doctor => {
    let officeIndex = doctorSelectorOptions.findIndex(option => option.value === doctor.office);
    if (officeIndex === -1) {
        doctorSelectorOptions.push({
            value: doctor.office,
            label: doctor.office,
            children: [{
                value: doctor.id.toString(),
                label: doctor.name
            }]
        });
    } else {
        doctorSelectorOptions[officeIndex].children.push({
            value: doctor.id.toString(),
            label: doctor.name
        });
    }
});
const props = {
    expandTrigger: 'hover', // 子节点展开方式
};
const handleDoctorSelector = (value) => {
    appointData.value['doctorId'] = value[1];  // 将选择的医生id赋值给appointData
}

// 时间选择器
const selectedDate = new Date()
const selectedTime = ref([])
const disabledDate = (time) => {
    return time.getTime() < Date.now();
}
const handleCardClick = function (time) {
    if (!this.selectedDate) {
        ElMessage('请先选择日期');
    } else {
        // 将选择的日期与时间拼接为'2024-03-16T15:00:00'的形式
        if(!selectedTime.value.includes(time))
        {
            selectedTime.value.push(time);
            console.log(selectedTime);
        }
        else{
            let index = selectedTime.value.indexOf(time);
            if (index !== -1) {
                selectedTime.value.splice(index, 1);
            }
        }
        const date = dayjs(selectedDate.value).format('YYYY-MM-DD');
        // appointData.value['appointmentTime'] = `${date}T${time}:00`;
    }
}
// 将availableTimeList的时间处理为'${hour}:${minute}~${endHour}:${endMinute}'格式
function formatTimeRange(time) {
    const [hour, minute] = time.split(':');
    const endHour = parseInt(hour) + 1;
    const endMinute = minute;
    return `${hour}:${minute}~${endHour}:${endMinute}`;
};

// 获取选择人的头像url
function getImageUrl(Id, flag) {
    if (flag === 'user') {
        const member = dataStore.memberInfo.find(member => member.id === Id);
        return member ? member.image : '';
    }
    else if (flag === 'doctor') {
        const doctor = dataStore.doctorList.find(doctor => doctor.id === Id);
        return doctor ? doctor.image : '';
    }
}

// 带打印的appointDoctor
function appoint(data){
    console.log(data)
    updateAppointmentStateByDoctor(data)
    ElMessage.success("设置成功")
}
</script>

<template>
    <div class="doctor-appoint-container">
        <div class="header">
            <div class="options" style="display: flex; align-items: center;">
                <router-link to="/home">
                    <div class="nav-btn">
                        <img style="height: 20px; margin-right: 5px;" src="@/assets/mainPage/home.png">回到主页
                    </div>
                </router-link>
            </div>
        </div>
        <div class="main">
            <!-- 预约区域 -->
            <div class="appoint-area border">
                <!-- <div class="people-selector ">
                    <div class="selector-heading">
                        <div
                            style="height: 20px; width: 6px; background: linear-gradient(to bottom, #0477FD, #3C42E0); border-radius: 5px;">
                        </div>
                        <div style="margin-left: 5px;">可接待病人人数：</div>
                    </div>

                    
                    <div class="user-selector selector-box">
                        <el-select v-model="appointData['appointmentNum']" placeholder="选择可接待病人人数"
                            style="border-radius: 8px; overflow: hidden;">
                            
                            <el-option v-for="item in availablePeopleList" :key="item" :label="item"
                                :value="item" />
                        </el-select>
                    </div>
                    
                    

                </div> -->
                <!-- 预约时间选择 -->
                <div class="date-selector">
                    <div class="selector-heading">
                        <div
                            style="height: 20px; width: 6px; background: linear-gradient(to bottom, #0477FD, #3C42E0); border-radius: 5px;">
                        </div>
                        <div style="margin-left: 5px;">可预约时间和对应时段可接待病人数选择：</div>
                    </div>
                    <el-form style="display: grid;grid-template-columns: repeat(3, 1fr); gap: 10px;">
                        <!-- <el-date-picker v-model="selectedDate" type="date" placeholder="选择日期" locale="zh-cn"
                            :disabled-date="disabledDate" style="width: 100%; height: 60px; font-size: 22px;" /> -->
                        <div v-for="time in availableTimeList" :key="time" >
                            
                            <el-card @click="handleCardClick(time)" :class="{ 'selected':  selectedTime.includes(time) }"
                            style="margin-top: 10px; font-size: 22px; display: flex; justify-content: center; align-items: center; text-align: center;border: none;border-radius: 20px; box-shadow: none;box-sizing: border-box;  background-color: #EFEFEF; color: #000;min-height: 250px">
                            {{ formatTimeRange(time) }}
                            <el-select v-model="appointData['timeSlots'][time].appointmentNum" placeholder="选择可接待病人人数"
                            style="overflow: hidden;min-width: 150px;" :disabled="!selectedTime.includes(time)">
                            <!-- <el-option v-for="item in dataStore.memberInfo" :key="item.id" :label="item.name"
                                :value="item.id" /> -->
                            <el-option v-for="item in availablePeopleList" :key="item" :label="item"
                                :value="item" />
                            </el-select>
                            </el-card>
                        
                        </div>
                        <!-- <el-card @click="handleCardClick(time)" v-for="time in availableTimeList" :key="time"
                            :class="{ 'selected':  selectedTime.includes(time) }"
                            style="margin-top: 10px; font-size: 22px; display: flex; justify-content: center; border: none; box-shadow: none;box-sizing: border-box;  background-color: #EFEFEF; color: #000;">
                            {{ formatTimeRange(time) }}
                        </el-card> -->
                        
                    </el-form>
                </div>

                
                <div class="confirm-appoint-btn-area">
                    <!-- <el-button @click="appointDoctor(appointData)"
                        :disabled="!appointData['appointmentTime'] || !appointData['doctorId'] || !appointData['memberId']"
                        style="width: 100%; font-size: 20px; height: 55px; border-radius: 4px; background-color: #0D84FF; color: #fff;"
                        size="large">确定预约</el-button> -->
                    <input value="确定预约" type="submit" class="login-button" @click="appoint(appointData)"
                        :disabled="!selectedTime.length"
                        style="width: 100%; font-size: 20px; height: 55px; border-radius: 4px; background-color: #0D84FF; color: #fff;"
                        size="large" />
                </div>
            </div>

            <!-- 医生信息区域 -->
            <!-- <div class="doctor-info-area border scrollbar-box">
                <div class="doctor-info-warpper border">
                    <div class="doctor-card-container " v-for="doctor in dataStore.doctorList" :key="doctor.id">
                        <div class="doctor-card border">
                            <div class="doctor-card-left">
                                <div class="doctor-image">
                                    <div style="height: 60px; width: 60px; border-radius: 50%;overflow: hidden;">
                                        <img :src="doctor.image" style="height: 60px; width: 60px;" />
                                    </div>
                                </div>
                                <div class="doctor-name">
                                    {{ doctor.name }}
                                </div>
                                <div class="doctor-rank">
                                    {{ doctor.title }}
                                </div>
                                <div class="doctor-office">
                                    <div
                                        style="height: 30px; width: 80px; display: flex;  align-items: center; justify-content: center; border: 1px solid #fff;border-radius: 15px;">
                                        {{ doctor.office }}</div>
                                </div>
                            </div>
                            <div class="doctor-card-right">
                                <div class="doctor-card-about">
                                    <img src="@/assets/doctorAppointment/doctor-icon.png"
                                        style="height: 26px; width: 26px; margin-right: 5px;" />个人简介
                                </div>
                                <div class="doctor-card-introdution">
                                    {{ doctor.introduction }}
                                </div>
                                <div class="doctor-card-btn-area">
                                    <div class="doctor-card-btn" @click="appointData['doctorId'] = doctor.id">
                                        点击预约
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="selected-flag" v-if="doctor.id == appointData['doctorId']">
                            <img src="@/assets/doctorAppointment/selected-flag.png"
                                style="height: 50px; width: 50px; margin-right: 5px;" />
                        </div>
                    </div>
                </div>

            </div> -->
        </div>

    </div>
</template>



<style lang="css" scoped>

/* 确认预约、带hover的button */
.login-button {
  display: block;
  width: 100%;
  font-weight: bold;
  background: linear-gradient(
    45deg,
    rgb(16, 137, 211) 0%,
    rgb(18, 177, 209) 100%
  );
  color: white;
  padding-block: 15px;
  margin: 20px auto;
  border-radius: 20px;
  box-shadow: rgba(133, 189, 215, 0.8784313725) 0px 20px 10px -15px;
  border: none;
  transition: all 0.2s ease-in-out;
}

.login-button:hover {
  transform: scale(1.03);
  box-shadow: rgba(133, 189, 215, 0.8784313725) 0px 23px 10px -20px;
}

.login-button:active {
  transform: scale(0.95);
  box-shadow: rgba(133, 189, 215, 0.8784313725) 0px 15px 10px -10px;
}

/* 输入样式 */





.doctor-appoint-container {
    height: 100%;
    width: 100%;
}

/* header栏 */
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


/* 主体区域 */
.main {
    height: calc(100% - 65px - 40px);
    width: calc(100% - 40px);
    display: grid;
    grid-template-columns: 10fr 0fr;
    margin: 20px;
    gap: 20px
}


/* 预约区域 */
.appoint-area {
    height: calc(100% -24px);
    display: grid;
    grid-template-rows: 8fr 2fr;
    background-color: #fff;
    padding: 12px;
}

.people-selector {
    display: grid;
    height: 100%;
    grid-template-rows: 1.2fr 2fr 2fr;
}

.date-selector {
    /* background-color: gray; */
    display: grid;
    height: 100%;
    grid-template-rows: 2fr 15fr;
}

.confirm-appoint-btn-area {
    /* background-color: pink; */
    display: flex;
    justify-content: center;
    align-items: center;
}

.selector-heading {
    font-size: 22px;
    font-weight: 600;
    /* margin-bottom: 15px; */
    display: flex;
    align-items: center;
}

:deep(.el-select__wrapper) {
    font-size: 22px !important;
    height: 55px !important;
    background-color: #F3F4FD !important;
}

:deep(.el-input__wrapper) {
    font-size: 22px !important;
    height: 55px !important;
    background-color: #F3F4FD !important;
}

.selected {
    background-color: #DEEEFF !important;
    border: 1px solid #B5D9FF !important;
    color: #0D84FF !important;
}

/* 医生信息区 */
.doctor-info-area {
    overflow-y: auto;
    /* background-color: #fff; */
    position: relative;
}

.doctor-info-warpper {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    overflow: hidden;
}

.doctor-card-container {
    width: 100%;
    height: 100%;
    position: relative;
}

.selected-flag {
    position: absolute;
    top: 0;
    right: 0;
    /* background-color: pink; */
}

.doctor-card {
    height: 220px;
    width: 100%;
    margin-bottom: 20px;
    padding: 6px;
    display: flex;
    background-color: #fff;
}



.doctor-card-left {
    width: 180px;
    background: url('@/assets/doctorAppointment/doctor-bg.png') no-repeat center;
    background-size: cover;
    display: grid;
    grid-template-rows: 2.5fr 1fr 1fr 1.2fr;
}

.doctor-image,
.doctor-name,
.doctor-rank,
.doctor-office {
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
}

.doctor-name {
    font-size: 28px;
}

.doctor-rank,
.doctor-office {
    font-size: 18px;
}

.doctor-card-right {
    flex: 1;
    /* padding: 0 15px; */
    margin: -5px 15px;
    display: grid;
    grid-template-rows: 3fr 5fr 3fr;
}

.doctor-card-about {
    display: flex;
    align-items: center;
    color: #384049;
    font-size: 20px;
}


.doctor-card-introdution {
    font-size: 18px;
    color: #6D7E93;
    line-height: 1.5;
}

.doctor-card-btn-area {
    display: flex;
    justify-content: right;

}

.doctor-card-btn {
    height: 45px;
    width: 115px;
    background-color: #0D84FF;
    color: #fff;
    font-size: 20px;
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>