package com.ruoyi.web.controller.Api.app;
 
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.core.domain.model.UserRegisterBody;
import com.ruoyi.common.core.domain.vo.UserPhoneLoginVo;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.GenerateNumberUtils;
import com.ruoyi.common.utils.RegexUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysRegisterService;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
 
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
 
@Api("用户API")
@RestController
@RequestMapping("/api/app")
public class AppController extends BaseController {
    // 指定时间内最大获取验证码次数
    @Value(value = "${sms.code.maxCount}")
    private int codeMaxCount;
 
    //验证码锁定时间
    @Value(value = "${sms.code.lockTime}")
    private int codeLockTime;
 
    @Autowired
    private ISysConfigService configService;
 
    @Autowired
    private SysLoginService loginService;
 
    @Autowired
    private SysRegisterService registerService;
 
    @Autowired
    private ISysUserService userService;
 
    @Autowired
    private RedisCache redisCache;
 
    @Anonymous
    @ApiOperation("获取短信验证码")
    @GetMapping("/getSmsCode")
    public AjaxResult getSmsCode(@RequestParam(value = "phoneNumber") String phoneNumber)
    {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (!captchaEnabled)
        {
            return ajax;
        }
 
        //校验手机号
        if (StringUtils.isEmpty(phoneNumber))
        {
            return error("手机号不能为空");
        }
        if (!RegexUtils.isValidPhoneNumber(phoneNumber))
        {
            return error("手机号格式错误");
        }
 
        String smsCacheKey = CacheConstants.SMS_CODE_KEY + phoneNumber;
        Integer codeCount = redisCache.getCacheObject(smsCacheKey);
        if (codeCount == null)
        {
            codeCount = 0;
        }
        if (codeCount >= Integer.valueOf(codeMaxCount).intValue())
        {
            return error("获取验证码频繁，清稍后重试！");
        }
 
        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.MOBILE_CAPTCHA_CODE_KEY + uuid;
 
        // 生成验证码
        String code = GenerateNumberUtils.generateVerificationCode(6);
        System.out.println("验证码："+code);
 
        //向用户发送短信
        codeCount = codeCount + 1;
        redisCache.setCacheObject(smsCacheKey, codeCount, codeLockTime, TimeUnit.MINUTES);
 
 
        redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        ajax.put("uuid", uuid);
        ajax.put("code", code);
        return ajax;
    }
 
    @Anonymous
    @ApiOperation("用户注册")
    @PostMapping("/register")
    public AjaxResult register(@RequestBody UserRegisterBody registerBody) {
        RegisterBody user = new RegisterBody();
        user.setUsername(registerBody.getPhoneNumber());
        user.setPassword(registerBody.getPassword());
        user.setCode(registerBody.getCode());
        user.setUuid(registerBody.getUuid());
        String msg = registerService.userRegister(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
 
    @Anonymous
    @ApiOperation("手机号码登录")
    @PostMapping("/loginByPhone")
    public AjaxResult loginByPhone(@RequestBody UserPhoneLoginVo user) {
        // 生成令牌
        String token = loginService.loginUserByPhone(user.getPhoneNumber(), user.getSmsCode(), user.getUuid());
        // 缓存8小时过期
        redisCache.setCacheObject("RDS_CACHE_LOGIN_SINGLE:"+user.getPhoneNumber(),token,1000*60*60*8, TimeUnit.MILLISECONDS);
        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put(Constants.TOKEN, token);
        return success(data);
    }
}