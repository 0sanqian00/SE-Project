package com.web.mapper;

import com.web.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    User login(String username, String password, String type);
}
