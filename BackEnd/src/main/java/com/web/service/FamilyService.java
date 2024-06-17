package com.web.service;

import com.web.pojo.Appointment;

import com.web.pojo.MeasureDate;
import com.web.pojo.Person;

import java.util.List;
import java.util.Map;

public interface FamilyService {

    List<Person> getMemberInfo(Integer familyId);


    List<MeasureDate> getPhySignData(Integer familyId);
    Map<Integer, List<Appointment>>  getAppointmentsByFamilyId(Integer familyId);
}
