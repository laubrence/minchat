package com.eric.core.util;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 取得当前系统的信息。
 * @author zhaohongfeng
 */
public class SystemInfoUtil {

	/**
	 * 取得内存信息
	 * 
	 * @return
	 */
	public static String getMemoryInfo() {
		return Runtime.getRuntime().totalMemory() / 1024L / 1024L + "M/"
				+ Runtime.getRuntime().maxMemory() / 1024L / 1024L + "M";
	}

	/**
	 * 取得JDK信息
	 * 
	 * @return
	 */
	public static String getJdkInfo() {
		return System.getProperty("java.version");
	}

	/**
	 * 取得MAC地址
	 * 
	 * @return
	 */
	public static String getMacInfo() {
		String mac = "";
		try {
			Process process = Runtime.getRuntime().exec("ipconfig /all");
			InputStreamReader ir = new InputStreamReader(
					process.getInputStream(), "gbk");
			LineNumberReader input = new LineNumberReader(ir);
			String line = null;
			while ((line = input.readLine()) != null) {

				Pattern regex = Pattern.compile(
						"\\w{2}-\\w{2}-\\w{2}-\\w{2}-\\w{2}-\\w{2}",
						Pattern.DOTALL | Pattern.CASE_INSENSITIVE
								| Pattern.UNICODE_CASE | Pattern.MULTILINE);
				Matcher regexMatcher = regex.matcher(line);
				if (regexMatcher.find()) {
					String tmp = regexMatcher.group(0);
					if (!tmp.equals("00-00-00-00-00-00"))
						mac += regexMatcher.group(0) + ",";
				}
			}
		} catch (Exception e) {
			return "";
		}
		if (mac.length() > 0)
			mac = mac.substring(0, mac.length() - 1);
		return mac;
	}
	
	

	
}
