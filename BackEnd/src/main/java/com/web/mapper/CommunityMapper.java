package com.web.mapper;

import com.web.pojo.Doctor;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommunityMapper {
    List<Integer> getFamilyId(Integer communityId);
    List<Doctor> getDoctorByCommunityId(Integer communityId);


}
