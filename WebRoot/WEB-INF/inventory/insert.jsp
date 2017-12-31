<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title></title>
</head>
<body class="mybody" style="overflow: hidden;">

	<form id="ff" class="myfm" method="post"
		style="width: 100%;height:100%;">
		<div class="myftitle">请输入物资信息:</div>

		<div class="myfitem">
			<label for="inventoryName">物资名称:</label> <input type="text"
				name="inventoryName" style="width: 260px;" />
		</div>
		<div class="myfitem">
			<label for="inventoryType">物资规格:</label> <input type="text"
				name="inventoryType" style="width: 260px;" />
		</div>
		<div class="myfitem">
			<label for="inventoryMin">预警数量:</label> <input type="text"
				name="inventoryMin" style="width: 260px;" />
		</div>
		<div class="myfitem">
			<label for="inventoryRemark">备注信息:</label> <input type="text"
				name="inventoryRemark" style="width: 260px;" />
		</div>
		<div class="myfitem" style="text-align:center;">
			<a id="btn" href="#" class="easyui-linkbutton">提交</a> <a id="btn2"
				href="#" class="easyui-linkbutton"
				onclick="javascript:parent.$('#win').window('close');">关闭</a>
		</div>
	</form>

	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='物资信息维护']").get(0).contentWindow; //返回ifram页面窗体对象（window)
	
			$("[name='inventoryName']").validatebox({
				required : true,
				missingMessage : '必填项！'
			});
			$("[name='inventoryMin']").validatebox({
				required : true,
				missingMessage : '必填项！'
			});
			//禁用验证
			$("#ff").form("disableValidation");
	
			$("#btn").click(function() {
				//alert("ddddddddddd");
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/inventory/insert.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if (count > 0) {
								parent.$.messager.alert('消息','添加成功！','info');    
							} else {
								parent.$.messager.alert('消息','添加失败！','error'); 
							}
							parent.$("#win").window("close");
							win.$("#dg").datagrid("reload");
						}
					});
	
				}
	
			});
	
		});
	</script>
</body>
</html>
