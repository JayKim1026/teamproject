
public class fileUploadUtil {

	// 이미지 파일인지 확인하기
	public boolean isImage(String fileName) {
		fileName.getExtension();
		fileName.getBaseName();
		int dotIndex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotIndex+1);
		String upper = extName.toUpperCase();
		if(!upper.equals("JPG") && !upper.equals("PNG") && !upper.equals("GIF")) {
			return false;
		} else {
			return true;
			
		}
	}
}
