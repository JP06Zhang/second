package com.mall.xiaomi.mapper;

import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.pojo.Product;
import com.mall.xiaomi.vo.NeedVo;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ProductMapper extends Mapper<Product> {

    @Select("select product_id from product")
    List<Integer> selectIds();

    @Select("select product.*, category_name as categoryName " + "from product,category where product.category_id = category.category_id and product.user_id = #{userId}")
    List<Product> getNeed(Integer userId);

}

