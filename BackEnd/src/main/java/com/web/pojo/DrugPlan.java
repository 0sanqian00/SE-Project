package com.web.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DrugPlan {
    Integer id;
    Integer personId;
    Integer medicationId;
    String name;
    String description;
    String type;
    Integer useFrequency;
    String useMethod;
    Integer boxId;
    LocalDateTime nextUseTime;

}
