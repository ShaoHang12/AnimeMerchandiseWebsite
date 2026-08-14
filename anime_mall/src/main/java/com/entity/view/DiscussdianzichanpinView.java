package com.entity.view;

import com.entity.DiscussdianzichanpinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 电子产品评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-02-23 11:05:07
 */
@TableName("discussdianzichanpin")
public class DiscussdianzichanpinView  extends DiscussdianzichanpinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscussdianzichanpinView(){
	}
 
 	public DiscussdianzichanpinView(DiscussdianzichanpinEntity discussdianzichanpinEntity){
 	try {
			BeanUtils.copyProperties(this, discussdianzichanpinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
