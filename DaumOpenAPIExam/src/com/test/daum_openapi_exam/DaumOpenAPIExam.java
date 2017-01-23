package com.test.daum_openapi_exam;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DaumOpenAPIExam {
	public static void main(String[] args) {
		String keyword = "신학기가방";
		try {
			keyword = URLEncoder.encode(keyword, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String urlString = "https://apis.daum.net/shopping/search"+
				"?apikey=85ac72bf4d97eef7a3de4fafb5407f5c&q="+
				keyword+
				"&result=20&pageno=1&output=json&sort=min_price";
		StringBuffer sb =  new StringBuffer();
		try {
			URL url = new URL(urlString);
			HttpURLConnection conn = 
					(HttpURLConnection)url.openConnection();
			conn.setDoInput(true); conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			InputStreamReader ir = 
					new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(ir);
			String line;
			while((line = br.readLine()) != null) sb.append(line);
			br.close(); ir.close(); conn.disconnect();
			System.out.println(sb.toString());
		} catch(Exception e) {
			e.printStackTrace();
		}
		///////////////////////////////////////////////////
		try {
			//JSON 문자열을 JSON 객체로 역직렬화
			JSONParser jsonParser = new JSONParser();
			JSONObject json = (JSONObject)jsonParser.parse(sb.toString());
			JSONObject channel = (JSONObject)json.get("channel");
			System.out.println(channel.get("result"));
			JSONArray items = (JSONArray)channel.get("item");
			System.out.println(items.size());
			for (int i = 0; i < items.size(); i++) {
				JSONObject obj = (JSONObject)items.get(i);
				System.out.println(i+":"+obj.get("title")+","+
						obj.get("price_min")+","+obj.get("price_max"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
