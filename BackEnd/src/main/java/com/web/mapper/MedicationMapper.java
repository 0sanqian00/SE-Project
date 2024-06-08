package com.web.mapper;

import com.web.pojo.DrugPlan;
import com.web.pojo.MedicalRecord;
import com.web.pojo.Medication;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MedicationMapper {
    List<MedicalRecord> getMedicalRecords(Integer id);

    List<Integer> getMedicationIds(Integer id);

    DrugPlan getMedicalRecordByMedicationId(Integer id, Integer medicationId);
    Medication getMedicationById(Integer medicationId);
    String getName(Integer id);


}
