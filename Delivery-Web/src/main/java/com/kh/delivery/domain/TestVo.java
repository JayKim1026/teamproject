package com.kh.delivery.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class TestVo {
	private String aaa;
	private MultipartFile[] files;
	public String getAaa() {
		return aaa;
	}
	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "TestVo [aaa=" + aaa + ", files=" + Arrays.toString(files) + "]";
	}
	
	
}
