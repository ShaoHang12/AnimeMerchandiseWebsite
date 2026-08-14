package com.entity.view;

import com.entity.ShouhoushenqingEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 售后申请
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-02-23 11:05:07
 */
@TableName("shouhoushenqing")
public class ShouhoushenqingView  extends ShouhoushenqingEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ShouhoushenqingView(){
	}
 
 	public ShouhoushenqingView(ShouhoushenqingEntity shouhoushenqingEntity){
 	try {
			BeanUtils.copyProperties(this, shouhoushenqingEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
