package com.web.service;


import com.web.pojo.AppointmentShort;
import com.web.pojo.Doctor;


import java.util.List;
import java.util.Map;

public interface CommunityService {


    List<Integer> getFamilyIdByCommunityId(Integer communityId);
    List<Doctor> getDoctorByCommunityId(Integer communityId);
    Map<Integer,List<AppointmentShort>> getAppointmentLogByCommunityId(Integer communityId);

}
