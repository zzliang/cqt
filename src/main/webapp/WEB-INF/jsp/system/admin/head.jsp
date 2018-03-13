<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar navbar-inverse">
		  <div class="navbar-inner">
		   <div class="container-fluid">
			  <a class="brand" style=" display: inline-block;background: #5db26c; height: 50px; margin: 15px 20px;"><small style="color:#fff;"><i class="icon-leaf"></i> ${pd.SYSNAME}</small> </a>
			  <div class="y seleBox topSele">
				<div class="seleCon">
					<input type="text" class="seleInp" value="选择幼儿园分院" readonly="readonly"/>
					<span class="seleJt"></span>
				</div>
				<div class="seleDownBox">
					<div class="seleDownTit">选择分院</div>
					<ul class="seleList">
						<li>分院1</li>
						<li>分院2</li>
					</ul>
				</div>
			</div>
			  <ul class="nav ace-nav pull-right" style="background: #fff; height: 50px; margin: 15px 20px;">
		
					
					
					<li class="" onclick="creatw();">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-bell-alt icon-animated-bell icon-only"></i>
						</a>
					</li>
					
					
					<li class="user-profile">
						<a class="user-menu dropdown-toggle" href="javascript:;" data-toggle="dropdown">
							<img alt="CQT" src="static/avatars/user.jpg" class="nav-user-photo" />
							<span id="user_info"></span>
							<i class="icon-caret-down"></i>
						</a>
						<ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a onclick="editUserH();" style="cursor:pointer;"><i class="icon-user"></i> 修改资料</a></li>
							<li id="systemset"><a onclick="editSys();" style="cursor:pointer;"><i class="icon-cog"></i> 系统设置</a></li>
							<li id="productCode"><a onclick="productCode();" style="cursor:pointer;"><i class="icon-cogs"></i> 代码生成</a></li>
							<li class="divider"></li>
							<li><a href="logout"><i class="icon-off"></i> 退出</a></li>
						</ul>
					</li>
			  </ul><!--/.ace-nav-->
			  
		   </div><!--/.container-fluid-->
		  </div><!--/.navbar-inner-->
		  
		  
		  
		  
		</div><!--/.navbar-->
	
	
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/myjs/head.js"></script>
		