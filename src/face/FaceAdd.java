package face;

//package com.baidu.ai.aip;

import com.baidu.ai.aip.utils.HttpUtil;
import com.ace.model.Star;
import com.baidu.ai.aip.utils.GsonUtils;

import java.util.*;

/**
* 人脸注册
*/
public class FaceAdd {

    /**
    * 重要提示代码中所需工具类
    * FileUtil,Base64Util,HttpUtil,GsonUtils请从
    * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
    * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
    * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
    * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
    * 下载
    */
    public static String add(Star star,String photopath) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
        	String strImg = Iamge2BASE64.getImageStr(photopath).replaceAll("\r|\n","");
            Map<String, Object> map = new HashMap<>();
            
            map.put("image", strImg);
            map.put("group_id", "star");
            map.put("user_id", star.getUser_id());
            map.put("user_info", star.getUser_info());
            map.put("liveness_control", "NORMAL");
            map.put("image_type", "BASE64");
            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = "24.f49cf50297969c77c634c74e1c34ad49.2592000.1546483342.282335-15035515";

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
////        FaceAdd.add();
//    }
}