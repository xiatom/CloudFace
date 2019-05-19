package face;
import java.io.FileOutputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;

public class Base2Image {
	/**
	 * @Description: 将base64编码字符串转换为图片
	 * @Author: 
	 * @CreateTime: 
	 * @param imgStr base64编码字符串
	 * @param path 图片路径-具体到文件
	 * @return
	*/
	public static boolean generateImage(String imgStr, String path) {
	if (imgStr == null)
	return false;
	BASE64Decoder decoder = new BASE64Decoder();
	try {
	// 解密
	byte[] b = decoder.decodeBuffer(imgStr);
	// 处理数据
	for (int i = 0; i < b.length; ++i) {
	if (b[i] < 0) {
	b[i] += 256;
	}
	}
	OutputStream out = new FileOutputStream(path);
	out.write(b);
	out.flush();
	out.close();
	return true;
	} catch (Exception e) {
	return false;
	}
	}
}
