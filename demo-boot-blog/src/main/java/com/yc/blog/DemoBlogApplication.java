package com.yc.blog;

import java.util.Date;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.yc.blog.web.LoginInterceptor;

@SpringBootApplication
@Controller
@MapperScan("com.yc")
public class DemoBlogApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(DemoBlogApplication.class, args);
	}

	/**
	 * 注册拦截器,当容器启动时，该方法会被调用，那么注册拦截器就会被加载到容器中
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		 registry.addInterceptor(new LoginInterceptor())
		 .addPathPatterns("/toeditor")
		 .addPathPatterns("/comment");
	}
	
	

}
