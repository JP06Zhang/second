package com.mall.xiaomi.mapper;

import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.vo.NeedVo;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface NeedMapper extends Mapper<Need> {
    @Select("select need.*, category_name as categoryName " + "from need,category where need.category_id = category.category_id and need.user_id = #{userId}")
    List<NeedVo> getNeed(Integer userId);
}
