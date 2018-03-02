package com.cqt.plugin.paging;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;

/**  
 * <p>Title: PagetHelper</p>  
 * <p>Description: 分页插件辅助类</p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class PagetHelper {
	/**
	 * 获取obj对象fieldName的Field
	 * @param obj
	 * @param fieldName
	 * @return
	 */
	public static Field getFieldByFieldName(Object obj, String fieldName) {
		for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass
				.getSuperclass()) {
			try {
				return superClass.getDeclaredField(fieldName);
			} catch (NoSuchFieldException e) {
			}
		}
		return null;
	}

	/**
	 * 获取obj对象fieldName的属性值
	 * @param obj
	 * @param fieldName
	 * @return
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static Object getValueByFieldName(Object obj, String fieldName)
			throws SecurityException, NoSuchFieldException,
			IllegalArgumentException, IllegalAccessException {
		Field field = getFieldByFieldName(obj, fieldName);
		Object value = null;
		if(field!=null){
			if (field.isAccessible()) {
				value = field.get(obj);
			} else {
				field.setAccessible(true);
				value = field.get(obj);
				field.setAccessible(false);
			}
		}
		return value;
	}

	/**
	 * 设置obj对象fieldName的属性值
	 * @param obj
	 * @param fieldName
	 * @param value
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void setValueByFieldName(Object obj, String fieldName,
			Object value) throws SecurityException, NoSuchFieldException,
			IllegalArgumentException, IllegalAccessException {
		Field field = obj.getClass().getDeclaredField(fieldName);
		if (field.isAccessible()) {
			field.set(obj, value);
		} else {
			field.setAccessible(true);
			field.set(obj, value);
			field.setAccessible(false);
		}
	}
	
	/**
	 * 读取txt里的单行内容
	 * @param filePath  文件路径
	 */
	public static String readTxtFile(String fileP) {
		try {
			
			String filePath = String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../";	//项目路径
			filePath = filePath.replaceAll("file:/", "");
			filePath = filePath.replaceAll("%20", " ");
			filePath = filePath.trim() + fileP.trim();
			if(filePath.indexOf(":") != 1){
				filePath = File.separator + filePath;
			}
			String encoding = "utf-8";
			File file = new File(filePath);
			if (file.isFile() && file.exists()) { 		// 判断文件是否存在
				InputStreamReader read = new InputStreamReader(
				new FileInputStream(file), encoding);	// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					return lineTxt;
				}
				read.close();
			}else{
				System.out.println("找不到指定的文件,查看此路径是否正确:"+filePath);
			}
		} catch (Exception e) {
			System.out.println("读取文件内容出错");
		}
		return "";
	}
	
	/**
	 * 检测字符串是否不为空(null,"","null")
	 * @param s
	 * @return 不为空则返回true，否则返回false
	 */
	public static boolean notEmpty(String s){
		return s!=null && !"".equals(s) && !"null".equals(s);
	}
	
	/**
	 * 检测字符串是否为空(null,"","null")
	 * @param s
	 * @return 为空则返回true，不否则返回false
	 */
	public static boolean isEmpty(String s){
		return s==null || "".equals(s) || "null".equals(s);
	}
}
