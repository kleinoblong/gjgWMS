<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>更改部门信息</title>
</head>
<body class="mybody" style="overflow: hidden;">
	<form id="ff" class="myfm" method="post"
		style="width: 100%;height:100%;">
		<div class="myftitle">请输入部门信息:</div>
		<input type="hidden" name="departmentId">
		<div class="myfitem">
			<label for="departmentName">部门名称:</label> <input type="text"
				name="departmentName" style="width: 260px;" />
		</div>
		<div class="myfitem" style="text-align:center;">
			<a id="btn" href="#" class="easyui-linkbutton">提交</a> <a id="btn2"
				href="#" class="easyui-linkbutton"
				onclick="javascript:parent.$('#win').window('close');">关闭</a>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='部门信息维护']").get(0).contentWindow; //返回ifram页面窗体对象（window)
			var array = win.$("#dg").datagrid("getSelections");

			$("#ff").form('load', {
				departmentId : array[0].departmentId,
				departmentName : array[0].departmentName
			});
			$("[name='departmentName']").validatebox({
				required : true,
				missingMessage : '必填项！'
			});
			//禁用验证
			$("#ff").form("disableValidation");
			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/department/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if (count > 0) {
								parent.$.messager.alert('消息', '修改成功！', 'info');
							} else {
								parent.$.messager.alert('消息', '修改失败！', 'error');
							}
							parent.$("#win").window("close");
							win.$("#dg").datagrid("reload");
							win.$("#dg").datagrid("clearSelections");
						}
					});
				}
			});
		});
	</script>
</body>
</html>
