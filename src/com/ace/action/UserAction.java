package com.ace.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ace.model.Star;
import com.ace.model.User;
import com.ace.service.UserService;
import com.ace.util.ExportExcel;

import face.Base2Image;
import face.FaceAdd;
import face.FaceSearch;

//@Controller标明下面这个时控制器类，使用其标注的类就是一个SpringMVC Controller对象
@Controller
//@RequestMapping是一个用来处理请求地址映射的注解，可用于类或方法上
//用于类上表示类中的所有响应请求的方式都是以改地址作为父路径。这里是/user
@RequestMapping("/user")
public class UserAction {
	@Autowired
	UserService userService;

	
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(User user,HttpServletRequest req) {
		User u = userService.checkUser(user);
		if (u != null) {
//			HttpSession session = req.getSession();
//			session.setAttribute("user",u.getId());
			return "success";
		} else
			return "fail";
	}
	
	@RequestMapping("/getUsers")
	public String getUsers(Map<String, List<User>> map) {

		List<User> users = userService.getUsers();
		map.put("users", users);
		return "/user/userList";
	}

	@RequestMapping("/handleUser")
	public String handleUser(@RequestParam("id") int id, Map<String, User> map) {
		User user = userService.getUserById(id);
		map.put("user", user);
		return "/user/handleUser";
	}

	@RequestMapping("/doHandleuser")
	public String doHandleuser(User user, Map<String, List<User>> map) {
		if(user.getId()==0)
			userService.addUser(user);
		else {
			userService.modifyUser(user);
		}
		List<User> users = userService.getUsers();
		map.put("users", users);
		return "/user/userList";
	}

	@RequestMapping("/deluser")
	public String delUser(@RequestParam("id") int id, Map<String, List<User>> map) {
		userService.delUser(id);
		List<User> users = userService.getUsers();
		map.put("users", users);
		return "/user/userList";
	}
	
	@RequestMapping("/addStar")
	public String addUser(@RequestParam("file") MultipartFile file, @RequestParam("user_id") String id, @RequestParam("user_info") String info) {
		String fileRealName = file.getOriginalFilename();
		String format = fileRealName.split("\\.")[1];
		String realPath = "E:/salaryManager/WebContent/upload";
		
		if(isPic(format)!=1)
			return "error";
		
		String pathName = realPath +"\\starPhoto." + format;
		File pathFile = new File(pathName);
		if(pathFile.exists()){
			pathFile.delete();
		}
		try {
			file.transferTo(new File(pathName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Star s = new Star();
		s.setUser_id(id);
		s.setUser_info(info);
		new FaceAdd();
		FaceAdd.add(s,pathName);
		return "success";
	}

	
	
	@RequestMapping("/getPhoto")
	public String getPhoto(String photo, Map<String,Star> map) {
//		System.out.println(photo);
		Star star = new Star();
		String result = FaceSearch.search(photo);
		if(result==null)
			return "error";
		System.out.println(result);
		ArrayList<String> key = new ArrayList<String>();
    	ArrayList<String> value = new ArrayList<String>();
		Hashtable<String, String> hashtable = new Hashtable<>();
    	String[] array = result.split(":|,|}|\\{");
 
    	for(int i=1;i<array.length/2;i++){
    		key.add(array[i*2-1].replaceAll("\"|\\[", ""));
    		value.add(array[i*2]);
    	}
    	
    	if(!array[4].replaceAll("\"", "").equals("SUCCESS"))
    	{
       	 star.setError_msg(array[4].replaceAll("\"", ""));
       	 star.setError_code(array[2].replaceAll("\"", ""));
       	 map.put("star", star);
    	return "/user/detectError";
    	}
    	 star.setError_msg(value.get(key.indexOf("error_msg")).replaceAll("\"", ""));
    	 star.setError_code(value.get(key.indexOf("error_code")));
    	 star.setGroup_id (value.get(key.indexOf("group_id")).replaceAll("\"", ""));
    	 star.setUser_id(value.get(key.indexOf("user_id")).replaceAll("\"", ""));
    	 if(value.get(key.indexOf("user_info")).replaceAll("\"", "").equals("")){
    		 star.setUser_info(getStar(star.getUser_id()));
    	 }
    	 else {
    		 star.setUser_info(value.get(key.indexOf("user_info")).replaceAll("\"", ""));
		}
    	 star.setScore(value.get(key.indexOf("score")));
		map.put("star", star);
		return "/user/showResult";
	}
	

	@RequestMapping("/importfile")
	public String importStudent(@RequestParam("file") MultipartFile file,Map<String,String>map, HttpServletRequest request) {
		
		String fileRealName = file.getOriginalFilename();

		if(fileRealName.indexOf('.')<=0)
			return "error";
		String format = fileRealName.split("\\.")[1];
		String realPath = "E:/salaryManager/WebContent/upload";
		
		
		if(isPic(format)!=1)
			return "error";
		
		String pathName = realPath +"\\uploadPhoto." + format;
//		System.out.println(realPath);
//		System.out.println(pathName);
		File pathFile = new File(pathName);
		if(pathFile.exists()){
			pathFile.delete();
		}
		try {
			file.transferTo(new File(pathName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		map.put("photo", pathName);
//		System.out.println(pathName);
		return "/user/submitUser";
	}
	
	public int isPic(String format){
		if(format.equals("png")||format.equals("jpg")||format.equals("jpeg"))
			return 1;
		else 
			return 0;
		
	}
	
	
	
	
	@RequestMapping("/getCam")
	public String getCam(@RequestParam("test") String file,Map<String,String>map) {
		Base2Image.generateImage(file.replace("data:image/png;base64,", "").replaceAll(" ", ""), "E:/1.png");
		map.put("photo", "E:/1.png");
		return "/user/submitUser";
	}
	
	
	public String getStar(String str){
		String name = "未定义";
		if(str.equals("dlrb"))
			name = "迪丽热巴";
		else if(str.equals("pxh"))
			name = "朴信惠";
		else if(str.equals("pxz"))
			name = "裴秀智";
		else if(str.equals("glm"))
			name = "桂纶镁";
		else if(str.equals("stzm"))
			name = "山田直美";
		else if(str.equals("cx"))
			name = "程潇";
		else if(str.equals("lcy"))
			name = "刘承羽";
		else if(str.equals("gejd"))
			name = "盖儿加朵";
		return name;
	}
}
