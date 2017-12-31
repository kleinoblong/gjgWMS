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
			url : '${proPath}/employee/selectPageUseDyc.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'employeeId',
			rownumbers : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			queryParams : {
				employeeName : '%%'
			},
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					//alert('新增按钮');
					parent.$('#win').window({
						title : '新增人员信息',
						width : 430,
						height : 200,
						modal : true,
						collapsible : false,
						minimizable : false,
						maximizable : false,
						resizable : false,
						content : "<iframe src='${proPath}/base/goURL/employee/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
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
						height : 200,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/employee/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-no',
				text : '失效',
				handler : function() {
					var array = $('#dg').datagrid('getChecked');
					if (array.length > 0) {
						//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].employeeId;
						}
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('警告', '您确认要将选中人员改为离职吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
									url : "${proPath}/employee/disable.action",
									type : "POST",
									//设置为传统方式传送参数
									traditional : true,
									data : {
										pks : ids
									},
									success : function(html) {
										if (html > 0) {
											$.messager.show({
												title : '消息',
												msg : '操作成功，共修改了' + html + '条记录',
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
												msg : '对不超 ，修改失败!',
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
							msg : '请选择要修改为离职的条目!',
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
			}, '-', {
				iconCls : 'icon-ok',
				text : '生效',
				handler : function() {
					var array = $('#dg').datagrid('getChecked');
					if (array.length > 0) {
						//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].employeeId;
						}
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('警告', '您确认要将选中人员改为在职吗？', function(r) {
							if (r) {
								$.ajax({
									url : "${proPath}/employee/enable.action",
									type : "POST",
									//设置为传统方式传送参数
									traditional : true,
									data : {
										pks : ids
									},
									success : function(html) {
										if (html > 0) {
											$.messager.show({
												title : '消息',
												msg : '操作成功，共修改了' + html + '条记录',
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
												msg : '对不超 ，修改失败!',
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
							msg : '请选择要修改为生效的条目!',
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
			}, '-', {
				text : "<input type='text' id='employeeName' name='employeeName'/>",
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			},
				{
					field : 'employeeId',
					title : '人员编号'
				}, {
					field : 'employeeName',
					title : '人员名称',
					width : 100
				}, {
					field : 'department',
					title : '部门名称',
					width : 80,
					formatter : function(value, row, index) {
					return row.department.departmentName;
					}
				}, {
					field : 'employeeStatus',
					title : '在职状态',
					width : 80,
					formatter : function(value, row, index) {
						if (value == 0) {
							return "在职";
						} else {
							return "离职";
						}
					}
				} ] ]
		});
		$('#employeeName').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					employeeName : '%' + $('#employeeName').val() + '%',
				});
			},
			prompt : '搜索人员名称'
		});
	});
</script>
<body>
	
	<div id="win2" >
	<table id="dg"></table>
	</div>
</body>
</html>
