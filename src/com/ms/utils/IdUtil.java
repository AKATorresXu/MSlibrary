package com.ms.utils;

import java.util.Random;
import java.util.UUID;

public class IdUtil {

	public static String getUUID(){    
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");    
        return uuid;    
    }    
	public static String getUUIDByRules(String rules)    
    {    
      int rpoint = 0;    
        StringBuffer generateRandStr = new StringBuffer();    
        Random rand = new Random();   
        
        for(int i=0;i<rules.length();i++)    
        {    
            if(rules!=null){    
                rpoint = rules.length();    
                int randNum = rand.nextInt(rpoint);
                if(rules.charAt(i)=='-')
                {
                	generateRandStr.append('-');
                	continue;
                }
                String radStr = getUUID();
                generateRandStr.append(radStr.substring(randNum,randNum+1));    
            }    
        }    
        return generateRandStr.toString();    
    }
}
