package com.web.controller;


import com.web.pojo.AppointmentShort;
import com.web.pojo.Doctor;
import com.web.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/community")
public class CommunityController {
    @Autowired
    CommunityService communityService;



    /**
     *  给社区id，返回对应家庭Id
     */
    @RequestMapping("/getFamilyIdByCommunityId")
    public List<Integer> getFamilyIdByCommunityId(@RequestParam Integer communityId) {
        return communityService.getFamilyIdByCommunityId(communityId);
    }

    /**
     * 查找该社区全部医生
     */
    @RequestMapping("/getDoctorByCommunityId")
    public List<Doctor> getDoctorByCommunityId(@RequestParam Integer communityId) {
        return communityService.getDoctorByCommunityId(communityId);
    }

    /**
     * 查找该社区全部预约记录
     */
    @RequestMapping("/getAppointmentLogByCommunityId")
    public Map<Integer,List<AppointmentShort>> getAppointmentLogByCommunityId(@RequestParam Integer communityId) {
        return communityService.getAppointmentLogByCommunityId(communityId);
    }
}
