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
			url : '${proPath}/inventory/selectPageUseDyc.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'inventoryId',
			rownumbers : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			queryParams : {
				inventoryName : '%%'
			},
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					//alert('新增按钮');
					parent.$('#win').window({
						title : '新增物资信息',
						width : 520,
						height : 200,
						modal : true,
						collapsible : false,
						minimizable : false,
						maximizable : false,
						resizable : false,
						content : "<iframe src='${proPath}/base/goURL/inventory/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
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
								top : document.body.scrollTop + document.documentElement.scrollTop,
								bottom : ''
							}
						});

						return false;
					}
					//打开修改窗口
					parent.$('#win').window({
						title : '修改',
						width : 520,
						height : 200,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/inventory/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
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
							ids[i] = array[i].inventoryId;
						}
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('警告', '您确认要将选中物资改为失效吗？', function(r) {
							if (r) {
								//alert(r);
								$.ajax({
									url : "${proPath}/inventory/disable.action",
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
													top : document.body.scrollTop + document.documentElement.scrollTop,
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
													top : document.body.scrollTop + document.documentElement.scrollTop,
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
							msg : '请选择要修改为失效的条目!',
							showType : 'fade',
							timeout : 1000,
							style : {
								right : '',
								top : document.body.scrollTop + document.documentElement.scrollTop,
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
							ids[i] = array[i].inventoryId;
						}
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('警告', '您确认要将选中物资改为生效吗？', function(r) {
							if (r) {
								$.ajax({
									url : "${proPath}/inventory/enable.action",
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
													top : document.body.scrollTop + document.documentElement.scrollTop,
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
													top : document.body.scrollTop + document.documentElement.scrollTop,
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
								top : document.body.scrollTop + document.documentElement.scrollTop,
								bottom : ''
							}
						});
					}
				}
			}, '-', {
				text : "<input type='text' id='inventoryName' name='inventoryName'/>",
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			},
				{
					field : 'inventoryId',
					title : '物资编号'
				}, {
					field : 'inventoryName',
					title : '物资名称',
					width : 100
				}, /* {
				field : 'inventoryAmount',
				title : '数量',
				width : 80
			},  */ {
					field : 'inventoryType',
					title : '规格',
					width : 80
				}, {
					field : 'inventoryMin',
					title : '库存预警',
					width : 80
				}, {
					field : 'inventoryStatus',
					title : '状态',
					width : 80,
					formatter : function(value, row, index) {
						if (value == 0) {
							return "√";
						} else {
							return "×";
						}
					}
				}, {
					field : 'inventoryRemark',
					title : '备注',
					width : 400,
				//align : 'right'
				} ] ]
		});
		$('#inventoryName').searchbox({
			searcher : function(value, name) {
				//alert("inventoryName:"+$('#inventoryName').val());
				$('#dg').datagrid('load', {
					inventoryName : '%' + $('#inventoryName').val() + '%',
				});
			},
			prompt : '搜索物资名称'
		});
	});
</script>
<body>
	<table id="dg"></table>
</body>
</html>
