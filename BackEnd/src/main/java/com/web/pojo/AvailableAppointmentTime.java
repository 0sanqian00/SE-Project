package com.web.pojo;

import lombok.Data;

import java.util.Map;

@Data
public class AvailableAppointmentTime {
    private Integer doctorId;

    // 假设 appointmentNum 是某个特定逻辑的字段，这里不包括它

    private Map<String, TimeSlot> timeSlots;

    // Lombok 的 @Data 注解会为 TimeSlot 类也生成 getter 和 setter
    // 因此，你不需要为 TimeSlot 类添加 @Data 注解，除非你需要额外的逻辑
    @Data
    public static class TimeSlot {
        private Integer appointmentNum;

        // 这里不需要写 getter 和 setter，因为 Lombok 会为我们生成
    }
}