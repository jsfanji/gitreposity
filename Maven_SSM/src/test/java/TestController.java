import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sys.entity.User;
import com.sys.service.UserService;

public class TestController {
	
	@Test
	public void test() {
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] {"spring.xml","applicationContext.xml"});
		UserService userService = (UserService) ac.getBean("userService");
		List<User> list = userService.getAllUser();
		System.out.println(list);
	}
}
