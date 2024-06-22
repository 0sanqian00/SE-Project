// dataStore数据仓库
// 存储家庭所需所有数据

import { defineStore } from 'pinia'
import { ref } from 'vue';

export const useDataStore = defineStore('data', () => {
    // 家庭ID
    const familyId = ref('');
    const setFamilyId = (newData) => { familyId.value = newData; }

    // 家庭成员基本信息
    const memberInfo = ref([]);
    const setMemberInfo = (newData) => { memberInfo.value = newData; }

    // 家庭成员体征数据信息
    const phySignData = ref([]);
    const setPhySignData = (newData) => { phySignData.value = newData; }

    // 家庭预约记录信息
    const appointRecord = ref({});
    const setAppointRecord = (newData) => { appointRecord.value = newData; }

    // 历史体征数据信息
    const measureLog = ref([]);
    const setMeasureLog = (newData) => { measureLog.value = newData; }

    // 病历信息
    const medicalRecord = ref([]);
    const setMedicalRecord = (newData) => { medicalRecord.value = newData; }

    // 带doctorId
    const medicalRecord1 = ref([]);
    const setMedicalRecord1 = (newData) => { medicalRecord1.value = newData; }

    // 用药计划信息
    const drugPlan = ref([]);
    const setDrugPlan = (newData) => { drugPlan.value = newData; }

    // 药箱信息
    const drugBox = ref([]);
    const setDrugBox = (newData) => { drugBox.value = newData; }

    // 预约医生信息
    const doctorList = ref([]);
    const setDoctorList = (newData) => { doctorList.value = newData; }

    // 医生评价信息
    const Evaluation = ref([]);
    const setEvaluation = (newData) => { Evaluation.value = newData; }

    return {
        familyId, setFamilyId,
        memberInfo, setMemberInfo,
        phySignData, setPhySignData,
        appointRecord, setAppointRecord,
        measureLog, setMeasureLog,
        medicalRecord, setMedicalRecord,
        medicalRecord1, setMedicalRecord1,
        drugPlan, setDrugPlan,
        drugBox, setDrugBox,
        doctorList, setDoctorList,
        Evaluation, setEvaluation
    };
}, {
    // 持久化存储
    persist: true
});
