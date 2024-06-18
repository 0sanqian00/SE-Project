package com.web.controller;

import com.web.pojo.*;
import com.web.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/person")
public class PersonController {

    @Autowired
    private PersonService personService;

    /**
     * 查询个人历史体征测量数据
     *
     * @param memberId 个人id
     * @return 个人历史体征测量数据
     */
    @RequestMapping("/getMeasureLog")
    public List<MeasureLog> getMeasureLogById(@RequestParam Integer memberId) {
        return personService.getMeasureLogById(memberId);
    }

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

    /**
     * 用户端评价医生
     */
    @RequestMapping(value = "/evaluate", method = RequestMethod.POST)
    public void evaluate(@RequestBody Evaluation evaluations) {
        Integer memberId = evaluations.getMemberId();
        Integer doctorId = evaluations.getDoctorId();
        String evaluation = evaluations.getEvaluation();
        personService.evaluate(memberId, doctorId, evaluation);
    }

}
