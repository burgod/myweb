package com.bg.utils;

import com.bg.filter.SessionFilter;
import com.bg.model.PurviewSession;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by luyb on 2017/5/9.
 */
public class SessionHelper {
    public static final String USER_SESSION = "UserSession";
//    public static final String VALIDATE_CODE = "ValidateCode";
//    public static final String AUTH_INFO = "AuthInfo";
//    public static final String WEIXIN_INFO = "WeiXinInfo";

    public static PurviewSession get(){
        return (PurviewSession) SessionFilter.HttpRequestContext.getAttribute(USER_SESSION);
    }

    public static void set(HttpServletRequest request, PurviewSession session){
        request.getSession().setAttribute(USER_SESSION, session);
    }

    public static void remove(HttpServletRequest request){
        request.getSession().removeAttribute(USER_SESSION);
    }
}
