<%--
  Created by IntelliJ IDEA.
  User: gaoshen
  Date: 16/5/4
  Time: 下午3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${appName }</title>
    <%@include file="../../commons/header.jsp" %>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
    	.container_zs {
    		width:100%;
    	}
    	.col-lg-2 {
    		margin:0;
    		padding:0;
    	}
    	.left-menu {
    		display:block;
    		margin:0;
    		padding:0;
    		width:100%;
    		border:1px solid #ddd;
    		background:#f5f5f5;
    		list-style:none;
    		border-right:0;
    		padding-top:20px;
    		height:100%;
    	}
    	.left-menu li {
    		line-height:40px;
    		height:40px;
    		padding-left:30px;
    	}
    	.left-menu li i {
    		margin-right:35px;
    	}
    	.left-menu li.active{
    		background:#eceeef;
    	}
    	.left-menu li a {
    		font-size:20px;
    		color:#373a3c;
    	}
    	.left-menu li a:hover {
    		text-decoration:none;
    		cursor:pointer;
    		color:#398ebd;
    	}
    	iframe {
    		width:100%;
    		height:100%;
    		border-left:0;
    		border-top:0;
    	}
    	col-lg-10 {
    		margin:0;
    	}
    	.text-center {
    		padding-top:15%;
    		
    		height:100%;
    	}
    </style>
   </head>
<body>
<div class="container_zs">
    <nav class="navbar navbar-dark bg-primary">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">数据采集平台</a>
        
    </nav>
</div>
	<div class="container_zs" style="">
		<div class="col-lg-2">
                <!-- <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                   aria-expanded="false">普通网页抓取</a> -->
                <ul class="left-menu">
                	<li>
	                    <a flag="${pageContext.request.contextPath}/panel/commons/list">
	                    	<i class="fa fa-search"></i>搜索
	                    </a>
                	</li>
                	<li>
	                    <a flag="${pageContext.request.contextPath}/panel/commons/domainList">
	                    	<i class="fa fa-list"></i>网站列表
	                    </a>
                	</li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/tasks">
                    		<i class="fa fa-spinner"></i>查看进度
                    	</a>
                	</li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/editSpiderInfo">
                    	<i class="fa fa-barcode"></i>编辑模板
                    	</a>
                    </li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/listSpiderInfo">
                    	<i class="fa fa-list-ul"></i>模板列表
                    	</a>
                    </li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/updateBySpiderInfoID">
                    	<i class="fa fa-edit"></i>更新数据
                    	</a>
                    </li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/listQuartz">
                    	<i class="fa fa-clock-o"></i>定时任务管理
                    	</a>
                    </li>
                	<li>
                    	<a flag="${pageContext.request.contextPath}/panel/commons/parameter_config">
                    		<i class="fa fa-cog"></i>参数设置
                    	</a>
                    </li>
                </ul>
        </div>
	    <div class="col-lg-10">
	    	<iframe src="${pageContext.request.contextPath}/panel/commons/list" style="display:none;">
	    		
	    	</iframe>
	    	<div class="text-center">
		        <h2 class="display-2 ">欢迎来到${appName }<span class="text-danger" style="font-size: 20;"> &nbsp;&nbsp;Version:${appVersion }</span></h2>
		        <!-- <p class="lead">请选择上方导航栏中的功能</p> -->
	    	</div>
	    	
	        <!-- about more -->
	        <%-- <div class="col-md-12">
		        <a href="${onlineDocumentation }" class="btn btn-info pull-right" target="_blank">在线帮助</a>
	        </div> --%>
	        <!-- end about more -->
	    </div>
	    
	    <%-- <!-- version info -->
	    <div class="col-md-12">
	    	<!-- current version -->
	    	<div class="row">
	    		<div class="alert alert-info">
	    			<h4>当前版本:<small>${appVersion }</small></h4>
	    			<ul>
	    				<li>优化..</li>
	    				<li>修复..</li>
	    			</ul>
	    		</div>
	    	</div>
	    	<!-- end current version -->
	    	
	    	<!-- history version -->
	    	<div class="row">
	    		<div class="alert alert-danger alert-dismissible">
		    		<div class="text-center"><h3>历史版本&nbsp;&nbsp;<a href="javascript:void(0);" class="btn btn-danger btn-sm" onclick="setVisible(this);">显示</a></h3></div>
		    		<div id="history-content" style="display: none;">
			    		<hr/>
		    			<div class="box">
			    			<h5>版本:<small>4.0</small></h5>
			    			<ul>
			    				<li>优化..</li>
			    				<li>修复..</li>
			    			</ul>
		    			</div>
		    			<hr/>
		    			<div class="box">
			    			<h5>版本:<small>3.0</small></h5>
			    			<ul>
			    				<li>优化..</li>
			    				<li>修复..</li>
			    			</ul>
		    			</div>
		    		</div>
	    		</div>
	    	</div>
	    	<!-- end history version -->
	    </div>
	    <!-- end version info --> --%>
	</div>
	
	<%@include file="../../commons/minScript.jsp" %>
	<%-- <script type="text/javascript">
		function setVisible(btn){
			if($("#history-content").is(":hidden")){
				$("#history-content").fadeIn(500);
				$(btn).html("隐藏");
			}else{
				$("#history-content").fadeOut(500);
				$(btn).html("显示");
			}
		}
	</script> --%>
</body>
</html>
<script>
	$(function(){
		//$(".text-center").css("display","none")
	})
	$(".left-menu li a").click(function(){
		$(".text-center").css("display","none")
		var flag = $(this).attr("flag");
		$("iframe").css("display","block").attr("src",flag);
		$(".left-menu li").removeClass("active");
		$(this).parent().addClass('active');
	})
</script>        