package com.bdi.sb.util;

import cc.duduhuo.util.digest.Digest;

public class SHAUtil {

	private final static String SALT_KEY="skseocndthrma";
	
	
	public static String getSHA(String source) {
		String target = Digest.sha256Hex(source+SALT_KEY);
		return target;
	}
	public static void main(String[] args) {
		String pwd = SHAUtil.getSHA("1234");
		System.out.println(pwd);
	}
}
