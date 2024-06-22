package com.web.service;

import com.web.pojo.Box;

import java.util.List;

public interface BoxService {
    List<Box> getBoxByFamilyId(Integer familyId);
}
