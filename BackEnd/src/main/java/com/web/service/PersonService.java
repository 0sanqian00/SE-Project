package com.web.service;


import com.web.pojo.*;


import java.util.List;

public interface PersonService {


    void setType(Integer memberId, Integer chestPain, Integer anginaPectoris);

    List<MedicalRecord> getMedicalRecords(Integer id);


    List<DoctorForPerson> getAppointRecords(Integer memberId);

    List<Advice> getAdvice(Integer memberId);

    void evaluate(Integer memberId, Integer doctorId, String evaluation);

    List<MeasureLog> getMeasureLogById(Integer id);
    List<DrugPlan> getDrugPlan(Integer id);
}
