package com.ruoyi.framework.security.core.otherUserdetails;
 
import org.springframework.security.core.AuthenticationException;
 
public class OtherLoginNotFoundException extends AuthenticationException {
    public OtherLoginNotFoundException(String msg) {
        super(msg);
    }
 
    public OtherLoginNotFoundException(String msg, Throwable cause) {
        super(msg, cause);
    }
}