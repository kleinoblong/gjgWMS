<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<title></title>
<style type="text/css">
.searchbox {
	margin: -3
}
</style>
<script type="text/javascript">
	$(function() {
		var curTabWin = null;
		var tab = parent.$('#tt').tabs('getSelected'); // 取得选中tab
		curTabWin = tab.find('iframe')[0].contentWindow;
		$('#dg').datagrid({
			//支持多条件查询
			url : '${proPath}/employee/selectPageUseDycStatus.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'employeeId',
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 10, 15, 20 ],
			queryParams : {
				employeeName : '%%'
			},
			toolbar : [ {
				iconCls : 'icon-save',
				text : '添加',
				handler : function() {
					//alert('保存按钮');
					var row = $("#dg").datagrid("getSelected");
					if (row == null) {
						$.messager.show({
							title : '消息',
							msg : '请选择领用人!',
							showType : 'fade',
							timeout : 1000,
							style : {
								right : '',
								top : document.body.scrollTop + document.documentElement.scrollTop,
								bottom : ''
							}
						});
						return false;
					}
					curTabWin.$("#ff").form('load', {
						employeeId : row.employeeId,
						employeeName : row.employeeName
					});
					self.parent.$('#win').window('close');
				}
			}, '-', {
				text : "名称：<input type='text' id='employeeName' name='employeeName'/>",
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			}, {
				field : 'employeeId',
				title : '人员编号'
			}, {
				field : 'employeeName',
				title : '人员姓名',
				width : 150
			}, {
				field : 'department',
				title : '部门名称',
				width : 80,
				formatter : function(value, row, index) {
					return row.department.departmentName;
				}
			} ] ]
		});
		$('#employeeName').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					employeeName : '%' + value + '%'
				});
			},
			prompt : '按姓名搜索'
		});
	});
</script>
</head>
<body style="margin:0px">
	<div id="win2">
	
	<table id="dg"></table>
	</div>
</body>
</html>