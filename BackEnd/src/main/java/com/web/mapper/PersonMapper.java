package com.web.mapper;

import com.web.pojo.DoctorForPerson;
import com.web.pojo.MeasureLog;
import com.web.pojo.MedicalRecord;
import com.web.pojo.Advice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PersonMapper {

    List<MeasureLog> getMeasureLogById(Integer id);
    void setType(Integer memberId, Integer chestPain, Integer anginaPectoris);

    Integer getFamilyIdByMemberId(Integer id);

    String getName(Integer id);
    String getPrediction(Integer id);
    List<String> getAppointmentTime(Integer id);
    List<DoctorForPerson> getAppointRecords(Integer memberId);

    List<Advice> getAdvice(Integer memberId);

    void evaluate(Integer memberId, Integer doctorId, String evaluation);
}
