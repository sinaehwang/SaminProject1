package egovframework.example.util;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class Ut {
	
	public static String msgAndBack(String msg) {
		StringBuilder sb = new StringBuilder();
		sb.append("<script>");
		sb.append("alert('" + msg + "');");
		sb.append("history.back();");
		sb.append("</script>");

		return sb.toString();
	}
	
	
	public static String msgAndBack(HttpServletRequest req, String msg) {
		req.setAttribute("msg", msg);
		req.setAttribute("historyBack", true);
		return "common/redirect";
	}
	
	public static boolean isStandardLoginIdString(String str) {
		
		if(str==null) {
			return false;
			
		}
		
		if(str.length()==0) {
			return false;
		}
		
		return Character.isDigit(str.charAt(0));
		
	}

}
