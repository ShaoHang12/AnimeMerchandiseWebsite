package com.dao;

import com.entity.ShouhoushenqingEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ShouhoushenqingVO;
import com.entity.view.ShouhoushenqingView;


/**
 * 售后申请
 * 
 * @author 
 * @email 
 * @date 2024-02-23 11:05:07
 */
public interface ShouhoushenqingDao extends BaseMapper<ShouhoushenqingEntity> {
	
	List<ShouhoushenqingVO> selectListVO(@Param("ew") Wrapper<ShouhoushenqingEntity> wrapper);
	
	ShouhoushenqingVO selectVO(@Param("ew") Wrapper<ShouhoushenqingEntity> wrapper);
	
	List<ShouhoushenqingView> selectListView(@Param("ew") Wrapper<ShouhoushenqingEntity> wrapper);

	List<ShouhoushenqingView> selectListView(Pagination page,@Param("ew") Wrapper<ShouhoushenqingEntity> wrapper);
	
	ShouhoushenqingView selectView(@Param("ew") Wrapper<ShouhoushenqingEntity> wrapper);
	

}
