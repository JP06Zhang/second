package com.mall.xiaomi.mapper;


import com.mall.xiaomi.pojo.Comment;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CommentMapper extends Mapper<Comment> {
    @Select("select * " + "from comment where  comment.product_id = #{productId}")
    List<Comment> findAllByProductId(Integer productId);

    @Select("select user.username " + "from user where user.user_id = #{userId}")
     String getUserNameByUserId(int userId);


}
