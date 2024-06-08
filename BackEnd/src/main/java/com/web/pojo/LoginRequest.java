package com.web.pojo;

import lombok.Data;

@Data
public class LoginRequest {
    String username;
    String password;
    String type;
}
