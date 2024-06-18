package com.web.controller;

import com.web.pojo.Box;
import com.web.service.BoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/box")
public class BoxController {
    @Autowired
    BoxService boxService;

    /**
     * 查看家庭的药箱
     * @param familyId 家庭id
     * @return 药箱
     */
    @RequestMapping("/getDrugBox")
    public List<Box> getBoxByFamilyId(@RequestParam Integer familyId) {
//        System.out.println("\n参数值familyId为\n"+familyId);
        return boxService.getBoxByFamilyId(familyId);
    }
}
