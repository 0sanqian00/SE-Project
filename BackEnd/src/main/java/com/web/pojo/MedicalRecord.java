package com.web.pojo;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class MedicalRecord {
    Integer id;
    String name;
    String gender;
    Integer age;
    String image;
    Integer personId;
    Integer doctorId;
    String condition;
    String sympton;
    String datetime;
    String advice;

}
