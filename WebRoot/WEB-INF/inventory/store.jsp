<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<title>物资入库</title>
<script type="text/javascript">
	//得到当前日期
	formatterDate = function(date) {
		var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
		var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
		+ (date.getMonth() + 1);
		return date.getFullYear() + '-' + month + '-' + day;
	};
	window.onload = function() {
		$('#storeDate').datebox('setValue', formatterDate(new Date()));
	};
	$(function() {
		//变量用来支持单元格编辑时使用
		var editIndex = undefined;
		$('#dg').datagrid(
			{
				fitColumns : true,
				nowrapL : true,
				idField : 'inventoryId',
				rownumbers : true,
				toolbar : [
					{
						iconCls : 'icon-add',
						text : '添加',
						handler : function() {
							parent.$('#win').window(
								{
									title : '选择入库物资',
									width : 600,
									height : 500,
									modal : true,
									content : "<iframe src='${proPath}/base/goURL/inventory/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"
								});
						}
					},
					'-',
					{
						iconCls : 'icon-remove',
						text : '移除',
						handler : function() {
							var array = $("#dg").datagrid(
								"getSelections");
							if (array.length > 0) {
								for (var i = array.length - 1; i >= 0; i--) {
									var index = $("#dg")
										.datagrid(
											"getRowIndex",
											array[i].inventoryId);
									$("#dg").datagrid(
										"deleteRow", index);
								}
							} else {
								$.messager.show({
									title : '消息',
									msg : '请选择需要移除的物资!',
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
					},
					{
						iconCls : 'icon-ok',
						text : '提交',
						handler : function() {
							$('#ff').form("enableValidation");
							var rows = $("#dg").datagrid(
								"getRows");
							console.info(rows);
							//把对象转成JSON格式的字符串
							rows = JSON.stringify(rows);
							console.info(rows);
							//提交采购到服务端
							$('#ff')
								.form(
									'submit',
									{
										url : '${proPath}/store/insert.action',
										onSubmit : function(
											param) {
											param.rows = rows;
											return true;
										},
										success : function(
											html) {
											if (html > 0) {
												$.messager.show({
													title : '消息',
													msg : '操作成功',
													showType : 'fade',
													timeout : 1000,
													style : {
														right : '',
														top : document.body.scrollTop + document.documentElement.scrollTop+200,
														bottom : ''
													}
												});
												$("#dg").datagrid('loadData', {
													total : 0,
													rows : []
												});
											} else {
												$.messager.show({
													title : '消息',
													msg : '操作失败,请正确填写信息',
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
										//$("#dg").datagrid("selectAll");
										//请除所有勾选的行
										//$("#dg").datagrid("clearSelections");
										}
									});
						}
					} ],
				columns : [ [ {
					field : 'ck',
					checkbox : true,
				}, {
					field : 'inventoryId',
					title : '物资编号',
					width : 200
				}, {
					field : 'inventoryName',
					title : '物资名称',
					width : 150
				}, {
					field : 'inventoryType',
					title : '规格',
					width : 80
				}, {
					field : 'inventoryRemark',
					title : '备注',
					width : 600
				}, {
					field : 'storeAmount',
					title : '数量',
					width : 100,
					editor : 'numberbox'
				} ] ],
				onDblClickCell : function(index, field, value) {
					//结束编辑行, 可以不用，不会被调用，将在单击事件处理
					if (editIndex != undefined) {
						//alert(" onDblClickCell editIndex != undefined");			
						$(this).datagrid('endEdit', editIndex);
						editIndex = undefined;
					}
					//设置可编辑行	
					$(this).datagrid('beginEdit', index);
					editIndex = index;
					//alert("dbclick");				
					var ed = $(this).datagrid('getEditor', {
						index : index,
						field : field
					});
					$(ed.target).focus();
				},
				onClickCell : function(index, field, value) {
					if (editIndex != undefined) {
						//结束编辑行
						$(this).datagrid('endEdit', editIndex);
						editIndex = undefined;
					}
				}
			});
		$('#ff').form("disableValidation");
	});
</script>
</head>
<body class="mybody">
	<form class="myfm" style="padding:15px;margin:0px;background:#eee;"
		id="ff" action="">
		<div class="myfitem">
			<label>请填写入库信息(双击数量单元格开始编辑,单击其他退出编辑)</label> <label>日期：</label><input
				type="text" id="storeDate" class="easyui-datebox" name="storeDate"
				required="required"></input>
		</div>
	</form>
	<table id="dg"></table>
</body>
</html>