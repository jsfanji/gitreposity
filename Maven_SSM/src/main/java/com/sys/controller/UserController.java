package com.sys.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sys.entity.User;
import com.sys.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	 private static final Logger logger = LogManager.getLogger("defaultConfig");
	
	@Autowired
	private UserService userService;

	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		logger.info("进入"+request.getRequestURL()+"的" + request.getMethod()+"方法");
		Object[] o = userService.getAllUser().stream().map((User user) -> {
			Map<String, Object> map = new HashMap<>();
			map.put("id", user.getId());
			map.put("name", user.getName());
			map.put("phone", user.getPhone());
			map.put("created_at", user.getCreated_at());
			return map;
		}).toArray();
		for (int i = 0; i < o.length; i++) {
			System.out.println(o[i]);
		}
		request.setAttribute("result", o);
		System.out.println("Enter TestController.dispatchTest()");
		logger.info("日志打印============="+request.getScheme()+request.getServerName()+ request.getServerPort() + request.getContextPath());
		return "user/list";
	}

}
