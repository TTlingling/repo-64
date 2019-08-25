package com.yc.blog.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.blog.bean.User;
import com.yc.blog.bean.UserExample;
import com.yc.blog.dao.UserMapper;

@Service
public class UserBiz {
	
	@Resource
	private UserMapper um;
	
	public User login(String name,String password) throws BizException {
		/**
		 * 验证代码。。。
		 */
		UserExample ue = new UserExample();
		ue.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
		List<User> list = um.selectByExample(ue);
		if (list.size() == 0) {
			throw new BizException("用户名或密码错误！");
		}
		
		return list.get(0);
	}

}
