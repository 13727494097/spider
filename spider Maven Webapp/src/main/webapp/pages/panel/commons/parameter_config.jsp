<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../commons/header.jsp" %>
<%@include file="../../commons/head.jsp" %>
<%@include file="../../commons/minScript.jsp" %>
<%@include file="../../commons/allScript.jsp" %>

<html>
	<head>
		<title>参数设置</title>
		<style>
			.col-md-5 {
				/* border:1px solid #ddd; */
			}
			ul {
				list-style:none;
				border:1px solid #eee;
				padding-left:0;
			}
			li {
				height:35px;
				line-height:35px;
				border-bottom:1px dotted #ddd;
				padding-left:20px;
			}
			img {
				height:100%;
			}
			.img_r {
				vertical-align:middle;
				float:right;
				width:10%;
			}
			.img_mid {
				text-align:center;
			}
			input {
				float:left;
				height:100%;
				width:70%;
				border-radius:5px;
				border:0;
				border-right:1px solid #eee;
			}
			h4 {
				padding-top:20px;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				
			</div>
			<div class="row">
				<div class="col-md-5">
					<h4 align="center">数据类型</h4>
					<ul>
						<!-- <li flag="0">
							<span>数据类型</span>
							<div class="img_r">
								<img class="img_min" alt="" src="../../imgs/048.png" />
							</div>
						</li>
						<li flag="1">
							<span>类别</span>
							<div class="img_r">
								<img class="img_min" alt="" src="../../imgs/048.png" />
							</div>
						</li>
						<li>
							<input type="text" placeholder="请输入新的词条。。。">
							<div class="img_r">
								<img class="img_plus" alt="" src="../../imgs/plus32.png" />
							</div>
						</li> -->
					</ul>
					
				</div>
				<div class="col-md-offset-5">
					<h4 align="center">数据类别</h4>
					<!-- <ul id="ul_0">
						<li flag="0-0">
							<span >数据类型</span>
							<div class="img_r">
								<img class="img_min" alt="" src="../../imgs/048.png" />
							</div>
						</li>
						<li flag="0-1">
							<span >类别</span>
							<div class="img_r">
								<img class="img_min" alt="" src="../../imgs/048.png" />
							</div>
						</li>
						<li>
							<input type="text" >
							<div class="img_r">
								<img class="img_plus" alt="" src="../../imgs/plus32.png" />
							</div>
						</li>
					</ul> -->
					
				</div>
			</div>
			<div class="row" align="center">
				<button class="btn btn-primary" id="save">确定</button>
				<button class="btn btn-default">取消</button>
			</div>
		</div>
		
	</body>
</html>
<script>
	$('#save').click(function(){
		var send_data ="[";
		var len = $('.col-md-5 li').length;
		len -= 1;
		for(var i=0 ;i<len;i++){
			var $name = $('.col-md-5').find("li[flag='"+i+"']").find('span').html();
			send_data += "{\"id\":"+i+",\"name\":\""+$name+"\",";
			var $li = $("#ul_"+i).find('li[flag]');
			send_data += "\"textValue\":["
			$.each($li,function(i,val){
				send_data += "{\"flag\":\""+this.getAttribute('flag')+"\",\"name\":\""+$(this).find('span').html()+"\"},";
			})
			if($li.length>0){
				send_data = send_data.slice(0,-1);
			}
			send_data += "]},";
		}
		if(len>0){
			send_data = send_data.slice(0,-1);
		}
		send_data += "]"
		$.post('${pageContext.request.contextPath}/panel/commons/saveData',{send_data:send_data},
			function(data){
				showModal("ok","修改参数成功", function  () {$('#confirmModal').modal('show');},
				function  () {$('#confirmModal').modal('hide');});
			}
		);
		
	})
	$(function(){
		var $data = ${dataList};
		var $html="",$html1="";
		for(var i = 0;i<$data.length;i++){
			var $textValue = $data[i].textValue;
			$html += "<li flag="+$data[i].id+"><span>"+$data[i].name+"</span><div class='img_r'><img class='img_min' src='../../imgs/048.png' /></div></li>";
			if(i>0){
				$html1 += "<ul id='ul_"+$data[i].id+"' style='display:none;'>";
			}else{
				$html1 += "<ul id='ul_"+$data[i].id+"'>";
			}
			for(var j = 0;j<$textValue.length;j++){
				$html1 += "<li flag='"+$textValue[j].flag+"'>";
				$html1 += "<span >"+$textValue[j].name+"</span><div class='img_r'><img class='img_min' src='../../imgs/048.png' /></div></li>";
			}
			$html1 += "<li><input type='text' placeholder='请输入新的词条。。。'><div class='img_r'><img class='img_plus' src='../../imgs/plus32.png' /></div></li></ul>"
			
		}
		$html += "<li><input type='text' placeholder='请输入新的词条。。。'><div class='img_r'><img class='img_plus' src='../../imgs/plus32.png' /></div></li>";
		$(".col-md-5 ul").html($html);
		$(".col-md-offset-5").append($html1);
	})
	$(document).on('click','.img_plus',function(){
		var $this = $(this);
		var idx = $this.closest("li").index();
		var $ul = $this.closest("ul").attr("id");
		var $val = $this.parent().prev().val();
		var html = "";
		if($ul){
			var flag = $ul.slice(-1);
			flag += "_"+idx;
			html += "<li flag="+flag+"><span>";
		}else{
			html += "<li flag='"+idx+"'><span>";
			var $content = "<ul id='ul_"+idx+"'><li><input type='text' placeholder='请输入新的词条。。。'>";
			$content += "<div class='img_r'><img class='img_plus' src='../../imgs/plus32.png' /></div></li></ul>";
			$(".col-md-offset-5").append($content);
		}
		html += $val+"</span><div class='img_r'><img class='img_min' src='../../imgs/048.png' /></div></li>";
		$this.closest("li").before(html);
		$this.parent().prev().val("");
	})
	$(document).on('click','.img_min',function(){
		var $this = $(this);
		var $ix = $this.closest('li').attr('flag');
		$this.closest("li").remove();
		var $ul = $this.closest("ul").attr('id')
		if(!$ul){
			$("#ul_"+$ix).remove();
		}
	})
	$(document).on('click','.col-md-5 li',function(){
		var $idx = $(this).attr('flag');
		$(".col-md-offset-5").find('ul').hide();
		$("#ul_"+$idx).show();
	})
</script>