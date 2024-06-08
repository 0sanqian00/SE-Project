package com.web.service.impl;

import com.web.mapper.DoctorMapper;
import com.web.mapper.FamilyMapper;
import com.web.pojo.Appointment;
import com.web.pojo.Person;
import com.web.service.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FamilyServiceImpl implements FamilyService {

    @Autowired
    FamilyMapper familyMapper;
    @Autowired
    DoctorMapper doctorMapper;

    /**
     * 获取指定家庭全部成员信息
     *
     * @param familyId 家庭id
     * @return 家庭成员信息
     */
    @Override
    public List<Person> getMemberInfo(Integer familyId) {
        return familyMapper.getMemberInfo(familyId);

    }


    @Override
    public Map<Integer, List<Appointment>> getAppointmentsByFamilyId(Integer familyId) {
        Map<Integer, List<Appointment>> appointments = new HashMap<>();
        //1. 根据家庭ID查询家庭成员ID
        List<Integer> memberId = familyMapper.getFamilyMemberId(familyId);
        for (Integer id : memberId) {
            //2.遍历memberId，查询预约记录
            List<Appointment> records = familyMapper.getAppointmentsByMemberId(id);
            //3.遍历doctorId增加医生信息
            for (Appointment record : records) {
                Integer doctorId = record.getDoctorId();
                record.setDoctorName(doctorMapper.getDoctorNameByDoctorId(doctorId));
                record.setOffice(doctorMapper.getOfficeByDoctorId(doctorId));
            }
            appointments.put(id, records);
        }
        return appointments;
    }
}
