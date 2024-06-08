package com.web.service;

import com.web.pojo.User;

public interface UserService {
    User login(String username, String password, String type);
}
