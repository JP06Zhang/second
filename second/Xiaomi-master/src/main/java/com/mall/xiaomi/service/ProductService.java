package com.mall.xiaomi.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mall.xiaomi.exception.ExceptionEnum;
import com.mall.xiaomi.exception.XmException;
import com.mall.xiaomi.mapper.ProductMapper;
import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.pojo.Product;
import com.mall.xiaomi.util.IdWorker;
import com.mall.xiaomi.vo.NeedVo;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Auther: wdd
 * @Date: 2020-03-19 13:21
 * @Description:
 */
@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private IdWorker idWorker;

    public List<Product> getProductByCategoryId(Integer categoryId) {
        List<Product> list = null;
        Example example = new Example(Product.class);
        example.orderBy("productSales").desc();
        example.createCriteria().andEqualTo("categoryId", categoryId);
        PageHelper.startPage(0, 8);
        try {
            list = productMapper.selectByExample(example);
            if (ArrayUtils.isEmpty(list.toArray())) {
                throw new XmException(ExceptionEnum.GET_PRODUCT_NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_PRODUCT_ERROR);
        }
        return list;
    }

    public List<Product> getHotProduct() {
        Example example = new Example(Product.class);
        example.orderBy("productSales").desc();

        PageHelper.startPage(0, 8);
        List<Product> list = null;
        try {
            list = productMapper.selectByExample(example);
            if (ArrayUtils.isEmpty(list.toArray())) {
                throw new XmException(ExceptionEnum.GET_PRODUCT_NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_PRODUCT_ERROR);
        }
        return list;
    }

    public Product getProductById(String productId) {
        Product product = null;
        try {
            product = productMapper.selectByPrimaryKey(productId);
            if (product == null) {
                throw new XmException(ExceptionEnum.GET_PRODUCT_NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_PRODUCT_ERROR);
        }
        return product;
    }

    public PageInfo<Product> getProductByPage(String currentPage, String pageSize, String categoryId) {
        List<Product> list = null;
        PageHelper.startPage(Integer.parseInt(currentPage) - 1, Integer.parseInt(pageSize), true);
        if (categoryId.equals("0")) { // 为0，代表分页查询所有商品
            list = productMapper.selectAll();
        }else {
            // 分类分页查询商品
            Product product = new Product();
            product.setCategoryId(Integer.parseInt(categoryId));
            list = productMapper.select(product);
        }
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);
        return pageInfo;
    }



    @Transactional
    public void addNeed(List<Product> needs, Integer userId){
        //先添加需求
        String needId = idWorker.nextId() + "";//需求订单号
        for (Product need : needs) {
            Product need1 = new Product();
            need1.setNeedId(needId);
            need1.setProductName(need.getProductName());
            need1.setCategoryId(need.getCategoryId());
            need1.setProductTitle(need.getProductTitle());
            need1.setProductIntro(need.getProductIntro());
            need1.setProductPicture(need.getProductPicture());
            need1.setProductPrice(need.getProductPrice());
            need1.setProductSellingPrice(need.getProductSellingPrice());
            need1.setProductNum(need.getProductNum());
            need1.setProductSales(0);
            need1.setUserId(userId);
            try {
                productMapper.insert(need1);
            }catch (Exception e) {
                e.printStackTrace();
                throw new XmException(ExceptionEnum.ADD_ORDER_ERROR);
            }
        }
    }

    public List<List<Product>> getNeed(Integer userId){
        List<Product> list = null;
        ArrayList<List<Product>> nv = new ArrayList<>();
        try {
            list = productMapper.getNeed(userId);
            if (ArrayUtils.isEmpty(list.toArray())) {
                throw new XmException(ExceptionEnum.GET_ORDER_NOT_FOUND);
            }
            Map<String, List<Product>> collect = list.stream().collect(Collectors.groupingBy(Product::getNeedId));
            Collection<List<Product>> values = collect.values();
            nv.addAll(values);
        } catch (XmException e) {
            e.printStackTrace();
            throw new XmException(ExceptionEnum.GET_ORDER_ERROR);
        }
        return nv;
    }
}
