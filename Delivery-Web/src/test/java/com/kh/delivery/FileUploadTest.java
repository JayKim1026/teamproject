package com.kh.delivery;

import java.io.File;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.delivery.util.FileUploadUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class FileUploadTest {

	@Test
	public void testFileUpload() throws Exception {
		File file = new File("G://images/dog.jpg");
		FileUploadUtil.upload(file, FileUploadUtil.DLVR_IMG);
	}
	
	@Test
	public void testFileDelete() throws Exception {
		String fileName = "dog.jpg";
//		FileUploadUtil.delete(fileName, FileUploadUtil.DLVR_IMG);
	}
	
	@Test
	public void testFileModify() throws Exception {
		String org_fileName = "cat.jpg";
		String mod_fileName = "cat2.jpg";
//		FileUploadUtil.modify(org_fileName, mod_fileName, FileUploadUtil.DLVR_IMG);
	}
}
