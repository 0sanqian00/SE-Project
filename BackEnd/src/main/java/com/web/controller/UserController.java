package com.web.controller;

import com.web.pojo.LoginRequest;
import com.web.pojo.User;
import com.web.service.UserService;
import com.web.util.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户处理器，处理用户相关的请求
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 用户登录接口
     *
     * @return 包含认证状态和JWT令牌的响应信息
     */
    @PostMapping("/user/login")
    public Map<String, Object> login(@RequestBody LoginRequest user ) {

//        log.info("用户名：[{}]", user.getUsername());
//        log.info("密码：[{}]", user.getPassword());
        String username = user.getUsername();
        String password = user.getPassword();
        System.out.println("username=" + username + " password=" + password);
        String type = user.getType();
        Map<String, Object> map = new HashMap<>();

        try {
            User userDB = userService.login(username,password,type);
            Map<String, String> payload = new HashMap<>();
            //用户登录成功后的信息放入payload
            payload.put("id", userDB.getId().toString());
            payload.put("username", userDB.getUsername());
            //生成JWT令牌
            String token = JWTUtils.getToken(payload);
            map.put("state", true);
            map.put("token", token);
            map.put("msg", "认证成功");
            //家庭ID
            map.put("Id",userDB.getId());
        } catch (Exception e) {
            map.put("state", false);
            map.put("msg", e.getMessage());
        }
        return map;
    }

    /**
     * 需要验证Token的测试接口
     *
     * @param token JWT令牌
     * @return 包含请求状态和消息的响应信息
     */
    @PostMapping("/user/test")
    public Map<String, Object> test(String token) {
        Map<String, Object> map = new HashMap<>();
//        log.info("需要验证token的函数执行了...");
        map.put("state", true);
        map.put("msg", "请求成功");
        return map;
    }
}
