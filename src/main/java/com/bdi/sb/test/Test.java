package com.bdi.sb.test;

import java.io.PrintStream;

public class Test {
	String str = "123";
	PrintStream out = System.out;
	
	public void test(String str) {
		out.println(str);
	}
	
	public void _jspService() {
		out.println("test");
	}
	public static void main(String[] args) {
		Test t = new Test();
		t._jspService();
	}
}
