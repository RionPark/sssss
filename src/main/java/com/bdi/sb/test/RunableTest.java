package com.bdi.sb.test;

class Horse implements Runnable {
	private String name;
	private int mitter = 50;
	public Horse(String name) {
		this.name = name;
	}
	public void run() {
		for(int i=1;i<=50;i++) {
			System.out.println(this.name + "말이 결승지점까지 " + (mitter-i) + "M 남았습니다." );
		}
	}
}
public class RunableTest {

	public static void main(String[] args) {
		Runnable h1 = new Horse("슈퍼스타");
		Runnable h2 = new Horse("얼룩말");
		Thread t = new Thread(h1);
		new Thread(h2).start();
		t.start();
	}
}
