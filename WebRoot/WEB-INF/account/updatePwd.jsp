<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>修改密码</title>
</head>
<body>

	<form id="ff" method="post">
		<div>
			<label for="accPwd">新密码:</label> 
			<input name="accPwd" type="password" class="easyui-validatebox" data-options="required:true , missingMessage : '请填写新密码！'" />
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>

	<script type="text/javascript">
			//禁用验证
			//$("#ff").form("disableValidation");
	
			$("#btn").click(function() {
				alert("ddddddddddd");
				//$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/account/updatePwd.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if (count > 0) {
								alert("修改成功！");
							} else {
								alert("修改失败！")
							}
						}
					});
	
				}
	
			});
	

	</script>
</body>
</html>
