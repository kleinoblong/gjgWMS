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
		var tab = parent.$('#tt').tabs('getSelected');  // 取得选中tab
		curTabWin = tab.find('iframe')[0].contentWindow;
		$('#dg').datagrid({
			//支持多条件查询
			url : '${proPath}/inventory/selectPageUseDycStatus.action',
			fitColumns : true,
			nowrapL : true,
			idField : 'inventoryId',
			rownumbers : true,
			singleSelect : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 10, 15, 20 ],
			queryParams : {
				inventoryName : '%%'
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
									msg : '请选择需要入库的物资!',
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
					curTabWin.$("#dg").datagrid('appendRow', {
						inventoryId : row.inventoryId,
						inventoryName : row.inventoryName,
						inventoryType : row.inventoryType,
						inventoryAmount : row.inventoryAmount,
						inventoryRemark : row.inventoryRemark,
					});
					//self.parent.$('#win').window('close');
				}
			}, '-', {
				text : "名称：<input type='text' id='inventoryName' name='inventoryName'/>",
			} ],
			columns : [ [ {
				field : 'ck',
				checkbox : true,
			}, {
				field : 'inventoryId',
				title : '物资编号'
			}, {
				field : 'inventoryName',
				title : '物资名称',
				width : 150
			}, {
				field : 'inventoryType',
				title : '规格',
				width : 100
			}, {
				field : 'inventoryAmount',
				title : '库存数量',
				width : 120
			}, {
				field : 'inventoryRemark',
				title : '备注',
				width : 280
			} ] ]
		});
		$('#inventoryName').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					inventoryName : '%' + value + '%'
				});
			},
			prompt : '按名称搜索'
		});
	});
</script>
</head>
<body style="margin:0px">
	<table id="dg"></table>
</body>
</html>