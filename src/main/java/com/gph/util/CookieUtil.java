package com.gph.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class CookieUtil {

    public static String getCookieName (HttpServletRequest request,String cookieName)  {
        Cookie[] cookie = request.getCookies();
        String str = "";
        if(cookie!=null && cookie.length>0){
            for(Cookie cookie1:cookie)
            {
                if(cookie1.getName().equals(cookieName))
                {
                    try {
                        str = URLDecoder.decode(cookie1.getValue(), "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    break;
                }
            }
        }
        return str;
    }
}
