package com.yc.blog.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.blog.bean.Article;
import com.yc.blog.bean.Comment;
import com.yc.blog.dao.ArticleMapper;
import com.yc.blog.dao.CommentMapper;

@Service
public class CommentBiz {
	
	@Resource
	private ArticleMapper am;
	@Resource
	private CommentMapper cm;
	
	@Transactional
	public Comment comment(Comment comm) {
		cm.insertSelective(comm);
		
		//文章评论数量更新
		Article a = am.selectByPrimaryKey(comm.getArticleid());
		a.setCommcnt((a.getCommcnt() == null ? 0 : a.getCommcnt()) + 1);
		am.updateByPrimaryKey(a);
		return comm;
	}

}
