package com.web.pojo;

import lombok.Data;

@Data
public class PersonPrediction {
    String name;
    String carPrediction;

    public PersonPrediction(String name, String carPrediction) {
        this.name = name;
        this.carPrediction = carPrediction;
    }
}
