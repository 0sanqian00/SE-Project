import {
    getMemberInfoService, getPhySignDataService, getAppointRecordService,
    getMeasureLogService, setPainService, getMedicalRecordService,
    getDrugPlanService, getDrugBoxService, getDoctorListService,
    appointDoctorService, measurePhySignService,getMedicalRecordService1,updateAppointmentStateByDoctorService, changeGrantDoctorService,
    deleteDoctorService, addDoctorService,addDoctorAdviceService, getEvaluation
} from '@/api/api.js';
import { ref } from 'vue';
import { useDataStore } from '@/stores/data.js'

// 数据仓库
const dataStore = useDataStore();

// 家庭成员基本信息
export const getMemberInfo = async function () {
    let data = await getMemberInfoService(dataStore.familyId);
    dataStore.setMemberInfo(data);
}

// 家庭成员体征数据信息
export const getphySignData = async function () {
    let data = await getPhySignDataService(dataStore.familyId);
    console.log(dataStore.familyId);
    // console.log(data.headers)
    // if (data.headers['Content-Type'] === "text/html") {
    //     console.log('data is a string');
    // } 
    // else {
    //     console.log('data is not a string');
    //     dataStore.setPhySignData(data);
    // }
    dataStore.setPhySignData(data);
      
}

// 家庭预约记录信息
export const getAppointRecord = async function () {
    let data = await getAppointRecordService(dataStore.familyId);
    dataStore.setAppointRecord(data[dataStore.familyId]);
}

// 历史体征数据信息
export const getMeasureLog = async function (memberId) {
    let data = await getMeasureLogService(memberId);
    console.log(data)
    // if (data.headers['Content-Type'] === "text/html"){
    //     console.log('data is a string');
    // } 
    // else {
    //     console.log('data is not a string');
    //     dataStore.setMeasureLog(data);
    // }
    dataStore.setMeasureLog(data);
    
}

// 病历信息
export const getMedicalRecord = async function (memberId) {
    let data = await getMedicalRecordService(memberId);
    dataStore.setMedicalRecord(data);
}
//输入医生id
export const getMedicalRecord1 = async function (doctorId) {
    let data = await getMedicalRecordService1(doctorId);
    console.log(data);
    dataStore.setMedicalRecord1(data);
}

// 更改医生权限
export const changeGrantDoctor = async function (doctorId, num) {
    let data = await changeGrantDoctorService(doctorId, num);
    console.log(data)
}

// 添加医生
export const addDoctor = async function (id, authority, name, office, title, introduction, image) {
    let data = await addDoctorService(id, authority, name, office, title, introduction, image);
    console.log(data)
}

// 添加医嘱
export const addDoctorAdvice = async function (MemberId, DoctorId, advice) {
    let data = await addDoctorAdviceService(MemberId, DoctorId, advice);
    console.log(data)
}

export const deleteDoctor = async function (doctorId) {
    let data = await deleteDoctorService(doctorId);
    console.log(data)
}

// 疾病预测心绞痛和胸痛更新数据
export const setPain = async function (memberId, chestPain, anginaPectoris) {
    let data = await setPainService(memberId, chestPain, anginaPectoris);
}

// 用药计划信息
export const getDrugPlan = async function (memberId) {
    let data = await getDrugPlanService(memberId);
    console.log(data)
    // console.log(data.headers)
    // if (data.headers['Content-Type'] === "text/html") {
    //     console.log('data is a string');
    // } 
    // else {
    //     console.log('data is not a string');
    //     dataStore.setDrugPlan(data);
    // }
    dataStore.setDrugPlan(data);
}

// 药箱信息
export const getDrugBox = async function () {
    let data = await getDrugBoxService(dataStore.familyId);
    dataStore.setDrugBox(data);
}

// 医生信息
export const getDoctorList = async function () {
    let data = await getDoctorListService();
    console.log(data)
    dataStore.setDoctorList(data);
}


// 医生评价信息
export const getEva = async function () {
    let data = await getEvaluation();
    console.log(data)
    dataStore.setEvaluation(data);
}

// 体征测量
export const measurePhySign = async function (measureParams) {
    let result = await measurePhySignService(measureParams);
}

// 预约医生
export const appointDoctor = async function (appointData) {
    let result = await appointDoctorService(appointData);
}

// 医生修改预约
export const updateAppointmentStateByDoctor = async function (appointData) {
    let result = await updateAppointmentStateByDoctorService(appointData);
}
