package com.web.pojo;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Appointment {
    Integer id;
    Integer personId;
    Integer doctorId;
    String doctorName;
    String office;
    LocalDateTime time;
    Integer order;
}
