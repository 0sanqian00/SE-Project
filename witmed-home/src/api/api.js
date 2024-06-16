import request from '@/utils/request.js'
import { ElMessage } from 'element-plus';

// 家庭成员基本信息接口
export function getMemberInfoService(familyId) {
    return request.get('/family/getMemberInfo',
        {
            params: {
                'familyId': familyId
            }
        })
};

// 家庭成员体征数据接口
export function getPhySignDataService(familyId) {
    return request.get('/family/getPhySignData',
        {
            params: {
                'familyId': familyId
            }
        })
};

// 家庭预约记录接口
export function getAppointRecordService(familyId) {
    return request.get('/family/getAppointRecord',
        {
            params: {
                'familyId': familyId
            }
        })
};

// 历史体征数据接口
export function getMeasureLogService(memberId) {
    return request.get('/person/getMeasureLog',
        {
            params: {
                'memberId': memberId
            }
        })
};

// 疾病预测心绞痛和胸痛更新数据接口
export function setPainService(memberId, chestPain, anginaPectoris) {
    return request.get('/person/setPain',
        {
            params: {
                'memberId': memberId,
                'chestPain': chestPain,
                'anginaPectoris': anginaPectoris
            }
        })
};

// 病历查询接口
export function getMedicalRecordService(memberId) {
    return request.get('/person/getMedicalRecord',
        {
            params: {
                'doctorId': memberId,
            }
        })
};
// 带doctorId的
export function getMedicalRecordService1(doctorId) {
    return request.get('/doctor/getMedicalRecords',
        {
            params: {
                'doctorId': doctorId,
            }
        })
};


// 更改医生权限接口
export function changeGrantDoctorService(doctorId, num) {
    console.log(doctorId, num)
    return request.post('/doctor/updateDoctorAuthority', {
        doctorId: doctorId,
        authority: num
    })
};

//删除医生接口
export function deleteDoctorService(doctorId1) {
    console.log(doctorId1);
    return request.post('/doctor/deleteDoctor?doctorId='+doctorId1)
};

//添加医生接口
export function addDoctorService(id, authority, name, office, title, introduction, image) {
    return request.post('/doctor/addDoctor', {
        id: id,
        authority: authority,
        name: name,
        office: office,
        title: title,
        introduction: introduction,
        image: image
    })
};


// 用药计划接口
export function getDrugPlanService(memberId) {
    return request.get('person/getDrugPlan',
        {
            params: {
                'memberId': memberId,
            }
        })
};

// 药箱接口
export function getDrugBoxService(familyId) {
    return request.get('box/getDrugBox',
        {
            params: {
                'familyId': familyId
            }
        })
};

// 查询医生信息接口
export function getDoctorListService() {
    return request.get('/doctor/getDoctorList',)
};

// 预约医生接口
export function appointDoctorService(appointData) {
    // 无需序列化
    // const params = new URLSearchParams()
    // for(let key in appointData){
    //     params.append(key, appointData[key]);
    // }
    return request.post('/doctor/appointDoctor', appointData)
};

// 医生修改预约信息
export function updateAppointmentStateByDoctorService(appointData) {
    // 无需序列化
    // const params = new URLSearchParams()
    // for(let key in appointData){
    //     params.append(key, appointData[key]);
    // }
    return request.post('/doctor/updateAppointmentStateByDoctor', appointData)
};
// 测量体征接口
export function measurePhySignService(measureParams) {
    const params = new URLSearchParams()
    for(let key in measureParams){
        params.append(key, measureParams[key]);
    }
    return request.post('/measurePhySign', params)
};

// 登陆接口
export function loginService(loginData) {
    // 直接将loginData作为请求的数据，不需要序列化
    return request.post('/user/login', loginData, {
        headers: {
            'Content-Type': 'application/json'
        }
    });
}


