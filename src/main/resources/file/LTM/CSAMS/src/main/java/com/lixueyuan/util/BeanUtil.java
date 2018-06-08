package com.lixueyuan.util;

import java.util.List;

import com.github.pagehelper.Page;

public class BeanUtil {
	public static <T> PagedResult<T> toPagedResult(List<T> datas) {
		PagedResult<T> result = new PagedResult<T>();
		Page page = (Page) datas;
		result.setPageNo(page.getPageNum());
		result.setPageSize(page.getPageSize());
		result.setDataList(page.getResult());
		result.setTotal(page.getTotal());
		result.setPages(page.getPages());
		return result;
	}
}
