package com.web.service.impl;

import com.web.mapper.MedicationMapper;
import com.web.mapper.PersonMapper;
import com.web.pojo.DoctorForPerson;
import com.web.pojo.MedicalRecord;
import com.web.service.PersonService;
import com.web.pojo.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service

public class PersonServiceImpl implements PersonService {
    @Autowired
    PersonMapper personMapper;

    @Autowired
    MedicationMapper medicationMapper;



    @Override
    public void setType(Integer memberId, Integer chestPain, Integer anginaPectoris) {
        personMapper.setType(memberId, chestPain, anginaPectoris);
    }

    @Override
    public List<MedicalRecord> getMedicalRecords(Integer id) {
        return medicationMapper.getMedicalRecords(id);
    }

    @Override
    public List<DoctorForPerson> getAppointRecords(Integer memberId) {
        return personMapper.getAppointRecords(memberId);
    }

    @Override
    public List<Advice> getAdvice(Integer memberId) {
        return personMapper.getAdvice(memberId);
    }

    @Override
    public void evaluate(Integer doctorId, Integer memberId, String evaluation) {
        personMapper.evaluate(memberId, doctorId, evaluation);
    }


}
