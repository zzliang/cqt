package com.cqt.util.mail;

import javax.mail.*;   

/**  
 * <p>Title: MyAuthenticator</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class MyAuthenticator extends Authenticator{   
    String userName=null;   
    String password=null;   
        
    public MyAuthenticator(){   
    }   
    public MyAuthenticator(String username, String password) {    
        this.userName = username;    
        this.password = password;    
    }    
    protected PasswordAuthentication getPasswordAuthentication(){   
        return new PasswordAuthentication(userName, password);   
    }   
}   
