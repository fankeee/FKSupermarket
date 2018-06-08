package com.lixueyuan.realm;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
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
import org.springframework.beans.factory.annotation.Autowired;

import com.lixueyuan.po.Community;
import com.lixueyuan.po.Manager;
import com.lixueyuan.po.Member;
import com.lixueyuan.service.CommunityService;
import com.lixueyuan.service.ManagerService;
import com.lixueyuan.service.MemberService;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	private ManagerService managerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommunityService communityService;

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
		
		System.out.println("MyRealm-->>doGetAuthorizationInfo-->>授权");
		// 获取用户名
		String username = (String) principals.getPrimaryPrincipal();
		System.out.println("MyRealm-->>doGetAuthorizationInfo-->>用户名=" + username);

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

		// 获取用户类型
		String userType = (String) SecurityUtils.getSubject().getSession().getAttribute("userType");
		System.out.println("用户类型：" + userType);
		
		Set<String> roles;
		if ("Manager".equals(userType)) {
			// 系统管理员
			roles = managerService.getRoles(username);
		} else if ("Community".equals(userType)) {
			// 社团管理员
			roles = communityService.getRoles(username);
		} else {
			// 会员
			roles = memberService.getRoles(username);
		}

		//Set<String> roles = userService.getRoles(username);

		System.out.println("MyRealm-->>doGetAuthorizationInfo-->>角色名=" + roles);
		authorizationInfo.setRoles(roles);
		return authorizationInfo;
	}

	// 验证当前登录的用户，获取认证信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		System.out.println("MyRealm-->>doGetAuthenticationInfo-->>登录认证");

		String username = (String) token.getPrincipal();
		// 获取用户类型
		String userType = (String) SecurityUtils.getSubject().getSession().getAttribute("userType");
		System.out.println("用户类型：" + userType);
		
		if ("Manager".equals(userType)) {
			// 系统管理员

			// 根据管理员学号从数据库查询系统管理员
			Manager manager = managerService.findManagerByNum(username);
			if (manager != null) {
				// 将查询到的管理员学号和密码与ManagerController中的做验证
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(manager.getMA_num(), manager.getMA_pwd(),
						"xx");
				return authcInfo;
			} else {
				return null;
			}

		} else if ("Community".equals(userType)) {
			// 社团管理员

			// 根据社团联系人学号查询
			Community community = communityService.findCommunityByNum(username);
			if (community != null) {
				// 将查询到的社团联系人学号和密码与CommunityController中的做验证
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(community.getC_num(), community.getC_pwd(),
						"xx");
				return authcInfo;
			} else {
				return null;
			}

		} else {
			// 会员

			// 根据会员学号数据库查询会员
			Member member = memberService.findMemberByNum(username);
			if (member != null) {
				// 将查询到的会员学号和密码与MemberCotroller中的做验证
				AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(member.getM_num(), member.getM_pwd(), "xx");
				return authcInfo;
			} else {
				return null;
			}

		}

	}
}
