package com.yangml.client;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

import org.apache.http.client.ClientProtocolException;

public class ClientAction extends BaseAction{
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 从客户端返回perosn信息岛jsp页面去
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	public String getPersonClient() throws ClientProtocolException, IOException{
		//开始时间
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SS"); 
		TimeZone t = sdf.getTimeZone(); 
		t.setRawOffset(0); 
		sdf.setTimeZone(t); 
		Long startTime = System.currentTimeMillis(); 
		String str = new PersonClient().getPersons(name);
		System.out.println("action="+str.toString());
		getResponse().setContentType("text/html;charset=UTF-8");
		getResponse().getWriter().print(str);
		//结束时间
		Long endTime = System.currentTimeMillis(); 
		System.out.println("需要的时间" + sdf.format(new Date(endTime - startTime))); 
		return null;
	}
}
