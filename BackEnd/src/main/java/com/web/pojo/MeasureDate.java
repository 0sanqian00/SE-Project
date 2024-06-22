package com.web.pojo;

import lombok.Data;

@Data
public class MeasureDate {
    Integer id;
    Integer personId;
    Float bloodOxygen;
    Float bloodSugar;
    Float highPreasure;
    Float lowPreasure;
    Float bodyTem;
    Float heartRate;
    Integer chestPain;
    Integer anginaPectoris;
    String carPrediction;

}
