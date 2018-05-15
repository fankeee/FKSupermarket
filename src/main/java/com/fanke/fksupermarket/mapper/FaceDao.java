package com.fanke.fksupermarket.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.fanke.fksupermarket.po.User;
import com.fanke.fksupermarket.util.JNDI;


public class FaceDao {

	public User findByIdAndName(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 获取连接
			conn = JNDI.getConn();

			// 创建SQL语句
			String sql = "select * from t_user where u_id=? and u_name=?";

			ps = conn.prepareStatement(sql);
			// 处理问号传值

			ps.setInt(1, user.getU_id());
			ps.setString(2, user.getU_name());

			// 执行查询
			rs = ps.executeQuery();
			// 处理结果集
			if (rs.next()) {
				// 用户密码
				String u_pwd = rs.getString("u_pwd");
				// 用户姓名
				// String u_name = rs.getString("u_name");
				// 用户年龄
				int u_age = rs.getInt("u_age");
				// 用户性别
				String u_sex = rs.getString("u_sex");
				// 用户电话
				String u_tel = rs.getString("u_tel");
				
				user.setU_pwd(u_pwd);
				user.setU_age(u_age);
				user.setU_sex(u_sex);
				user.setU_tel(u_tel);
				
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JNDI.close(conn, ps, rs);
		}
		return null;
	}

}
