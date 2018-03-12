<%
	String pathl = request.getContextPath();
	String basePathl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+pathl+"/";
%>
		<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
		<div id="sidebar" class="fixedNav">
				<ul class="fixedNavList">

					<li class="sNavActive" id="fhindex">
					  <a href="main/index">后台首页</a>
					</li>



			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.hasMenu}">
				<li id="lm${menu.menuId }">
					  <a style="cursor:pointer;" class="dropdown-toggle" >
						${menu.menuName }
						<span class="navJt"></span>
					  </a>
					  <ul class="sNavList">
						<c:forEach items="${menu.subMenus}" var="sub">
							<c:if test="${sub.hasMenu}">
							<c:choose>
								<c:when test="${not empty sub.menuUrl}">
								<li id="z${sub.menuId }">
								<a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.menuId }','lm${menu.menuId }','${sub.menuName }','${sub.menuUrl }')">${sub.menuName }</a>
								</li>
								</c:when>
								<c:otherwise>
								<li><a href="javascript:void(0);"><i class="icon-double-angle-right"></li>
								</c:otherwise>
							</c:choose>
							</c:if>
						</c:forEach>
			  		</ul>
				</li>
				</c:if>
			</c:forEach>

				</ul><!--/.nav-list-->

				

			</div><!--/#sidebar-->

