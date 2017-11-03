package com.hjoo.webapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/*")
public class MapController {
	
	@RequestMapping("map")
	//@ResponseBody
	public String index() {
		
		//return "map page";
		return "/WEB-INF/views/mapTest5.jsp";
	}
	
/*	@RequestMapping("upload")
	@ResponseBody
	public String upload(
			String name, 
			String address, 
			String location, 
			MultipartFile file, 
			HttpServletRequest request) throws IOException {
		
		System.out.println(name);
		System.out.println(address);
		System.out.println(location);
		System.out.println(file.getOriginalFilename());
		
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/resource/upload");
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
		
		
		return "aaa";
	}*/

	@RequestMapping(value="upload", method=RequestMethod.POST)
	public String reg(
			String name, 
			String address, 
			String location, 
			MultipartFile file, 
			HttpServletRequest request) {
		
		System.out.println(name);
		System.out.println(address);
		System.out.println(location);
		System.out.println(file.getOriginalFilename());
		
		
		return "aaaa";
	}
	
	
}
