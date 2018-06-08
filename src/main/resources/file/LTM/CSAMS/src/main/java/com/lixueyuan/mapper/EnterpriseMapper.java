package com.lixueyuan.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EnterpriseMapper {
	//查询数据库中所有表名
	public List<String> findAllTable(@Param("name") String name);
}
