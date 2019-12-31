package com.bdi.sb.test;

import cc.duduhuo.util.digest.Digest;

public class DigestTest {
	final static String SALT_KEY="thrma"; 

	public static void main(String[] args) {
		String pwd = "1111";
		
		String sha256Pwd = Digest.sha256Hex(pwd+SALT_KEY);
		
		System.out.println(sha256Pwd);
	}
}
