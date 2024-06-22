package com.web.pojo;

import lombok.Data;

@Data
public class Advice {
    private Integer memberId;
    private Integer doctorId;
    private String advice;
}
