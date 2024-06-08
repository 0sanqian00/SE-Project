package com.web.mapper;

import com.web.pojo.AppointmentInfo;
import com.web.pojo.Doctor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DoctorMapper {

    String getDoctorNameByDoctorId(Integer doctorId);
    String getOfficeByDoctorId(Integer doctorId);
    List<Doctor> getDoctorList();
    void appoint(Integer memberId, Integer doctorId, String appointmentTime,Integer order);
    Integer getNumberOfAppointmentsByDoctorId(Integer doctorId,String appointmentTime);

    List<Integer> getPersonIdByDoctorId(Integer doctorId);

    void updateAppointmentStateWithRequest(Integer doctorId, String appointmentTime);

    List<AppointmentInfo> appointmentState(Integer doctorId);

    void updateAppointmentStateByDoctor(AppointmentInfo appointmentInfo);

    void updateRecentAppointmentTime(Integer memberId, Integer doctorId, String appointmentTime);

    void updateDoctorAuthority(Integer doctorId, Integer authority);

    void deleteDoctor(Integer doctorId);

    void addDoctor(Integer doctorId, String name, String office, String image, String title, String introduction, Integer communityId);
}
