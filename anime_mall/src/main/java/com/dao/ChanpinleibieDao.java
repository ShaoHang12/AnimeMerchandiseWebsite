package com.dao;

import com.entity.ChanpinleibieEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ChanpinleibieVO;
import com.entity.view.ChanpinleibieView;


/**
 * 产品类别
 * 
 * @author 
 * @email 
 * @date 2024-02-23 11:05:07
 */
public interface ChanpinleibieDao extends BaseMapper<ChanpinleibieEntity> {
	
	List<ChanpinleibieVO> selectListVO(@Param("ew") Wrapper<ChanpinleibieEntity> wrapper);
	
	ChanpinleibieVO selectVO(@Param("ew") Wrapper<ChanpinleibieEntity> wrapper);
	
	List<ChanpinleibieView> selectListView(@Param("ew") Wrapper<ChanpinleibieEntity> wrapper);

	List<ChanpinleibieView> selectListView(Pagination page,@Param("ew") Wrapper<ChanpinleibieEntity> wrapper);
	
	ChanpinleibieView selectView(@Param("ew") Wrapper<ChanpinleibieEntity> wrapper);
	

}
