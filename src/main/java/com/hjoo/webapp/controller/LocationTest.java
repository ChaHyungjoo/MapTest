package com.hjoo.webapp.controller;

public class LocationTest {

	public static void main(String[] args) {
		String location = "(37.5566398795825, 126.93524677384968)";
		location = location.replaceAll("[(,)]", "");
		
		String[] str = location.split(" ");
		
		for(int i=0; i<str.length; i++)
			System.out.println(str[i]);
		
		//System.out.println(location);
		
	}

}
