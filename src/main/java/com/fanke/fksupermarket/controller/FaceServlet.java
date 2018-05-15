package com.fanke.fksupermarket.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fanke.fksupermarket.service.IFaceService;
import com.fanke.fksupermarket.service.impl.FaceServiceImpl;
import com.fanke.fksupermarket.util.UploadUtil;
import com.jspsmart.upload.SmartUploadException;

import sun.misc.BASE64Decoder;

/**
 * 
 * @author Fk
 *
 */
@WebServlet("/FaceServlet")
public class FaceServlet extends HttpServlet {

	private static Logger log = LoggerFactory.getLogger(FaceServlet.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//System.out.println("===========FaceServlet=============");
		log.debug("FaceServlet-->>doGet-->>");
		// 处理编码
		response.setCharacterEncoding("UTF-8");

		// 图片路径
		String filePath = null;
		try {
			// 保存图片到磁盘
			filePath = savePic(request, response);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// ==========================================================
		PrintWriter out = response.getWriter();
		IFaceService faceService = new FaceServiceImpl();
		
		out.println(faceService.faceIdentify(request,filePath));
	}

	/**
	 * 保存图片
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws SmartUploadException
	 * @throws IOException
	 * @throws ServletException
	 * @throws SQLException
	 * @throws FileNotFoundException
	 */
	private String savePic(HttpServletRequest request, HttpServletResponse response)
			throws SmartUploadException, IOException, ServletException, SQLException, FileNotFoundException {

		UploadUtil uploadUtil = new UploadUtil();
		PageContext context = JspFactory.getDefaultFactory().getPageContext((Servlet) this, request, response, null,
				true, 8192, true);
		Map<String, String> map = uploadUtil.update(context);
		BASE64Decoder base64 = new BASE64Decoder();

		// 64位解码
		byte[] buffer = base64.decodeBuffer(map.get("imageData"));

		// 写进文件
		String filePath = "images/" + new Date().getTime() + "" + new Random().nextInt(100000) + ".png";
		// 这个获取路径的方法可能会因服务器的不同而获取不到正确的路径
		// filePath = this.getServletContext().getRealPath("/"+filePath);

		// 获取到classes目录的全路径
		String classesPath = this.getClass().getClassLoader().getResource("/").getPath();
		// 先获取classes的路径，在使用字符串截取、拼接，得到Tomcat本项目下的images绝对路径
		filePath = classesPath.substring(1, classesPath.indexOf("WEB-INF")) + filePath;
		//System.out.println("======图片存放路径======" + filePath);
		log.debug("FaceServlet-->>savePic-->>图片存放路径======" + filePath);

		FileOutputStream fos = new FileOutputStream(filePath);
		fos.write(buffer);
		fos.flush();
		fos.close();
		fos = null;
		return filePath;
	}

}