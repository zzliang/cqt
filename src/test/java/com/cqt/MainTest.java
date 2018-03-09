package com.cqt;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;

import com.cqt.util.RightsHelper;

public class MainTest {
	public static void main(String[] args) {
		String rights = getRights();
		System.out.println("rights::"+rights);
	}
	
	
	/**
	 * 获取加密密码
	 * @param uName
	 * @param pwd
	 * @return
	 */
	public static String getPassword(String uName,String pwd){
		String passwd = new SimpleHash("SHA-1", uName, pwd).toString();
		return passwd;
	}
	
	public static String getRights(){
		int maxNum = 45;
		List<String> ids = new ArrayList<String>();
		for(int i=1;i<=maxNum;i++){
			ids.add(i+"");
		}
		BigInteger bi = RightsHelper.sumRights(ids.toArray(new String[0]));
		return bi.toString();
	}
}
