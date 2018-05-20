package com.fanke.fksupermarket.realm;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.service.IUserService;

public class MyRealm extends AuthorizingRealm {

	@Resource
	private IUserService userService;

	private static Logger log = LoggerFactory.getLogger(MyRealm.class);

	// 设置Realm的名称
	@Override
	public String getName() {
		return super.getName();
	}

	// 支持UsernamePasswordToken
	@Override
	public boolean supports(AuthenticationToken token) {
		return token instanceof UsernamePasswordToken;
	}

	// 为当前登陆成功的用户授予权限和角色，已经登陆成功了
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		log.debug("MyRealm-->>doGetAuthorizationInfo-->>授权");
		// 获取用户名
		Integer userId = (Integer) principals.getPrimaryPrincipal(); 
		log.debug("MyRealm-->>doGetAuthorizationInfo-->>用户ID=" + userId);

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Set<String> roles = userService.getRoles(userId);
		log.debug("MyRealm-->>doGetAuthorizationInfo-->>角色名=" + roles);
		authorizationInfo.setRoles(roles);
		
		return authorizationInfo;
	}

	// 验证当前登录的用户，获取认证信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		//System.out.println("AuthenticationInfo===登录认证");
		log.debug("MyRealm-->>doGetAuthenticationInfo-->>登录认证");

		String userId = (String) token.getPrincipal();
		//User user = userService.getByUsername(userName);
		User user = userService.getByUid(Integer.valueOf(userId));
		// System.out.println("************11111111111************");
		if (user != null) {
			// System.out.println("开始身份认证:::"+user.getU_name()+"\t"+user.getU_pwd());
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getU_id(), user.getU_pwd(), "xx");
			// System.out.println("登录认证结束，返回。。。。。。"+authcInfo.toString());
			return authcInfo;
		} else {
			return null;
		}
	}
}