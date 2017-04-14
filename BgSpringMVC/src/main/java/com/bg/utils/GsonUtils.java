/**
 * 
 */
package com.bg.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.util.List;

/**
 *
 */
public class GsonUtils {

	public static Gson gsonBuilder(){
		return new GsonBuilder()
		.setDateFormat("yyyy-MM-dd HH:mm:ss")
		.create();
	}

	public static String bean2json(Object o){
		return gsonBuilder().toJson(o);
	}
	
	public static <T> T json2Bean(String json, Class<T> clazz){
		return gsonBuilder().fromJson(json, clazz);
	}
	
	public static <T> List<T> json2List(String json, TypeToken<List<T>> typeTokenOfListT){
		return gsonBuilder().fromJson(json, typeTokenOfListT.getType());
	}
}
