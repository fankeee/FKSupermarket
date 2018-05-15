package com.fanke.fksupermarket.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.fanke.fksupermarket.po.User;

public interface IFaceService {
	/**
	 * 查询百度回传信息中的用户id在数据库中是否有对应的用户
	 * 
	 * @param user
	 * @return
	 */
	public User findByIdAndName(User user);

	/**
	 * 调用百度接口识别
	 * 
	 * @param request
	 * @param response
	 * @param filePath
	 * @return 
	 * @throws IOException
	 */
	public boolean faceIdentify(HttpServletRequest request, String filePath)
			throws IOException;

}
