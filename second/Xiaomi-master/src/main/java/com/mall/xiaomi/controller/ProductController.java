package com.mall.xiaomi.controller;

import com.github.pagehelper.PageInfo;
import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.pojo.Product;
import com.mall.xiaomi.service.ProductService;
import com.mall.xiaomi.upload.*;
import com.mall.xiaomi.util.ResultMessage;
import com.mall.xiaomi.vo.NeedVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: wdd
 * @Date: 2020-03-19 13:26
 * @Description:
 */
@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private ResultMessage resultMessage;

    @Autowired
    private ProductService productService;



    @Autowired
    private RedisTemplate redisTemplate;

    @GetMapping("/category/limit/{categoryId}")
    public ResultMessage getProductByCategoryId(@PathVariable Integer categoryId) {
        List<Product> list = productService.getProductByCategoryId(categoryId);
        resultMessage.success("001", list);
        return resultMessage;

    }

    @GetMapping("/category/hot")
    public ResultMessage getHotProduct() {
        List<Product> list = productService.getHotProduct();
        resultMessage.success("001", list);
        return resultMessage;

    }

    @GetMapping("/{productId}")
    public ResultMessage getProduct(@PathVariable String productId) {
        Product product = productService.getProductById(productId);
        resultMessage.success("001", product);
        return resultMessage;
    }

    @GetMapping("/page/{currentPage}/{pageSize}/{categoryId}")
    public Map<String, Object> getProductByPage(@PathVariable String currentPage, @PathVariable String pageSize, @PathVariable String categoryId) {
        PageInfo<Product> pageInfo = productService.getProductByPage(currentPage, pageSize, categoryId);
        HashMap<String, Object> map = new HashMap<>();
        map.put("code", "001");
        map.put("data", pageInfo.getList());
        map.put("total", pageInfo.getTotal());
        return map;
    }

    @PostMapping("")
    public ResultMessage addNeed(@RequestBody List<Product> needList, @CookieValue("XM_TOKEN") String cookie) {
        // 先判断cookie是否存在，和redis校验
        Integer userId = (Integer) redisTemplate.opsForHash().get(cookie, "userId");
        productService.addNeed(needList, userId);
        resultMessage.success("001", "下单成功");
        return resultMessage;
    }

    @GetMapping("")
    public ResultMessage getNeed(@CookieValue("XM_TOKEN") String cookie) {
        // 先判断cookie是否存在，和redis校验
        Integer userId = (Integer) redisTemplate.opsForHash().get(cookie, "userId");
        List<List<Product>> orders = productService.getNeed(userId);
        resultMessage.success("001", orders);
        return resultMessage;
    }
    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }
}
