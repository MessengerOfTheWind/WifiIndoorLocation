package com.ruoyi.common.utils;
 
public class RegexUtils {
    /**
     * 校验手机号
     * @param phoneNumber
     * @return
     */
    public static boolean isValidPhoneNumber(String phoneNumber) {
        String regex = "^1[3-9]\\d{9}$";
        return phoneNumber.matches(regex);
    }
    /**
     * 判断是否正整数
     *
     * @param number
     *      数字
     * @return boolean true,通过，false，没通过
     */
    public static boolean isNumber(String number) {
        if (StringUtils.isEmpty(number))
            return false;
        String regex = "[0-9]*";
        return number.matches(regex);
    }
}