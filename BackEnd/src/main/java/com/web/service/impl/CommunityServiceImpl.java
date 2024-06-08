package com.web.service.impl;

import com.web.mapper.CommunityMapper;
import com.web.mapper.DoctorMapper;
import com.web.mapper.FamilyMapper;
import com.web.mapper.PersonMapper;
import com.web.pojo.AppointmentShort;
import com.web.pojo.Doctor;
import com.web.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service

public class CommunityServiceImpl implements CommunityService {
    @Autowired
    CommunityMapper communityMapper;

    @Autowired
    FamilyMapper familyMapper;

    @Autowired
    PersonMapper personMapper;

    @Autowired
    DoctorMapper doctorMapper;


    @Override
    public List<Integer> getFamilyIdByCommunityId(Integer communityId) {
        return communityMapper.getFamilyId(communityId);
    }

    @Override
    public List<Doctor> getDoctorByCommunityId(Integer communityId) {
        return communityMapper.getDoctorByCommunityId(communityId);
    }

    @Override
    public Map<Integer, List<AppointmentShort>> getAppointmentLogByCommunityId(Integer communityId) {
        //查doctorId
        List<Doctor> doctors = communityMapper.getDoctorByCommunityId(communityId);
        Map<Integer, List<AppointmentShort>> result = new HashMap<>();
        //接下来获得每个医生对应的Appointment
        //Appointment由    String name String time 组成
        //需要根据医生id，查预约记录表，先得到患者id
        for (Doctor doctor : doctors) {
            List<Integer> personId = doctorMapper.getPersonIdByDoctorId(doctor.getId());
            //再根据患者id，查name，和time
            List<AppointmentShort> appointments = new ArrayList<>();
            for (Integer id : personId) {
                List<String> times = personMapper.getAppointmentTime(id);
                String name = personMapper.getName(id);
                for (String time : times) {
                    appointments.add(new AppointmentShort(name,time));
                }
            }
            result.put(doctor.getId(), appointments);
        }


        // 返回Map<DoctorId,List<Appointment>>
        return result;
    }
}
