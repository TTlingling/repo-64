package com.yc.blog.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.blog.bean.Category;
import com.yc.blog.dao.CategoryMapper;

@Service
public class CategoryBiz {

	@Resource
	private CategoryMapper cm;
	
	//查询所有
	public List<Category> queryAll(){
		return cm.selectByExample(null);
	}
	
}
