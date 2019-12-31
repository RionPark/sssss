package com.bdi.sb.test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class TimeTest {

	static class Test extends Thread{
		private String name;
		public Test(String name) {
			this.name = name;
		}
		public void run() {
			String s = "";
			for(int i=1;i<=(50000/5);i++) {
				s+= i;
			}
			log.info("{} : 작업완료",this.name);
			this.interrupt();
		}
	}
	
	public static void main(String[] args) {
		double sTime = System.currentTimeMillis();
		String s = "";
		for(int i=1;i<=50000;i++) {
			s+= i;
		}
		double eTime = System.currentTimeMillis() - sTime; 
		
		log.info("일반 작업 시간 시간 : " + (eTime/1000) + "초");
		sTime = System.currentTimeMillis();
		Test t1 = new Test("작업1");
		Test t2 = new Test("작업2");
		Test t3 = new Test("작업3");
		Test t4 = new Test("작업4");
		Test t5 = new Test("작업5");
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();
		while(!t1.isInterrupted() && !t2.isInterrupted() && !t3.isInterrupted() && !t4.isInterrupted()) {
			
		}
		eTime = System.currentTimeMillis() - sTime; 
		log.info("작업을 5분할로 쓰레드로 돌린 시간 : " + (eTime/1000) + "초");
	}
}
