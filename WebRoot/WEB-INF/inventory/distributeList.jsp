<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title></title>
</head>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			//支持多条件查询
			url : '${proPath}/distribute/selectPage.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'distributeId',
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : [ {
				iconCls : 'icon-search',
				text : '查询明细',
				handler : function() {
					//判断是否选中一行，并且只能选中一行
					var array = $('#dg').datagrid("getSelections");
					if (array.length != 1) {
						$.messager.show({
							title : '消息',
							msg : '请选择一条需要查询的记录！',
							showType : 'fade',
							timeout : 1000,
							style : {
								right : '',
								top : document.body.scrollTop + document.documentElement.scrollTop+200,
								bottom : ''
							}
						});

						return false;
					}
					//打开明细窗口
					parent.$('#win').window({
						title : '领用清单明细',
						width : 600,
						height : 500,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/inventory/distributeListDetail.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			},
				{
					field : 'distributeId',
					title : '领用单编号'
				}, {
					field : 'distributeDate',
					title : '领用日期',
					width : 100,
					formatter : function(value, row, index) {
						var unixTimestamp = new Date(value);
						return unixTimestamp.toLocaleString().substring(0, 17);
					}
				}, {
					field : 'account',
					title : '经办人',
					width : 100,
					formatter : function(value, row, index) {
						return row.account.accName;
					}
				}, {
					field : 'employee',
					title : '领用人',
					width : 200,
					formatter : function(value, row, index) {
						return row.employee.employeeName;
					}
				} ] ]
		})
	});
</script>
<body>
	<table id="dg"></table>
</body>
</html>
