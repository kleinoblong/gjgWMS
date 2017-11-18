<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<title></title>
<script type="text/javascript">
	$(function() {
		$("a[title]").click(function() {
			var text = this.href;
			//alert(text);
			//判断是否存在
			if ($('#tt').tabs("exists", this.title)) {
				//存在则选中
				//alert("存在了");
				$('#tt').tabs("select", this.title);
			} else {
				$('#tt').tabs('add', {
					title : this.title,
					//面板有关闭按键
					closable : true,
					//href对远程页面js的支持不好 
					//href: text			
					//可以加载内容填充到选项卡，页面有Js时，也可加载
					content : "<iframe src='" + text + "' title='" + this.title + "' height='100%' width='100%' frameborder='0px' ></iframe>"
				});
			}
			return false;
		});
	});
</script>
</head>
<body class="easyui-layout">
	<!-- 头部 -->
	<div
		data-options="region:'north',title:'中铁十五局集团物资工程有限公司钢结构厂-库房管理系统',split:false"
		style="height:100px; background:url('${proPath}/images/title.jpg');background-size: cover">
		<div style="text-align: right;">
			<h3 style="font-weight:bold;color:#0099FF">
				欢迎您 ：${sessionScope.account.accName}&nbsp;&nbsp;<a
					href="${proPath}/account/logout.action">注销</a>
			</h3>
		</div>
	</div>
	<!-- 左边导航 -->
	<div
		data-options="region:'west',title:'导航菜单',split:false,collapsible:false"
		style="width:150px;">
		<div id="aa" class="easyui-accordion" style="fit:true;">
			<div title="基础数据管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style:none;padding: 0px;margin:0px;">
					<li style="padding: 6px"><a
						href="${proPath}/base/goURL/account/updatePwd.action"
						title="更改账户密码"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">更改账户密码</a>
					</li>
					<li style="padding: 6px"><a
						href="${proPath}/base/goURL/inventory/inventoryList.action"
						title="物资信息维护"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">物资信息维护</a>
					</li>
					<li style="padding: 6px"><a
						href="${proPath}/base/goURL/employee/employeeList.action"
						title="人员信息维护"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">人员信息维护</a>
					</li>
					<li style="padding: 6px"><a
						href="${proPath}/base/goURL/department/departmentList.action"
						title="部门信息维护"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">部门信息维护</a>
					</li>

				</ul>
			</div>
			<div title="仓库管理">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/inventory/inventoryManage.action"
						title="物资管理"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">物资管理</a>
					</li>
				</ul>
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/inventory/warning.action" title="库存预警"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">库存预警</a>
					</li>
				</ul>
			</div>
			<div title="记录查询">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/inventory/storeList.action" title="入库记录"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">入库记录</a>
					</li>
				</ul>
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/inventory/distributeList.action" title="领用记录"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">领用记录</a>
					</li>
				</ul>
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a href="${proPath}/base/goURL/inventory/scrapList.action" title="报废记录"
						style="text-decoration: none;display: block;font-weight:bold;color:#0099FF">报废记录</a>
					</li>
				</ul>

			</div>
		</div>
	</div>

	<div data-options="region:'center',title:'主要信息'"
		style="padding:5px;background:#eee;">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="系统介绍" style="padding:20px;">
			<h1>本系统为钢结构公司内部仓库管理系统</h1>
			<h2>系统采用Spring+SpringMVC+MyBatis框架进行开发,数据库为Mysql</h2>
			<h2>系统具备物资,部门,人员的基本信息维护;物资出入库管理,物资历史出入库明细查询等功能</h2>
			<h2>希望此次系统有助于公司实现物资管理规范化的目标</h2>
			</div>

		</div>
	</div>
	<div id="win"></div>
</body>
</html>