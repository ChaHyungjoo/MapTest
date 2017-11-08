package com.hjoo.webapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hjoo.webapp.dao.RestaurantDao;


@Controller
@RequestMapping("/*")
public class MapController {
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@RequestMapping("index")
	//@ResponseBody
	public String index() {
		
		//return "map page";
		return "/WEB-INF/views/index.jsp";
	}
	
	@RequestMapping(value="map", method=RequestMethod.GET)
	public String map() {
		return "/WEB-INF/views/mapTest5.jsp";
	}

	//@RequestMapping("map")
	@RequestMapping(value="map", method=RequestMethod.POST)
	public String map(
			String name, 
			String address, 
			String location, 
			//@RequestParam("file") MultipartFile file, 
			MultipartFile file, 
			HttpServletRequest request) throws IOException {
		
		System.out.println(name);
		System.out.println(address);
		System.out.println(location);
		System.out.println(file.getOriginalFilename());
		
		
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/resources/upload");
		//System.out.println(path);
		
		File f = new File(path);	//파일이 저장될 경로만 객체로 생성된 상태
		
		//경로가 없을 경우 해당 경로(폴더)를 생성
		if(!f.exists()) {
			if(!f.mkdirs())
				System.out.println("디렉토리를 생성할 수 없습니다.");
		}
		
		path += File.separator + file.getOriginalFilename();
		File f2 = new File(path);
		
		System.out.println(path);
		
		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f2);
		
		byte[] buf = new byte[1024];
		
		int size = 0;
		while((size = fis.read(buf)) >0)
			fos.write(buf, 0, size);
		
		fos.close();
		fis.close();
		
		
		return "redirect:index";
	}
	
/*	@RequestMapping(value="map2", method=RequestMethod.GET)
	public String map2() {
		return "/WEB-INF/views/mapTest6.jsp";
	}*/
	
	@RequestMapping("map2")
	public String restaurant(@RequestParam(value="p", defaultValue="1")  Integer page,
							@RequestParam(value="f", defaultValue="name")  String field,
							@RequestParam(value="q", defaultValue="") String query,
							Model model) {
		
		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("page", restaurantDao.getCount());
		
		return "/WEB-INF/views/mapTest6.jsp";
	}
}
