package com.cqt.commons;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class PM implements Map<String,Object>{
	Map<String,Object> M = new HashMap<String,Object>();
	
	//获取一个参数Map
	public static PM get(){
		return new PM();
	}
	
	public PM put(String key,Object value){
		this.M.put(key, value);
		return this;
	}
	
	public void clear(){
		this.M.clear();
		this.M = null;
	}

	@Override
	public int size() {
		return this.M.size();
	}

	@Override
	public boolean isEmpty() {
		return this.M.isEmpty();
	}

	@Override
	public boolean containsKey(Object key) {
		return this.M.containsKey(key);
	}

	@Override
	public boolean containsValue(Object value) {
		return this.M.containsValue(value);
	}

	@Override
	public Object get(Object key) {
		return this.M.get(key);
	}

	@Override
	public Object remove(Object key) {
		return this.M.remove(key.toString());
	}

	@Override
	public void putAll(Map m) {
		this.M.putAll(m);
		
	}

	@Override
	public Set<String> keySet() {
		return this.M.keySet();
	}

	@Override
	public Collection values() {
		return this.M.values();
	}

	@Override
	public Set entrySet() {
		return this.M.entrySet();
	}
}
