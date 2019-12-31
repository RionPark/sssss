package com.bdi.sb.socket;

import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketServerTest {

	public static void main(String[] args) {
		try {
			ServerSocket ss = new ServerSocket(8282);
			boolean proceed = true;
			while(proceed) {
				Socket s = ss.accept();
				OutputStream out = null;
				try {
					out = s.getOutputStream();
					out.write("hello".toString().getBytes());
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					s.close();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
