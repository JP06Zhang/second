package com.mall.xiaomi.controller;

import com.mall.xiaomi.pojo.Need;
import com.mall.xiaomi.service.NeedService;
import com.mall.xiaomi.upload.*;
import com.mall.xiaomi.util.ResultMessage;
import com.mall.xiaomi.vo.CartVo;
import com.mall.xiaomi.vo.NeedVo;
import com.mall.xiaomi.vo.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/need")
public class NeedController {

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private NeedService needService;
    @Autowired
    private ResultMessage resultMessage;
    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("")
    public ResultMessage addNeed(@RequestBody List<Need> needList, @CookieValue("XM_TOKEN") String cookie) {
        // 先判断cookie是否存在，和redis校验
        Integer userId = (Integer) redisTemplate.opsForHash().get(cookie, "userId");
        needService.addNeed(needList, userId);
        resultMessage.success("001", "下单成功");
        return resultMessage;
    }

    @GetMapping("")
    public ResultMessage getNeed(@CookieValue("XM_TOKEN") String cookie) {
        // 先判断cookie是否存在，和redis校验
        Integer userId = (Integer) redisTemplate.opsForHash().get(cookie, "userId");
        List<List<NeedVo>> orders = needService.getNeed(userId);
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
