package com.cqt.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        
	        i++;
	    }
	    return returnStr;
	}
	
	/**
	 * 将字符串中的换行及制表符替换成#
	 * @param str
	 * @return
	 */
	public static String replaceFlag(String str,String flag) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll(flag);
        }
        return dest;
    }
	
	public static String replaceFirstEnter(String str,String flag) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\n");
            Matcher m = p.matcher(str);
            dest = m.replaceFirst(flag);
        }
        return dest;
    }
	
	public static String replaceAllEnter(String str,String flag) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll(flag);
        }
        return dest;
    }
	
	public static void main(String[] args) {
		String s = "英文剧(Drama)".concat("\n").concat("Kim/唐任姣").concat("\n").concat("魏苗");
		System.out.println(s);
		String s1 = replaceFirstEnter(s, "");
		System.out.println(s1);
		s1=replaceAllEnter(s1, "/");
		System.out.println(s1);
	}
}
