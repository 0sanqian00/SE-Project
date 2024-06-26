package com.web.service;

import com.web.pojo.AppointmentInfo;
import com.web.pojo.AvailableAppointmentTime;
import com.web.pojo.Doctor;
import com.web.pojo.Evaluation;

import java.util.List;

public interface DoctorService {
    List<Doctor> getDoctorList();

    void appoint(Integer memberId, Integer doctorId, String appointmentTime);

    List<AppointmentInfo> appointmentState(Integer doctorId);

    void updateAppointmentStateByDoctor(AvailableAppointmentTime request);



    void deleteDoctor(Integer doctorId);

    void addDoctor(Integer id, Integer authority, String name, String office, String image, String title, String introduction, Integer communityId);

    void updateDoctorAuthority(Integer doctorId, Integer authority);

    void setAdvice(Integer memberId, Integer doctorId, String adviceContent);

    List<Evaluation> getEvaluation();
}
