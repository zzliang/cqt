package com.cqt.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.cqt.commons.IO;

public class PropertiesUtil {
	public static Properties getPro(InputStream in) {  
        Properties p = new Properties();  
        try {  
            p.load(in);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }finally{
        	IO.close(in);
        }
        return p;  
    }
	
	public static Properties getPro(String filePath) throws FileNotFoundException {  
		Properties p = new Properties();  
		File f = new File(filePath);
		InputStream in = null;
		
        try {  
        	if(f.exists() && f.isFile()){
        		in = new BufferedInputStream(new FileInputStream(f));  
        		p.load(in);  
        		in.close();
        	}
        } catch (IOException e) {  
            e.printStackTrace();  
        }finally{
        	IO.close(in);
        }
        return p;  
    }  
}
