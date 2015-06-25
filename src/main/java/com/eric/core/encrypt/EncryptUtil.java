package com.eric.core.encrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;   
import javax.crypto.SecretKey;   
import javax.crypto.SecretKeyFactory;   
import javax.crypto.spec.DESKeySpec;   
import javax.crypto.spec.IvParameterSpec; 

import org.apache.commons.codec.binary.Base64;

/**
 * 加密算法。
 * <br/>1.MD5 
 * <br/>2.SHA-256
 * <br/>3.对称加解密算法。
 */
public class EncryptUtil {

	/**
	 * 使用MD5加密
	 * @param inStr
	 * @return
	 * @throws Exception
	 */
	public static String encryptMd5(String inStr) throws Exception {

		MessageDigest md = null;
		String out = null;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] digest = md.digest(inStr.getBytes());
			return new String( Base64.encodeBase64(digest));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	


	
	/**
	 * 输出明文按sha-256加密后的密文
	 * @param inputStr 明文
	 * @return
	 */
	public static synchronized String encryptSha256(String inputStr) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte digest[] = md.digest(inputStr.getBytes("UTF-8"));
			return new String(Base64.encodeBase64(digest));
		} catch (Exception e) {
			return null;
		}
	}


	private static String byte2hex(byte[] b) {

		String hs = "";
		String stmp = "";
		
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
			//if(16==hs.length())	break;
		}
		return hs.toLowerCase();
	}
	
	
	/**
	 * 密钥
	 */
	private static final String key = "@#$%^6a7";   
	       
    /**
     * 对称解密算法
     * @param message
     * @return
     * @throws Exception
     */
    public static String decrypt(String message) throws Exception {   
        byte[] bytesrc = stringToBytes(message);   
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");   
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));   
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");   
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);   
        IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));   
  
        cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);   
  
        byte[] retByte = cipher.doFinal(bytesrc);   
        return new String(retByte, "UTF-8");   
    }   
	  
    /**
     * 对称加密算法
     * @param message
     * @return
     * @throws Exception
     */
    public static  String encrypt(String message) throws Exception {   
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");   
  
        DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));   
  
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");   
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);   
        IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));   
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);   
  
        String str=bytesToString( cipher.doFinal(message.getBytes("UTF-8")));
        return str;
    }   
  
    /**
     * String转Byte数组   
     * @param temp
     * @return
     */
    private static byte[] stringToBytes(String temp) {   
        byte digest[] = new byte[temp.length() / 2];   
        for (int i = 0; i < digest.length; i++) {   
            String byteString = temp.substring(2 * i, 2 * i + 2);   
            int byteValue = Integer.parseInt(byteString, 16);   
            digest[i] = (byte) byteValue;   
        }   
  
        return digest;   
    }   
       
    /**
     * Byte数组转String   
     * @param b
     * @return
     */
    private static String bytesToString(byte b[]) {   
        StringBuffer hexString = new StringBuffer();   
        for (int i = 0; i < b.length; i++) {   
            String plainText = Integer.toHexString(0xff & b[i]);   
            if (plainText.length() < 2)   
                plainText = "0" + plainText;   
            hexString.append(plainText);   
        }   
 
        return hexString.toString();   
    }   
	  
	   

	
	
}
