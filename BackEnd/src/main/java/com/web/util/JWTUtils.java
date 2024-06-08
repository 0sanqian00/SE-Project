package com.web.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Calendar;
import java.util.Map;

/**
 * JWT工具类，用于生成和验证Token
 */
public class JWTUtils {
    //密钥
    private static final String SING = "lingxiao";

    /**
     * 生成Token
     *
     * @param map 包含要添加到Token的信息的键值对
     * @return 生成的Token字符串
     */
    public static String getToken(Map<String, String> map) {
        Calendar instance = Calendar.getInstance();
        //默认7天过期
        instance.add(Calendar.DATE, 7);
        //创建JWT builder
        JWTCreator.Builder builder = JWT.create();

        map.forEach((k, v) -> {
            builder.withClaim(k, v);
        });

        String token = builder.withExpiresAt(instance.getTime())//有效期
                .sign(Algorithm.HMAC256(SING));//密钥
        return token;
    }

    /**
     * 验证Token的合法性
     *
     * @param token 待验证的Token字符串
     * @return 如果Token合法，返回DecodedJWT对象；否则返回null
     */
    public static DecodedJWT verify(String token) {
        //返回验证结果（结果是内置的）
        return JWT.require(Algorithm.HMAC256(SING)).build().verify(token);
    }
}
