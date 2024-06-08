<!-- api使用样例，数据均存储在dataStore -->

<script setup>
import {
  getMemberInfo, getphySignData, getAppointRecord,
  getMeasureLog, getMedicalRecord, getDrugPlan,
  getDrugBox, getDoctorList, setPain,
  measurePhySign, appointDoctor,
} from '@/api/apiUtils.js';
import { ref } from 'vue';
import { useDataStore } from '@/stores/data.js'

// 数据仓库
const dataStore = useDataStore();

// 临时成员ID
const memberId = ref(1);

// 体征测量参数
const measureParams = ref({
    measureType: 'heartRate',
    measureId: '6'
})

// 预约医生参数
const appointData = ref({
    memberId: 1,
    doctorId: 2,
    appointmentTime: '2024-03-04T19:00:00',
})

// 调用
// getMemberInfo();
// getphySignData();
// getAppointRecord();
// getMeasureLog(memberId.value);
// getMedicalRecord(memberId.value);
// getDrugPlan(memberId.value);
// getDrugBox();
// getDoctorList();
      // setPain(memberId.value, 0, 0);
      // measurePhySign(measureParams.value);
      // appointDoctor(appointData.value);

import mqtt from 'mqtt'

let client = null

const connect = () => {
  const options = {
    clientId: 'test', // 客户端 ID
    username: 'abc', // 用户名
    password: '123456' // 密码
  }

  client = mqtt.connect('mqtt://116.204.122.181:1883', options)

  client.on('connect', () => {
    console.log('Connected to MQTT server')
    // client.subscribe('your_topic') // 订阅主题
  })

  client.on('message', (topic, message) => {
    console.log('Received message:', message.toString())
  })
}

const disconnect = () => {
  if (client) {
    client.end()
    console.log('Disconnected from MQTT server')
  }
}

connect()
</script>

<template>
  aaa
  <div class="row">
    <div class="description">家庭成员基本信息 memberInfo</div>
    <div class="sub-description">接口：getMemberInfo<br>参数：familyId</div>
    <div class="data">{{ dataStore.memberInfo }}</div>
  </div>
  <div class="row">
    <div class="description">家庭成员体征数据信息 phySignData</div>
    <div class="sub-description">接口：getPhySignData<br>参数：familyId</div>
    <div class="data">{{ dataStore.phySignData }}</div>
  </div>
  <div class="row">
    <div class="description">家庭预约记录信息 appointRecord</div>
    <div class="sub-description">接口：getAppointRecord<br>参数：familyId</div>
    <div class="data">{{ dataStore.appointRecord }}</div>
  </div>
  <div class="row">
    <div class="description">历史体征数据信息 measureLog</div>
    <div class="sub-description">接口：getMeasureLog<br>参数：memberId</div>
    <div class="data">{{ dataStore.measureLog }}</div>
  </div>
  <div class="row">
    <div class="description">病历信息 medicalRecord</div>
    <div class="sub-description">接口：getMedicalRecord<br>参数：memberId</div>
    <div class="data">{{ dataStore.medicalRecord }}</div>
  </div>
  <div class="row">
    <div class="description">用药计划信息 drugPlan</div>
    <div class="sub-description">接口：getDrugPlan<br>参数：memberId</div>
    <div class="data">{{ dataStore.drugPlan }}</div>
  </div>
  <div class="row">
    <div class="description">药箱信息 drugBox</div>
    <div class="sub-description">接口：getDrugBox<br>参数：familyId</div>
    <div class="data">{{ dataStore.drugBox }}</div>
  </div>
  <div class="row">
    <div class="description">医生信息 doctorList</div>
    <div class="sub-description">接口：getDoctorList<br>参数：无</div>
    <div class="data">{{ dataStore.doctorList }}</div>
  </div>
</template>


<style lang="css" scoped>
.row {
  margin-bottom: 20px;
  padding: 10px;
  background-color: #f5f5f5;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.description {
  font-weight: bold;
  margin-bottom: 5px;
}

.sub-description {
  margin-bottom: 10px;
  font-size: 16px;
}

.data {
  font-size: 14px;
}
</style>