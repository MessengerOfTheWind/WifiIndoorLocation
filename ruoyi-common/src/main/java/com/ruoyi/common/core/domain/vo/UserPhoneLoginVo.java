package com.ruoyi.common.core.domain.vo;
 
import lombok.Data;
 
@Data
public class UserPhoneLoginVo {
    /**
     * 手机号
     */
    private String phoneNumber;
 
    /**
     * 验证码
     */
    private String smsCode;
 
    /**
     * 唯一标识
     */
    private String uuid;
}