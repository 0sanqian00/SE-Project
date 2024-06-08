package com.web.service.impl;

import com.web.mapper.UserMapper;
import com.web.pojo.User;
import com.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String username, String password, String type) {
        User u= userMapper.login(username, password, type);
        if(u != null) {
            System.out.println("登录成功");
            return u;
        }

        System.out.println( "登录失败");
        return null;
    }
}
