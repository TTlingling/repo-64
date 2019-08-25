package com.yc.blog.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;
import com.yc.blog.vo.Result;
/**
 * 为什么实现HandlerInterceptor不需要实现他的方法，因为jdk1.8默认实现了他的方法
 * @author tll
 *handler 就是action
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {

		if (request.getSession().getAttribute("loginedUser") == null) {
			if (request.getHeader("X-Requested-With") == null) {				
				response.sendRedirect("index?login");
			}else {
				Gson gson = new Gson();
				String json = gson.toJson(new Result(0, "请先登录系统！")) ;
				//让jQuery将json字符串转换成、json对象
				response.setContentType("application/json;charset=UTF-8");
				response.getWriter().append(json);
			}
			return false;
		} else {
			return true;
		}
	}
	

}
