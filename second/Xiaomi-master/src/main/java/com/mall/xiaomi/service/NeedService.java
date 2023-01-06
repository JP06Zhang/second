package com.mall.xiaomi.service;

import com.mall.xiaomi.exception.ExceptionEnum;
import com.mall.xiaomi.exception.XmException;
import com.mall.xiaomi.mapper.NeedMapper;
import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.pojo.Order;
import com.mall.xiaomi.util.IdWorker;
import com.mall.xiaomi.vo.NeedVo;
import com.mall.xiaomi.vo.OrderVo;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class NeedService {

    @Autowired
    private NeedMapper needMapper;

    @Autowired
    private IdWorker idWorker;

    @Transactional
    public void addNeed(List<Need> needs,Integer userId){
        //先添加需求
        String needId = idWorker.nextId() + "";//需求订单号
        for (Need need : needs) {
            Need need1 = new Need();
            need1.setNeedId(needId);
            need1.setNeedName(need.getNeedName());
            need1.setCategoryId(need.getCategoryId());
            need1.setUserId(userId);
            need1.setImgPath(need.getImgPath());
            try {
                needMapper.insert(need1);
            }catch (Exception e) {
                e.printStackTrace();
                throw new XmException(ExceptionEnum.ADD_ORDER_ERROR);
            }
        }
    }

    public List<List<NeedVo>> getNeed(Integer userId){
        List<NeedVo> list = null;
        ArrayList<List<NeedVo>> nv = new ArrayList<>();
        try {
            list = needMapper.getNeed(userId);
            if (ArrayUtils.isEmpty(list.toArray())) {
                throw new XmException(ExceptionEnum.GET_ORDER_NOT_FOUND);
            }
            Map<String, List<NeedVo>> collect = list.stream().collect(Collectors.groupingBy(Need::getNeedId));
            Collection<List<NeedVo>> values = collect.values();
            nv.addAll(values);
        } catch (XmException e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_ORDER_ERROR);
        }
        return nv;
    }
}
