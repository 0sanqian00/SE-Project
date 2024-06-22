package com.web.controller;

import com.web.pojo.Appointment;
import com.web.pojo.MeasureDate;
import com.web.pojo.Person;
import com.web.service.FamilyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/family")
public class FamilyController {

    @Autowired
    private FamilyService familyService;

    /**
     * 获取指定家庭的所有成员基本信息
     *
     * @param familyId 家庭ID
     * @return 指定家庭的所有成员基本信息
     */
    @RequestMapping("/getMemberInfo")
    public List<Person> getMemberInfo(@RequestParam Integer familyId) {
        return familyService.getMemberInfo(familyId);
    }

    /**
     * 获取指定家庭的所有成员体征数据
     *
     * @param familyId 家庭ID
     * @return 指定家庭的所有成员体征数据
     */
    @RequestMapping("/getPhySignData")
    public List<MeasureDate> getPhySignData(@RequestParam Integer familyId) {
        return familyService.getPhySignData(familyId);
    }



    /**
     * 查询家庭中各成员的预约记录
     * @param familyId 家庭ID
     * @return 家庭中各成员的预约记录
     */
    @RequestMapping("/getAppointRecord")
    public Map<Integer, List<Appointment>> getAppointmentsByFamilyId(@RequestParam Integer familyId) {
        return familyService.getAppointmentsByFamilyId(familyId);
    }


}
