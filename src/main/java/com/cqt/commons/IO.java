package com.cqt.commons;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

public class IO {
	public static void close(InputStream in) {
		synchronized (in) {
			if(null!=in){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				in = null;
			}
		}
	}
	
	public static void close(Reader r) {
		synchronized (r) {
			if(null!=r){
				try {
					r.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				r = null;
			}
		}
	}
	
	public static void close(OutputStream out) {
		synchronized (out) {
			if(null!=out){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				out = null;
			}
		}
	}
	
	public static void close(Writer w) {
		synchronized (w) {
			if(null!=w){
				try {
					w.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				w = null;
			}
		}
	}
}
