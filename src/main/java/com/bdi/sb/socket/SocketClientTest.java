package com.bdi.sb.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

class Calc{
	public int n1;
	Calc(int n1, int n2){
		this.n1 = n1;
	}
}
public class SocketClientTest {

	public static void main(String[] args) {
		try {
			Socket s = new Socket("localhost",8282);
			InputStream is = s.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String bl = null;
			String str = "";
			while((bl=br.readLine())!=null) {
				str += bl;
			}
			System.out.println(str);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
