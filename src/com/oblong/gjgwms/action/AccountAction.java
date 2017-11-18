package com.oblong.gjgwms.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oblong.gjgwms.entity.Account;
import com.oblong.gjgwms.service.AccountService;


@Controller
@RequestMapping (value="/account")
public class AccountAction extends BaseAction{
	@Resource
	private AccountService accountService;
	@RequestMapping(value="/login")
	public  String login(Account account,HttpServletRequest request,HttpSession session) {
		System.out.println("------------传入账户"+account);
		Account login = accountService.login(account);
		System.out.println("------------查出账户"+login);
		if(login!=null){
			System.out.println("正常访问");
			session.setAttribute("account", login);
			return "forward:/WEB-INF/main/main.jsp";
		}else{
			System.out.println("非法访问");
			request.setAttribute("msg", "用户名或密码错误");
			return "forward:/index.jsp";
		}

	}
	
	@RequestMapping(value="/logout")
	public  String logout(Account account,HttpServletRequest request,HttpSession session) {
		System.out.println("------------注销账户"+account);
		account=null;
		System.out.println("------------已注销"+account);
		session.setAttribute("account", account);
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping(value="/updatePwd")
	@ResponseBody
	public  int updatePwd(Account account,HttpSession session) {
		Account a = (Account) session.getAttribute("account");
		account.setAccId(a.getAccId());
		System.out.println("修改密码"+account);
		int i=0;
		try {
			i=accountService.updatePwd(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
}
