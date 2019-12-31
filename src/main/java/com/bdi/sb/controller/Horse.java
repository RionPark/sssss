package com.bdi.sb.controller;

public class Horse extends Thread {
	private String horseName;
	private int speed;
	private int left = 0;

	public Horse(String horseName, int speed) {
		this.horseName = horseName;
		this.speed = speed;
	}

	public void run() {
		while (!this.isInterrupted()) {
			try {
				Thread.sleep(speed);
				left++;
				if (left != 950) {
				} else {
					this.interrupt();
				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	public String getHorseName() {
		return horseName;
	}

	public void setHorseName(String horseName) {
		this.horseName = horseName;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public int getLeft() {
		return left;
	}

	public void setLeft(int left) {
		this.left = left;
	}

}
