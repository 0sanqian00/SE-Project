package com.web.service.impl;

import com.web.mapper.BoxMapper;
import com.web.mapper.MedicationMapper;
import com.web.pojo.Box;
import com.web.service.BoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoxServiceImpl implements BoxService {
    @Autowired
    BoxMapper boxMapper;
    @Autowired
    MedicationMapper medicationMapper;

    @Override
    public List<Box> getBoxByFamilyId(Integer familyId) {
        //1.获取基本信息
//        System.out.println("\n参数值familyId为\n"+familyId);
        List<Box> boxes = boxMapper.getBoxByFamilyId(familyId);
//        System.out.println(boxes);
        //2.增加药品名称
        for (Box box : boxes) {
            box.setName(medicationMapper.getName(box.getMedicationId()));
        }
        return boxes;
    }
}
