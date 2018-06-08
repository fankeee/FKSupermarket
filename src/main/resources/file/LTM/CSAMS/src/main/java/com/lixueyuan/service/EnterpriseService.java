package com.lixueyuan.service;

import java.util.List;


public interface EnterpriseService {
    //查询数据库中全部表名
    public List<String> findAllTable(String name);
}
