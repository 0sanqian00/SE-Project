package com.web.pojo;

import lombok.Data;

@Data
public class AppointmentShort {

    String name;
    String time;

    public AppointmentShort(String name, String time) {
        this.name = name;
        this.time = time;
    }
}
