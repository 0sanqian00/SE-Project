package com.web.mapper;

import com.web.pojo.Appointment;
import com.web.pojo.Person;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FamilyMapper {

    List<Person> getMemberInfo(Integer familyId);

    List<Integer> getFamilyMemberId(Integer familyId);



    List<Appointment> getAppointmentsByMemberId(Integer id);



}
