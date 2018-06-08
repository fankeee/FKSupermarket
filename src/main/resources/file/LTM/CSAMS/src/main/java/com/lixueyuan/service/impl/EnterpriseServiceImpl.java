package com.lixueyuan.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.lixueyuan.mapper.EnterpriseMapper;
import com.lixueyuan.service.EnterpriseService;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {

	@Resource
	private EnterpriseMapper enterpriseMapper;
	

	@Override
	public List<String> findAllTable(String name) {

		return enterpriseMapper.findAllTable(name);
	}

}

