package com.bg.filter;

import com.bg.model.PurviewSession;
import com.bg.utils.SessionHelper;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by luyb on 2017/4/7.
 */
public class ViewFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;

        String servletPath = httpServletRequest.getServletPath();

        boolean validateSession = true;
        if(servletPath.endsWith("index.jsp") || servletPath.endsWith("index")||servletPath.endsWith("/"))
            validateSession = false;

        if(validateSession){
            PurviewSession purviewSession = SessionHelper.get();
            if(purviewSession == null){
                HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/index.jsp");
//                servletRequest.getRequestDispatcher("/index.html").forward(servletRequest, servletResponse);
                return;
            }
        }

        if( !servletPath.endsWith(".do") && servletPath.indexOf(".")==-1) {
            servletPath += ".htm";

            servletRequest.getRequestDispatcher(servletPath).forward(servletRequest, servletResponse);
            return;
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    public void destroy() {

    }
}
