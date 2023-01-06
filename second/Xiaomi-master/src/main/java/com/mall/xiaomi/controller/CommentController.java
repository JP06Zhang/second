package com.mall.xiaomi.controller;

import com.mall.xiaomi.mapper.CommentMapper;
import com.mall.xiaomi.pojo.Comment;
import com.mall.xiaomi.pojo.Product;
import com.mall.xiaomi.service.CommentService;
import com.mall.xiaomi.upload.ServerConfig;
import com.mall.xiaomi.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private ResultMessage resultMessage;

    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("")
        public ResultMessage addComment(@RequestBody List<Comment> commentList, @CookieValue("XM_TOKEN") String cookie) {
        // 先判断cookie是否存在，和redis校验
        Integer userId = (Integer) redisTemplate.opsForHash().get(cookie, "userId");
        commentService.addComment(commentList, userId);
        resultMessage.success("001", "评论成功");
        return resultMessage;
    }

    @GetMapping("")
    public ResultMessage getComment(Integer productId) {
        List<List<Comment>> orders = commentService.getComment(productId);
        resultMessage.success("001", orders);
        return resultMessage;
    }


}