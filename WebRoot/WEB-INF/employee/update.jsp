<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>更改人员信息</title>
</head>
<body class="mybody" style="overflow: hidden;">
	<form id="ff" class="myfm" method="post"
		style="width: 100%;height:100%;">
		<div class="myftitle">请输入人员信息:</div>
		<input type="hidden" name="employeeId">
		<div class="myfitem">
			<label for="employeeName">人员姓名:</label> <input type="text"
				name="employeeName" style="width: 260px;" />
		</div>
		<div class="myfitem">
			<label for="departmentId">所属部门:</label> <input type="text" id="departmentId"
				name="departmentId" style="width: 260px;" />
		</div>
		<br>
		<br>
		<div class="myfitem" style="text-align:center;">
			<a id="btn" href="#" class="easyui-linkbutton">提交</a> <a id="btn2"
				href="#" class="easyui-linkbutton"
				onclick="javascript:parent.$('#win').window('close');">关闭</a>
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='人员信息维护']").get(0).contentWindow; //返回ifram页面窗体对象（window)
			var array = win.$("#dg").datagrid("getSelections");
			$("#ff").form('load', {
				employeeId : array[0].employeeId,
				employeeName : array[0].employeeName
			});
			$("[name='employeeName']").validatebox({
				required : true,
				missingMessage : '必填项！'
			});
			$("[name='departmentId']").validatebox({
				required : true
			});
			
			$("#departmentId").combobox({
				url : '${proPath}/department/select.action',
				valueField : 'departmentId',
				textField : 'departmentName',
				panelHeight:'80'
			});
			//禁用验证
			$("#ff").form("disableValidation");
			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : '${proPath}/employee/update.action',
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
