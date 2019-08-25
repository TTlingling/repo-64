package com.yc.blog.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.yc.blog.bean.Article;
import com.yc.blog.bean.ArticleExample;
import com.yc.blog.dao.ArticleMapper;

@Service
public class ArticleBiz {

	@Autowired
	private ArticleMapper am;
	
	/**
	 * 查询最新发布文章
	 * page 页数
	 */
	
	public List<Article> queryNewArticles(int page){
		ArticleExample example = new ArticleExample();
		example.setOrderByClause("createTime desc");
		PageHelper.startPage(page, 5);
		return am.selectByExampleWithBLOBs(example);
	}

	/**
	 * 根据分类id分页查询文章
	 * @param id
	 * @param page
	 * @return
	 */
	public List<Article> queryByCategory(int id,int page) {
		ArticleExample example = new ArticleExample();
		example.createCriteria().andCategoryidEqualTo(id);
		example.setOrderByClause("createTime desc");
		PageHelper.startPage(page, 5);
		return am.selectByExampleWithBLOBs(example);
	}

	/**
	 * 阅读博文
	 * @param id
	 * @return
	 */
	@Transactional	//加入事务注解
	public Article read(int id) {
		ArticleExample example = new ArticleExample();
		example.createCriteria().andIdEqualTo(id);
		Article a = am.selectByPrimaryKey(id);
		//更新阅读次数
		a.setReadcnt((a.getAgreecnt() == null ? 0 : a.getAgreecnt())+ 1);
		am.updateByPrimaryKey(a);
		return a;
	}

	public List<Article> queryRela(Integer categoryid) {
		ArticleExample example = new ArticleExample();
		//按时间降序
		example.setOrderByClause("createTime desc");
		//查相关类别文章
		example.createCriteria().andCategoryidEqualTo(categoryid);
		//查10个记录
		PageHelper.startPage(1, 10);
		return am.selectByExample(example);
	}

	public void save(Article article) {
		am.insert(article);
		
		
	}
	
}
