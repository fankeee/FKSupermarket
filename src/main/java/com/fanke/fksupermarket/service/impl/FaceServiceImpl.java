package com.fanke.fksupermarket.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.baidu.aip.face.AipFace;
import com.fanke.fksupermarket.mapper.FaceDao;
import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.service.IFaceService;

@Service
public class FaceServiceImpl implements IFaceService {

	// 设置APPID/AK/SK
	// 在应用列表中查看（详细获取方法请看使用文档）
	String APP_ID = "9910647";
	String API_KEY = "rvk2uy9Unb2Bl2Mft45CHdBm";
	String SECRET_KEY = "YOa3ompF3zWLCTCHUnLpzFNO0BCOkpkp";

	private static Logger log = LoggerFactory.getLogger(FaceServiceImpl.class);

	@Override
	public User findByIdAndName(User user) {
		// TODO Auto-generated method stub
		FaceDao faceDao = new FaceDao();
		// System.out.println("FaceServiceImpl-->>findByIdAndName"+user.getU_id()+"=="+user.getU_name());
		log.debug("FaceServiceImpl-->>findByIdAndName-->>u_id=" + user.getU_id() + ",u_name=" + user.getU_name());
		return faceDao.findByIdAndName(user);
	}

	@Override
	public boolean faceIdentify(HttpServletRequest request, String filePath) throws IOException {

		JSONObject res;
		boolean isSuccess = false;

		// 初始化一个FaceClient
		AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);
		// 可选：设置网络连接参数
		client.setConnectionTimeoutInMillis(2000);
		client.setSocketTimeoutInMillis(60000);

		// 要计算一张图片与指定组group_01 内各用户相似度(可指定多组)
		List<String> groupList = new ArrayList<>();
		groupList.add("group_01");

		// 可选参数
		HashMap<String, Object> options = new HashMap<String, Object>();
		// 返回用户top数，默认为1，最多返回5个
		options.put("user_top_num", 1);

		// 调用识别接口
		res = client.identifyUser(groupList, filePath, options);
		// System.out.println("百度回传数据=======" + res);
		log.debug("FaceServiceImpl-->>faceIdentify-->>百度回传数据=====" + res);

		if (res.has("result")) {
			User user = null;

			JSONObject resultObj = res.getJSONArray("result").getJSONObject(0);
			// 用户id
			String uid = resultObj.getString("uid");
			int u_id = Integer.parseInt(uid.substring(5));
			// 相似度评分
			double scores = resultObj.getJSONArray("scores").getDouble(0);
			// 组id
			String group_id = resultObj.getString("group_id");
			// 用户信息
			String user_info = resultObj.getString("user_info");

			// System.out.println("用户id：" + uid + "\n相似度评分：" + scores + "\n组id："
			// + group_id + "\n用户信息" + user_info);
			log.debug("FaceServiceImpl-->>faceIdentify-->>用户id=" + uid + "\n相似度评分=" + scores + "\n组id=" + group_id
					+ "\n用户信息=" + user_info);

			user = new User();
			user.setU_id(u_id);
			user.setU_name(user_info);

			if (scores >= 80) {
				// System.out.println("==============大于80============");
				log.debug("FaceServiceImpl-->>faceIdentify-->>==============大于80============");

				// 分数大于80分，再判断数据库中是否有对应的用户
				user = findByIdAndName(user);

				if (user != null) {
					// 数据库有对应用户
					// System.out.println("============数据库有匹配用户================");
					log.debug("FaceServiceImpl-->>faceIdentify-->>============数据库有匹配用户================");

					Subject subject = SecurityUtils.getSubject();
					UsernamePasswordToken token = new UsernamePasswordToken(Integer.toString(user.getU_id()),
							user.getU_pwd());
					try {
						subject.login(token);
						request.getSession().setAttribute("user", user);
						request.getSession().setAttribute("error", "");
						isSuccess = true;
					} catch (Exception e) {
						e.printStackTrace();
						request.getSession().setAttribute("error", "用户名或密码错误！");
						// System.out.println("************登陆验证失败**************");
						log.debug("FaceServiceImpl-->>faceIdentify-->>************登陆验证失败**************");
					}

				}
			} else {
				// 登录失败
				// System.out.println("登录失败");
				log.debug("FaceServiceImpl-->>faceIdentify-->>登录失败");
			}
		}
		return isSuccess;
	}

}
