package com.bg.filter;


import com.bg.model.PurviewSession;
import com.bg.utils.SessionHelper;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 接口session过滤链
 *
 * @author dison
 * @date 16/8/11
 * @company 广州易站通计算机科技有限公司
 * @email chends@gzyitop.com
 */
public class SessionFilter implements Filter {

    private FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        ThreadLocal<HttpRequestContext> threadLocal = null;
        try {
            threadLocal = HttpRequestContext.ThreadLocalHttpRequestContext;
//        threadLocal.set(new HttpRequestContext(request, response, getServletConfig(), getServletContext()));
            threadLocal.set(new HttpRequestContext((HttpServletRequest) request, (HttpServletResponse) response));

            PurviewSession purviewSession = (PurviewSession) ((HttpServletRequest) request).getSession().getAttribute(SessionHelper.USER_SESSION);

            HttpRequestContext.setAttribute(SessionHelper.USER_SESSION, purviewSession);
//通过过滤
            chain.doFilter(request, response);
        } finally {
            if (threadLocal != null)
                threadLocal.remove();
        }
    }

    public void destroy() {

    }

    public static class HttpRequestContext {
        private HttpServletRequest request;
        private HttpServletResponse response;
        private ServletConfig servletConfig;
        private ServletContext servletContext;

        public static ThreadLocal<HttpRequestContext> ThreadLocalHttpRequestContext = new ThreadLocal<HttpRequestContext>();

        public HttpRequestContext(HttpServletRequest request,
                                  HttpServletResponse response) {
            this.request = request;
            this.response = response;
        }

        public HttpRequestContext(HttpServletRequest request,
                                  HttpServletResponse response, ServletConfig servletConfig, ServletContext context) {
            this.request = request;
            this.response = response;
            this.servletConfig = servletConfig;
            this.servletContext = context;
        }

        public HttpServletRequest getRequest() {
            return request;
        }

        public HttpServletResponse getResponse() {
            return response;
        }

        public ServletConfig getServletConfig() {
            return servletConfig;
        }

        public ServletContext getServletContext(){
            return servletContext;
        }

        public static HttpSession getHttpSession() {
            if(HttpRequestContext.ThreadLocalHttpRequestContext.get() != null){
                return HttpRequestContext.ThreadLocalHttpRequestContext.get().getRequest().getSession();
            }

            return null;
        }

        public static HttpRequestContext get() {
            return HttpRequestContext.ThreadLocalHttpRequestContext.get();
        }

        public static void setAttribute(String attri, Object object) {
            getHttpSession().setAttribute(attri, object);
        }

        public static Object getAttribute(String attri) {
            HttpSession httpSession = getHttpSession();

            return httpSession == null ? null : httpSession.getAttribute(attri);
        }

//		public static Object getAttributeValidate(String attri) throws WebTransException {
//			Object obj = getAttribute(attri);
//			if(attri.equals(RemoteServiceServlet.USER_SESSION) && obj == null)
//				throw new WebTransException(OssTransCode.USER_未登录);
//			return obj;
//		}
    }
}
