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
			url : '${proPath}/inventory/selectPageUseDycMin.action',
			fitColumns : true,
			nowrapL : true,
			rownumbers : true,
			pagination : true,
			singleSelect:true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			queryParams : {
				inventoryName : '%%'
			},
			toolbar : [ {
					iconCls: 'icon-large-chart',
					text:'导出',
					handler: function(){
						window.open("${proPath}/inventory/exportWaringExcel.action")
						}
				},'-',{
				text : "<input type='text' id='inventoryName' name='inventoryName'/>",
			} ],
			columns : [ [ {
				field : 'inventoryName',
				title : '物资名称',
				width : 100
			}, {
				field : 'inventoryAmount',
				title : '数量',
				width : 80
			}, {
				field : 'inventoryType',
				title : '规格',
				width : 80
			}, {
				field : 'inventoryMin',
				title : '库存预警',
				width : 80
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
