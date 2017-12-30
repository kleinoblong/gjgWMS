<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<title>物资领用</title>
<script type="text/javascript">
	//得到当前日期
	formatterDate = function(date) {
		var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
		var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
		+ (date.getMonth() + 1);
		return date.getFullYear() + '-' + month + '-' + day;
	};
	window.onload = function() {
		$('#distributeDate').datebox('setValue', formatterDate(new Date()));
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
									title : '选择领用商品',
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
										top : document.body.scrollTop + document.documentElement.scrollTop,
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
										url : '${proPath}/distribute/insert.action',
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
														top : document.body.scrollTop + document.documentElement.scrollTop,
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
														top : document.body.scrollTop + document.documentElement.scrollTop,
														bottom : ''
													}
												});
											}

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
					field : 'inventoryAmount',
					title : '库存数量',
					width : 80
				}, {
					field : 'inventoryRemark',
					title : '备注',
					width : 600
				}, {
					field : 'distributeAmount',
					title : '领用数量',
					width : 100,
					editor : 'numberbox'
				} ] ],
				onDblClickCell : function(index, field, value) {
					if (editIndex != undefined) {
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

		$('#employeeName')
			.searchbox(
				{
					searcher : function(value, name) {
						parent
							.$('#win')
							.window(
								{
									title : '选择领用人',
									width : 800,
									height : 500,
									modal : true,
									content : "<iframe src='${proPath}/base/goURL/employee/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"
								});

					},
					prompt : '请选择领用人'
				});

		var box = $('#employeeName').searchbox('textbox'); //获取控件文本框对象
		box.attr('disabled', true); // 设置无效，禁用输入
		$('#ff').form("disableValidation");
	});
</script>
</head>
<body class="mybody">
	<form class="myfm" style="padding:15px;margin:0px;background:#eee;"
		id="ff" action="">
		<div class="myfitem">
			<label>请填写领用信息(双击数量单元格开始编辑,单击其他退出编辑)</label> <label>日期：</label> <input
				type="text" id="distributeDate" class="easyui-datebox" name="distributeDate"
				required="required"></input> <label>领用人：</label> <input
				type="hidden" id="employeeId" name="employeeId"></input> <input
				type="text" id="employeeName" name="employeeName"
				required="required"></input>
		</div>
	</form>

	<table id="dg"></table>

</body>
</html>