package com.ruoyi.common.core.domain.model;
 
import lombok.Data;
import java.io.Serializable;
 
@Data
public class UserRegisterBody implements Serializable {
    /**
     * 手机号
     */
    private String phoneNumber;
 
    /**
     * 登录密码
     */
    private String password;
 
    /**
     * 验证码
     */
    private String code;
 
    /**
     * 唯一标识
     */
    private String uuid;
}