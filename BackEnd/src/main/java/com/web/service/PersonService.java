package com.web.service;


import com.web.pojo.DoctorForPerson;
import com.web.pojo.MedicalRecord;


import java.util.List;

public interface PersonService {


    void setType(Integer memberId, Integer chestPain, Integer anginaPectoris);

    List<MedicalRecord> getMedicalRecords(Integer id);


    List<DoctorForPerson> getAppointRecords(Integer memberId);
}
