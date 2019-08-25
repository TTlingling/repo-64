<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>异清轩博客文章页面</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/nprogress.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="images/icon/icon.png">
<link rel="shortcut icon" href="images/icon/favicon.ico">
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/nprogress.js"></script>
<script src="js/jquery.lazyload.min.js"></script>
<!--[if gte IE 9]>
  <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
  <script src="js/html5shiv.min.js" type="text/javascript"></script>
  <script src="js/respond.min.js" type="text/javascript"></script>
  <script src="js/selectivizr-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if lt IE 9]>
  <script>window.location.href='upgrade-browser.html';</script>
<![endif]-->
</head>

<body class="user-select single">

	<!-- jsp指令引入页头子页面 -->
	<%@ include file="common/header.jsp"%>
	
<section class="container">
  <div class="content-wrap">
    <div class="content">
      <header class="article-header">
        <h1 class="article-title"><a href="article.html">${article.title}</a></h1>
        <div class="article-meta"> <span class="item article-meta-time">
          <time class="time" data-toggle="tooltip" data-placement="bottom"
           title="时间：<fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>">
          <i class="glyphicon glyphicon-time"></i>
          <fmt:formatDate value="${article.createtime}"
          	pattern="yyyy-MM-dd HH:mm:ss"/>
           
           </time>
          </span> 
          <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="来源：第一PHP社区">
          	<i class="glyphicon glyphicon-globe"></i> 第一PHP社区</span>
          <span class="item article-meta-category" data-toggle="tooltip" data-placement="bottom" title="栏目：${article.category.name}">
          	<i class="glyphicon glyphicon-list"></i> 
          	<a href="program" title="">${article.category.name}</a>
          </span> 
          <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="查看：120">
          <i class="glyphicon glyphicon-eye-open"></i> 共${article.readcnt}人阅读</span>
           <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="评论：0">
           <i class="glyphicon glyphicon-comment"></i> 0个不明物体</span>
           </div>
      </header>
      <article class="article-content">
        <p><img src="images/banner/banner_03.jpg" alt="" /></p>
        ${article.content}
      </article>
      <div class="article-tags">标签：<a href="" rel="tag">PHP</a></div>
      <div class="relates">
        <div class="title">
          <h3>相关推荐</h3>
        </div>
        <ul>
        <c:forEach items="${relaList}" var="a">
          <li><a href="article?id=${a.id}">${a.title}</a></li>
         </c:forEach>
        </ul>
      </div>
      <div class="title" id="comment">
        <h3>评论 <small>抢沙发</small></h3>
      </div>
      <div id="respond">
        <form action="" method="post" id="comment-form">
          <div class="comment">
            <div class="comment-title"><img class="avatar" src="images/icon/icon.png" alt="" /></div>
            <div class="comment-box">
              <textarea placeholder="您的评论可以一针见血" name="comment" id="comment-textarea" cols="100%" rows="3" tabindex="1" ></textarea>
              <div class="comment-ctrl"> <span class="emotion"><img src="images/face/5.png" width="20" height="20" alt="" />表情</span>
                <div class="comment-prompt"> <i class="fa fa-spin fa-circle-o-notch"></i> <span class="comment-prompt-text"></span> </div>
                <!-- 加入文章id -->
                <input type="hidden" value="${article.id}" class="articleid" />
                <button type="button" name="comment-submit" id="comment-submit" tabindex="5" articleid="1">评论</button>
              </div>
            </div>
          </div>
        </form>
      </div>
      <div id="postcomments">
      <c:forEach items="${article.comments}" var="c" varStatus="vs">
	        <ol class="commentlist">
	          <li class="comment-content"><span class="comment-f" data-index="${vs.index + 1 }">#${vs.index + 1 }</span>
	            <div class="comment-avatar"><img class="avatar" src="images/icon/icon.png" alt="" /></div>
	            <div class="comment-main">
	            
	              <p>来自<span class="address">河南郑州</span>的用户
	              <span class="time">
	              (<fmt:formatDate value="${c.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>)
	              </span><br />
					${c.content}                
	            </div>
	          </li>
	        </ol>
        </c:forEach>
        <div class="quotes">
        <a href="article" id="commPage">下一页</a>
      <!--   <span class="disabled">首页</span>
        <span class="disabled">上一页</span>
        <a class="current">1</a>
        <a href="">2</a>
        <span class="disabled">下一页</span>
        <span class="disabled">尾页</span></div> -->
      </div>
    </div>
  </div>
  <aside class="sidebar">
    <div class="fixed">
      <div class="widget widget-tabs">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane notice active" id="notice">
            <ul>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a href="" target="_blank">欢迎访问异清轩博客</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这个小工具中最多可以调用五条</a></li>
            </ul>
          </div>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a href="javascript:;" class="btn btn-primary">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:admin@ylsat.com" data-toggle="tooltip" data-placement="bottom" title="admin@ylsat.com">admin@ylsat.com</a></h2>
          </div>
        </div>
      </div>
      <div class="widget widget_search">
        <form class="navbar-form" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
    <div class="widget widget_sentence">
      <h3>每日一句</h3>
      <div class="widget-sentence-content">
        <h4>2016年01月05日星期二</h4>
        <p>Do not let what you cannot do interfere with what you can do.<br />
          别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
      </div>
    </div>
    <div class="widget widget_hot">
      <h3>热门文章</h3>
      <ul>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
      </ul>
    </div>
  </aside>
</section>

	<!-- jsp动作标签引入子页面 -->
<jsp:include page="common/footer.jsp"></jsp:include>
<script src="js/jquery.ias.js"></script> 
<script type="text/javascript">

//无限滚动反翻页
var ias = jQuery.ias({
	history: false,
	container : '#postcomments',
	item: '.commentlist',
	pagination: '.quotes',
	next: '#commPage',
	/*trigger: '查看更多',
	loader: '<div class="pagination-loading"><img src="/images/loading.gif" /></div>',
	triggerPageThreshold: 5*/
	
});

var page = 1;
ias.on('load', function(event) {
  
   event.ajaxOptions.data = { 
		   page: ++page,
		   id: ${article.id}
		   };
   
  
});



ias.extension(new IASSpinnerExtension({
    src: '/images/loading.gif', // optionally
}));

ias.extension(new IASTriggerExtension({
    text: '查看更多', // 鼠标点击加载提示的文字
    offset: 2		//到第几页后，开始鼠标点击加载
}));
</script>

<script src="js/jquery.qqFace.js"></script>
<script type="text/javascript">
$(function(){
	$('.emotion').qqFace({
		id : 'facebox', 
		assign:'comment-textarea', 
		path:'/images/arclist/'	//表情存放的路径
	});
 });   
</script>
</body>
</html>