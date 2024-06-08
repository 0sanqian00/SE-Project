package com.web.service.impl;

import com.web.mapper.DoctorMapper;
import com.web.pojo.AppointmentInfo;
import com.web.pojo.AvailableAppointmentTime;
import com.web.pojo.Doctor;
import com.web.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    DoctorMapper doctorMapper;

    @Override
    public List<Doctor> getDoctorList() {
        return doctorMapper.getDoctorList();
    }

    @Override
    public void appoint(Integer memberId, Integer doctorId, String appointmentTime) {
        //1.统计当前医生预约数量
        Integer numberOfAppointments = doctorMapper.getNumberOfAppointmentsByDoctorId(doctorId,appointmentTime);
        //2.插入操作
        doctorMapper.appoint(memberId,doctorId, appointmentTime,numberOfAppointments+1);
        //3.更新预约状态
        doctorMapper.updateAppointmentStateWithRequest(doctorId,appointmentTime);
        //4.更新最近预约时间
        doctorMapper.updateRecentAppointmentTime(memberId,doctorId,appointmentTime);
    }

    @Override
    public List<AppointmentInfo> appointmentState(Integer doctorId) {
        return doctorMapper.appointmentState(doctorId);
    }

    @Override
    public void updateAppointmentStateByDoctor(AvailableAppointmentTime request) {
        AppointmentInfo appointmentInfo = new AppointmentInfo();
        appointmentInfo.setDoctorId(request.getDoctorId());

        for (Map.Entry<String, AvailableAppointmentTime.TimeSlot> entry : request.getTimeSlots().entrySet()) {
            String timeKey = entry.getKey();
            AvailableAppointmentTime.TimeSlot timeSlot = entry.getValue();
            Integer appointmentNum = (timeSlot.getAppointmentNum() == null) ? 0 : timeSlot.getAppointmentNum();

            // 根据时间字符串更新对应的 num 字段
            switch (timeKey) {
                case "09:00":
                    appointmentInfo.setNum1(appointmentNum);
                    break;
                case "10:00":
                    appointmentInfo.setNum2(appointmentNum);
                    break;
                case "13:00":
                    appointmentInfo.setNum3(appointmentNum);
                    break;
                case "14:00":
                    appointmentInfo.setNum4(appointmentNum);
                    break;
                case "15:00":
                    appointmentInfo.setNum5(appointmentNum);
                    break;
                case "16:00":
                    appointmentInfo.setNum6(appointmentNum);
                    break;
                default:
                    // 如果时间点不在预期内，可以选择记录日志或者忽略
                    break;
            }
        }

        // 调用 mapper 执行更新操作
        doctorMapper.updateAppointmentStateByDoctor(appointmentInfo);
    }

    @Override
    public void updateDoctorAuthority(Integer doctorId, Integer authority) {
        doctorMapper.updateDoctorAuthority(doctorId, authority);
    }

    @Override
    public void deleteDoctor(Integer doctorId) {
        doctorMapper.deleteDoctor(doctorId);
    }

    @Override
    public void addDoctor(Integer id, Integer authority, String name, String office, String image, String title, String introduction, Integer communityId) {
        doctorMapper.addDoctor(id, authority, name, office, image, title, introduction, communityId);
    }

}
