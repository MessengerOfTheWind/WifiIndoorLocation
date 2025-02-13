package com.ruoyi.common.utils;
 
import java.util.Random;
 
public class GenerateNumberUtils {
    public static String generateNumber(String str,Long maxNum,String prefix) {
        String newNum = "";
        newNum = prefix + String.format("%04d",maxNum);
        return str + newNum ;
    }
 
    /**
     *
     * @return
     */
    public static String getNumberByDate(){
        String prefix = DateUtils.dateTimeNow();
        return prefix;
    }
 
    // 生成指定长度的验证码的方法
    public static String generateVerificationCode(int codeLength) {
        Random random = new Random();
        // 首位数字范围1-9
        int firstDigit = random.nextInt(9) + 1;
        // 剩余位数字范围0-9
        StringBuilder sb = new StringBuilder().append(firstDigit);
        for (int i = 0; i < 5; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
}