package com.web.controller;

import com.web.pojo.*;
import com.web.service.DoctorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    DoctorService doctorService;

    /**
     * 查询医生信息
     *
     * @return 医生信息
     */
    @RequestMapping("/getDoctorList")
    public List<Doctor> getDoctorList() {
        return doctorService.getDoctorList();
    }

    /**
     * 预约医生
     *
     */
    @RequestMapping(value = "/appointDoctor", method = RequestMethod.POST)
    public void appoint(@RequestBody AppointmentRequest request) {

        Integer memberId = request.getMemberId();
        Integer doctorId = request.getDoctorId();
        String  appointmentTime = request.getAppointmentTime();
        //打印接收的参数
        System.out.println("接收到的参数：\nmemberId: " + memberId
                + "\ndoctorId: " + doctorId
                + "\nappointmentTime:" + appointmentTime);

        doctorService.appoint(memberId, doctorId, appointmentTime);
    }

    /**
     * 查询医生的预约状态
     *
     *
     */

    @RequestMapping(value = "/appointmentState", method = RequestMethod.GET)
    public List<AppointmentInfo> appointmentState(@RequestParam Integer doctorId) {
        return doctorService.appointmentState(doctorId);
    }

    /**
     * 修改预约信息
     *
     *
     */
    @RequestMapping(value = "/updateAppointmentStateByDoctor", method = RequestMethod.POST)
    public void updateAppointmentStateByDoctor(@RequestBody AvailableAppointmentTime request) {
        doctorService.updateAppointmentStateByDoctor(request);
    }

    /**
     * 修改医生权限
     *
     *
     */
    @RequestMapping(value = "/updateDoctorAuthority", method = RequestMethod.POST)
    public void updateDoctorAuthority(@RequestBody DoctorAuthority request) {
        Integer doctorId = request.getDoctorId();
        Integer authority = request.getAuthority();
        doctorService.updateDoctorAuthority(doctorId, authority);
    }

    /**
     * 删除医生信息
     *
     *
     */

    @RequestMapping(value = "/deleteDoctor", method = RequestMethod.POST)
    public void deleteDoctor(@RequestParam Integer doctorId) {
        doctorService.deleteDoctor(doctorId);
    }

    /**
     * 增添医生信息
     *
     *
     */
    @RequestMapping(value = "/addDoctor", method = RequestMethod.POST)
    public void addDoctor(@RequestBody Doctor doctor) {
        Integer id = doctor.getId();
        Integer authority = doctor.getAuthority();
        String name = doctor.getName();
        String office = doctor.getOffice();
        String title = doctor.getTitle();
        String introduction = doctor.getIntroduction();
        String image = doctor.getImage();
        Integer communityId = 1;
        doctorService.addDoctor(id, authority, name, office, title, introduction, image, communityId);
    }

    /**
     * 设置医嘱
     *
     *
     */
    @RequestMapping(value = "/setAdvice", method = RequestMethod.POST)
    public void setAdvice(@RequestBody Advice advice) {
        Integer memberId = advice.getMemberId();
        Integer doctorId = advice.getDoctorId();
        String adviceContent = advice.getAdvice();
        doctorService.setAdvice(memberId, doctorId, adviceContent);
    }
}
