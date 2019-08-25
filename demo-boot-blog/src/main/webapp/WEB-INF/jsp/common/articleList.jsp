<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="title">
	<h3>${param.name == null ? '最新发布'  : param.name}</h3>
	<div class="more">
		<a href="">PHP</a><a href="">JavaScript</a><a href="">EmpireCMS</a><a
			href="">Apache</a><a href="">MySQL</a>
	</div>
</div>

<c:forEach items="${aList}" var="a">
	<article class="excerpt excerpt-1">
		<a class="focus" href="article?id=${a.id}" title=""><img class="thumb"
			data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt="">
		</a>
		<header>
			<a class="cat" href="category?id=${a.category.id}">${a.category.name}<i></i>
			</a>
			<h2>
				<a href="article?id=${a.id}" title="">${a.title}</a>
			</h2>
		</header>
		<p class="meta">
			<time class="time">
				<i class="glyphicon glyphicon-time"></i>${a.createtime}
			</time>
			<span class="views"><i class="glyphicon glyphicon-eye-open"></i>
				共${a.readcnt}人围观</span>
				 <a class="comment" href="${a.id}#comment"><i
				class="glyphicon glyphicon-comment"></i> 0个不明物体</a>
		</p>

		<div style="display: none;" id="d${a.id}">${a.content}</div>

		<p class="note" id="p${a.id}"></p>

		<script type="text/javascript">
			var p = p${a.id};
			var d = d${a.id};
			p.innerText = d.innerText.substring(0, 50);
		</script>

	</article>
</c:forEach>

<nav class="pagination" style="display: none;">
	<ul>
		<li class="prev-page"></li>
		<li class="active"><span>1</span></li>
		<li><a href="?page=2">2</a></li>
		<li class="next-page"><a href="index">下一页</a></li>
		<li><span>共 2 页</span></li>
	</ul>
</nav>