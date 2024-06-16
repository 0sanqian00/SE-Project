package com.web.controller;

import com.web.pojo.DoctorForPerson;
import com.web.pojo.MedicalRecord;
import com.web.service.PersonService;
import com.web.pojo.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/person")
public class PersonController {

    @Autowired
    private PersonService personService;



    /**
     * 查看个人所有历史病历
     *
     * @param doctorId 个人Id
     * @return 个人所有历史病历
     */
    @RequestMapping("/getMedicalRecord")
    public List<MedicalRecord> getMedicalRecords(@RequestParam Integer doctorId) {
        return personService.getMedicalRecords(doctorId);
    }

    /**
     * 查看个人预约记录
     *
     * @param memberId 个人Id
     * @return 个人所有历史病历
     */

    @RequestMapping("/getAppointRecord")
    public List<DoctorForPerson> getAppointRecords(@RequestParam Integer memberId) {
        return personService.getAppointRecords(memberId);
    }
    /**
     * 查看医嘱
     *
     * @param memberId 个人Id
     * @return 医嘱
     */

    @RequestMapping("/getAdvice")
    public List<Advice> getAdvice(@RequestParam Integer memberId) {

        return personService.getAdvice(memberId);
    }

}
