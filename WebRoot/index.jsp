<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ESM系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
	<script type="text/javascript" src="JS/jquery-1.10.2.js"></script>
  </head>
  
  <body>
  	<table id='assetcon' class='table table-hover'>
  		<tr><td colspan="2">Person名称&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text" name="name" id="name" value="" style="color:#ccc;width: 250px;height:30px;" />&nbsp;&nbsp;&nbsp;&nbsp;<font style="color: red" size="4px;">输入的设备名称</font></td></tr>
  		<tr>
  			<td><a id="getAsset" class="btn btn-info">获取Person信息</a></td>
  			<td><a id="updateAsset" class="btn btn-success">更新Person信息</a></td>
  		</tr>
  	</table>
  	<table id='assetinfo' class='table table-bordered'>
  		<thead>
	  			<tr>
					<th>Person名称</th>
					<th>Person年龄</th>
					<th>Person地址</th>
	  			</tr>
		</thead>
		<tbody>
		</tbody>
  	</table>
  	
  </body>
  <script type="text/javascript">
  	$(function(){
  	  	$("#getAsset").click(function(){
  	  	  //	alert("==");
  	  	  	
  	  	
		var name = $("#name").val();
		var src='client/client!getPersonClient';
		alert(name)
		var tr = "";
		
		$.post(src,{name:name},function(data){
			var jsonObj = eval("(" + data + ")");  
			$("#assetinfo tbody").html('');
            for (var i = 0; i < jsonObj.length; i++) {  
				//获取返回的数据
				var rackName = jsonObj[i].name;
				var rmName = jsonObj[i].age;
				var rmInner = jsonObj[i].addr;
				//alert(rackName);
            	//处理数据
            	tr+='<tr><td>'+rackName+'</td>'
				+'<td>'+rmName+'</td>'
				+'<td>'+rmInner+'</td>'
				+'</tr>'
				} 
				//alert(tr)
				$("#assetinfo tbody").append(tr);
			})	
  	  	  	})
		
  	  	})
  </script>
</html>