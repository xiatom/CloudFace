package face;


import com.baidu.ai.aip.utils.HttpUtil;

import sun.misc.BASE64Decoder;

import com.baidu.ai.aip.utils.GsonUtils;

import java.util.*;

/**
* 人脸搜索
*/
public class FaceSearch {

    
    public static String search(String photopath) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        try {
        	
        	
        	String strImg = Iamge2BASE64.getImageStr(photopath).replaceAll("\r|\n","");
            Map<String, Object> map = new HashMap<>();
            map.put("image", strImg);
            map.put("liveness_control", "NORMAL");
            
            map.put("group_id_list", "star");
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
//        FaceSearch.search("E:/salaryManager/WebContent/upload//uploadPhoto.png");
//    }
}