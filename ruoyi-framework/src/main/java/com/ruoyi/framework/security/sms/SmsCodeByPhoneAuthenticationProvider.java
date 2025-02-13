package com.ruoyi.framework.security.sms;
 
import com.ruoyi.framework.security.core.OtherUserDetailsService;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
 
public class SmsCodeByPhoneAuthenticationProvider implements AuthenticationProvider {
    private OtherUserDetailsService userDetailsService;
 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        SmsCodeAuthenticationToken authenticationToken = (SmsCodeAuthenticationToken) authentication;
 
        String phone = (String) authenticationToken.getPrincipal();
        UserDetails userDetails = userDetailsService.otherLoadUser(phone,1);
 
        // 此时鉴权成功后，应当重新 new 一个拥有鉴权的 authenticationResult 返回
        SmsCodeAuthenticationToken authenticationResult = new SmsCodeAuthenticationToken(userDetails, userDetails.getAuthorities());
        authenticationResult.setDetails(authenticationToken.getDetails());
 
        return authenticationResult;
    }
 
 
    @Override
    public boolean supports(Class<?> authentication) {
        // 判断 authentication 是不是 SmsCodeAuthenticationToken 的子类或子接口
        return SmsCodeAuthenticationToken.class.isAssignableFrom(authentication);
    }
 
    public OtherUserDetailsService getUserDetailsService() {
        return userDetailsService;
    }
 
    public void setUserDetailsService(OtherUserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
}