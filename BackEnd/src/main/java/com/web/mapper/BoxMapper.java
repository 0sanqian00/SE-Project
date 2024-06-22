package com.web.mapper;

import com.web.pojo.Box;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoxMapper {
    Integer getBoxId(Integer familyId, Integer medicationId);

    List<Box> getBoxByFamilyId( Integer familyId);
}
