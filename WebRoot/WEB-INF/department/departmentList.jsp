<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改密码</title>
</head>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			//支持多条件查询
			url : '${proPath}/department/selectPage.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'departmentId',
			rownumbers : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					//alert('新增按钮');
					parent.$('#win').window({
						title : '新增部门信息',
						width : 430,
						height : 120,
						modal : true,
						collapsible : false,
						minimizable : false,
						maximizable : false,
						resizable : false,
						content : "<iframe src='${proPath}/base/goURL/department/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
					//alert('修改按钮');
					//判断是否选中一行，并且只能选中一行进行修改
					var array = $('#dg').datagrid("getSelections");
					if (array.length != 1) {
						$.messager.show({
							title : '消息',
							msg : '请选择一条需要修改的记录！', 
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
					//打开修改窗口
					parent.$('#win').window({
						title : '修改',
						width : 430,
						height : 120,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/department/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-no',
				text : '删除',
				handler : function() {
					var array = $('#dg').datagrid('getSelections');
					if (array.length == 1) {
						id = array[0].departmentId;
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('警告', '您确认删除选中的条目吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
									url : "${proPath}/department/delete.action",
									type : "POST",
									//设置为传统方式传送参数
									traditional : true,
									data : {
										pk : id
									},
									success : function(html) {
										if (html > 0) {
											$.messager.show({
												title : '消息',
												msg : '操作成功，共删除了' + html + '条记录',
												showType : 'fade',
												timeout : 1000,
												style : {
													right : '',
													top : document.body.scrollTop + document.documentElement.scrollTop+200,
													bottom : ''
												}
											});
										} else {
											$.messager.show({
												title : '消息',
												msg : '对不超 ，删除失败!',
												showType : 'fade',
												timeout : 1000,
												style : {
													right : '',
													top : document.body.scrollTop + document.documentElement.scrollTop+200,
													bottom : ''
												}
											});
										}
										//重新刷新页面
										$("#dg").datagrid("reload");
										//请除所有勾选的行
										$("#dg").datagrid("clearSelections");
									},
									error : function(XMLHttpRequest, textStatus, errorThrown) {
										$.messager.alert('发生错误', '请联系管理员！', 'error');
									},
									dataType : 'json'
								});
							}
						});
					} else {
						$.messager.show({
							title : '消息',
							msg : '请选择一条要删除的条目!',
							showType : 'fade',
							timeout : 1000,
							style : {
								right : '',
								top : document.body.scrollTop + document.documentElement.scrollTop+200,
								bottom : ''
							}
						});
					}
				}
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			},
				{
					field : 'departmentId',
					title : '部门编号'
				}, {
					field : 'departmentName',
					title : '部门名称',
					width : 500
				}] ]
		});
	});
</script>
<body>
		<table id="dg"></table>
	
</body>
</html>
