package com.web.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class AppointmentRequest {
    Integer memberId;
    Integer doctorId;
    String appointmentTime;
}
