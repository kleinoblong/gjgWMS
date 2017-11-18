package com.oblong.gjgwms.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping (value="/base")
public class BaseAction {
	@Resource
	ServletContext application;	
	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL(@PathVariable String folder,@PathVariable String file) {
		return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
	}
	
}
