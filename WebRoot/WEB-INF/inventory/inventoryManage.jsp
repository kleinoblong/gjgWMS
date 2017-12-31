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
			url : '${proPath}/inventory/selectPageUseDycStatus.action',
			fitColumns : true,
			nowrapL : true,
			//idField:'inventoryId',
			rownumbers : true,
			pagination : true,
			singleSelect : true,
			pageSize : 15,
			pageList : [ 5, 10, 15, 20 ],
			queryParams : {
				inventoryName : '%%'
			},
			toolbar : [ {
				iconCls : 'icon-add',
				text : '入库',
				handler : function() {
					//判断入库面板是否已经打开
					if (parent.$('#tt').tabs("exists", '物资入库')) {
						parent.$('#tt').tabs("select", '物资入库');
					} else {
						parent.$('#tt').tabs('add', {
							title : '物资入库',
							//面板有关闭按键
							closable : true,
							content : "<iframe src='${proPath}/base/goURL/inventory/store.action' height='100%' width='100%' frameborder='0px' ></iframe>"
						});
						
					}
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '领用',
				handler : function() {
					if (parent.$('#tt').tabs("exists", '物资领用')) {
						parent.$('#tt').tabs("select", '物资领用');
					} else {
						parent.$('#tt').tabs('add', {
							title : '物资领用',
							//面板有关闭按键
							closable : true,
							content : "<iframe src='${proPath}/base/goURL/inventory/distribute.action' height='100%' width='100%' frameborder='0px' ></iframe>"
						});
						
					}
				}
			}, '-', {
				iconCls : 'icon-no',
				text : '报废',
				handler : function() {
					parent.$('#win').window({
						title : '物资报废',
						width : 520,
						height : 200,
						modal : true,
						collapsible : false,
						minimizable : false,
						maximizable : false,
						resizable : false,
						content : "<iframe src='${proPath}/base/goURL/inventory/scrap.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-large-chart',
				text : '导出',
				handler : function() {
					window.open("${proPath}/inventory/exportExcel.action")
				}
			}, '-', {
				text : "<input type='text' id='inventoryName' name='inventoryName'/>",
			} ],
			columns : [ [{
				field : 'inventoryName',
				title : '物资名称',
				width : 100,
			}, {
				field : 'inventoryAmount',
				title : '数量',
				width : 100,
			}, {
				field : 'inventoryType',
				title : '规格',
				width : 100,
			}, {
				field : 'inventoryMin',
				title : '库存预警',
				width : 100,
			}, {
				field : 'inventoryRemark',
				title : '备注',
				width : 100,
			//align : 'right'
			} ] ]
		});
		$('#inventoryName').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					inventoryName : '%' + $('#inventoryName').val() + '%',
				});
			},
			prompt : '搜索物资名称'
		});
	});
</script>
<body>
	<table id="dg" ></table>
</body>
</html>
