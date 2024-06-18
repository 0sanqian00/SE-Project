package com.web.service.impl;

import com.web.mapper.BoxMapper;
import com.web.mapper.MedicationMapper;
import com.web.mapper.PersonMapper;
import com.web.pojo.*;
import com.web.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service

public class PersonServiceImpl implements PersonService {
    @Autowired
    PersonMapper personMapper;

    @Autowired
    MedicationMapper medicationMapper;

    @Autowired
    BoxMapper boxMapper;



    @Override
    public void setType(Integer memberId, Integer chestPain, Integer anginaPectoris) {
        personMapper.setType(memberId, chestPain, anginaPectoris);
    }

    @Override
    public List<MedicalRecord> getMedicalRecords(Integer id) {
        return medicationMapper.getMedicalRecords(id);
    }

    @Override
    public List<DoctorForPerson> getAppointRecords(Integer memberId) {
        return personMapper.getAppointRecords(memberId);
    }

    @Override
    public List<Advice> getAdvice(Integer memberId) {
        return personMapper.getAdvice(memberId);
    }

    @Override
    public void evaluate(Integer memberId, Integer doctorId,  String evaluation) {
        personMapper.evaluate(memberId, doctorId, evaluation);
    }

    @Override
    public List<MeasureLog> getMeasureLogById(Integer id) {
        return personMapper.getMeasureLogById(id);
    }



    @Override
    public List<DrugPlan> getDrugPlan(Integer id) {
        List<DrugPlan> drugPlans = new ArrayList<>();
        //1.根据人的id查询药物id
        List<Integer> medicationIds = medicationMapper.getMedicationIds(id);
        for (Integer medicationId : medicationIds) {
            //2.遍历药物id，查询用药计划
            DrugPlan drugPlan = medicationMapper.getMedicalRecordByMedicationId(id, medicationId);
            //3.根据药物id添加药的信息
            Medication medication = medicationMapper.getMedicationById(medicationId);
            drugPlan.setName(medication.getName());
            drugPlan.setDescription(medication.getDescription());
            drugPlan.setType(medication.getType());
            //4.添加boxId
            //4.1根据人的id查询家庭id
            Integer familyId = personMapper.getFamilyIdByMemberId(id);
            //4.2根据家庭id和药物id查询药箱id
            Integer boxId = boxMapper.getBoxId(familyId, medicationId);
            //4.3设置药箱id
            drugPlan.setBoxId(boxId);
            //5.计算nextTime
            //5.1 查询每日服用次数
            Integer frequency = drugPlan.getUseFrequency();
            LocalDateTime currentTime = LocalDateTime.now();//当前时间
            //一日两次：8点，20点
            //一日三次：8点，14点，20点
            //三个时间段
            LocalDateTime today8 = LocalDateTime.of(
                    LocalDateTime.now().getYear(),
                    LocalDateTime.now().getMonthValue(),
                    LocalDateTime.now().getDayOfMonth(),
                    8,
                    0
            );
            LocalDateTime today14 = LocalDateTime.of(
                    LocalDateTime.now().getYear(),
                    LocalDateTime.now().getMonthValue(),
                    LocalDateTime.now().getDayOfMonth(),
                    14,
                    0
            );
            LocalDateTime today20 = LocalDateTime.of(
                    LocalDateTime.now().getYear(),
                    LocalDateTime.now().getMonthValue(),
                    LocalDateTime.now().getDayOfMonth(),
                    20,
                    0
            );
            //标志
            // 0：0：00-8：00，
            // 1：8：00-14：00，
            // 2：14：00-20：00，
            // 3：20：00-24：00
            int flags = 0;
            if (currentTime.isAfter(today8)) {
                //8点后
                flags++;//1
                if (currentTime.isAfter(today14)) {
                    flags++;//2
                    if (currentTime.isAfter(today20)) {
                        flags++;//3
                    }
                }
            }
            //一日两次
            if (frequency == 2) {
                if (flags < 1) {
                    drugPlan.setNextUseTime(today8);
                } else if (flags <= 2) {
                    drugPlan.setNextUseTime(today20);
                } else {
                    drugPlan.setNextUseTime(today8.plusDays(1));
                }
            } else if (frequency == 3) {
                //一日三次
                if (flags < 1) {
                    drugPlan.setNextUseTime(today8);
                } else if (flags < 2) {
                    drugPlan.setNextUseTime(today14);
                } else if (flags < 3) {
                    drugPlan.setNextUseTime(today20);
                } else {
                    drugPlan.setNextUseTime(today8.plusDays(1));
                }
            }
            //6.添加进返回结果
            drugPlans.add(drugPlan);
        }
        return drugPlans;
    }
}
