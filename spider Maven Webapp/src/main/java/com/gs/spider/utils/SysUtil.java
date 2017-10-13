package com.gs.spider.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
/**
 * 获取27位长度ID
 * @author gzx
 *
 */

import com.alibaba.fastjson.JSONArray;
public class SysUtil {
	public static String getSerialNo(){
		String str="0123456789";
		Date date=new Date();
		StringBuffer sb=new StringBuffer();
		Random random=new Random();
		for(int i=0;i<10;i++){
			sb.append(str.charAt(random.nextInt(str.length())));
		}
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssS");
		String id=String.valueOf(sf.format(date)+sb.toString());
		return id;
	}
	public static JSONArray js;
}
