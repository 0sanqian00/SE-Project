package com.web.pojo;

import lombok.Data;

@Data
public class Advice {
    private Integer personId;
    private Integer doctorId;
    private String advice;
}
