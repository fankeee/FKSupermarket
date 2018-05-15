package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fanke.fksupermarket.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:/applicationContext-dao.xml",
		"classpath*:/applicationContext-service.xml" })
public class Mybatis_Spring_Test {
	@Resource
	private IUserService userService;


	@Test
	public void testFindUserById() {
		System.out.println(userService.checkUserID(1001));
	}
}
