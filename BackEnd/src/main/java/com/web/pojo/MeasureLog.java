package com.web.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class MeasureLog {
    Integer id;
    Integer personId;
    String type;
    LocalDateTime dateTime;
    Float data;
}
