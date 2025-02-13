package com.ruoyi.framework.security.core;

import com.ruoyi.framework.security.core.otherUserdetails.OtherLoginNotFoundException;
import org.springframework.security.core.userdetails.UserDetails;

public interface OtherUserDetailsService {
    UserDetails otherLoadUser(String o, int num) throws OtherLoginNotFoundException;
}