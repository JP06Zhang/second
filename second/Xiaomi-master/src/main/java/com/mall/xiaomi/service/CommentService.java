package com.mall.xiaomi.service;

import com.mall.xiaomi.exception.ExceptionEnum;
import com.mall.xiaomi.exception.XmException;
import com.mall.xiaomi.mapper.CommentMapper;
import com.mall.xiaomi.pojo.Comment;
import com.mall.xiaomi.util.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;
@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private IdWorker idWorker;

    @Transactional
    public void addComment(List<Comment> comments, Integer userId){

        for (Comment comment : comments) {
            Comment comment1 = new Comment();
            comment1.setUserId(userId);
            comment1.setUsername(commentMapper.getUserNameByUserId(userId));
            comment1.setProductId(comment.getProductId());
            comment1.setPid(comment.getPid());
            comment1.setTarget(comment.getTarget());
            comment1.setContent(comment.getContent());
            comment1.setCreattime(LocalDateTime.now());

            try {
                commentMapper.insert(comment1);
            }catch (Exception e) {
                e.printStackTrace();
                throw new XmException(ExceptionEnum.ADD_ORDER_ERROR);
            }
        }
    }

    public List<List<Comment>> getComment(Integer productId){
        List<Comment> list = null;
        ArrayList<List<Comment>> ct = new ArrayList<>();
        try {
            list = commentMapper.findAllByProductId(productId);
//            for (Comment a : list){
//                Integer aa = a.getPid();
//                if (aa == null){
//                    Map<Integer, List<Comment>> collect = list.stream().collect(Collectors.groupingBy(Comment::getProductId));
//                    Collection<List<Comment>> values = collect.values();
//                    ct.addAll(values);
//                }else {
                    List<Comment> rootComments = list.stream().filter(comment -> comment.getPid() == null).collect(Collectors.toList());
                    for (Comment rootComment : rootComments) {
                        rootComment.setChildren(list.stream().filter(comment -> rootComment.getId().equals(comment.getPid())).collect(Collectors.toList()));
                    }
                    Collection<List<Comment>> root = Collections.singleton(rootComments);
                    ct.addAll(root);
//                }
//            }
//            if (ArrayUtils.isEmpty(list.toArray())) {
//                throw new XmException(ExceptionEnum.GET_ORDER_NOT_FOUND);
//            }
        } catch (XmException e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_ORDER_ERROR);
        }
        return ct;
    }


    }

