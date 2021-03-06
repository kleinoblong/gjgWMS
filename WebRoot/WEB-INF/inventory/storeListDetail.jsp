<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title></title>
</head>
<script type="text/javascript">
	$(function() {

		var win = parent.$("iframe[title='入库记录']").get(0).contentWindow; //返回ifram页面窗体对象（window)
		var array = win.$("#dg").datagrid("getSelections");
		var storeId = array[0].storeId;

		$('#dg').datagrid({
			//支持多条件查询
			url : '${proPath}/store/selectPageUseId.action',
			fitColumns : true,
			nowrapL : true,
			fit:true, 
			rownumbers : true,
			pagination : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			queryParams : {
				storeId : storeId
			},
			columns : [ [ 
				{
					field : 'inventoryId',
					title : '物资编号',
					formatter : function(value, row, index) {
						return row.inventory.inventoryId;
					}
				}, {
					field : 'inventoryName',
					title : '物资名称',
					width : 100,
					formatter : function(value, row, index) {
						return row.inventory.inventoryName;
					}
				} , {
					field : 'inventoryType',
					title : '物资规格',
					width : 100,
					formatter : function(value, row, index) {
						return row.inventory.inventoryType;
					}
				}, {
					field : 'inventoryRemark',
					title : '物资备注',
					width : 100,
					formatter : function(value, row, index) {
						return row.inventory.inventoryRemark;
					}
				}, {
					field : 'storeAmount',
					title : '入库数量',
					width : 100
				}] ]
		});


	});
</script>
<body>
	<table id="dg"></table>
</body>
</html>
