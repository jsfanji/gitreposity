package com.sys.util;




import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



public class FormatUtil {

	public  static String  numberFormartAfterTwo(Number number){
		DecimalFormat formater = new DecimalFormat("#0.##");
		formater.setRoundingMode(RoundingMode.FLOOR);
		return  formater.format(number);
	}

	public static String formatDate(Date date) {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}

	public static String formatDateHmTime(Date date) {
		DateFormat sdf = new SimpleDateFormat("HH:mm");
		return sdf.format(date);
	}
	
	public static String formatDateMMTime(Date date) {
		DateFormat sdf = new SimpleDateFormat("MM");
		return sdf.format(date);
	}
	
	public static String formatDateDDTime(Date date) {
		DateFormat sdf = new SimpleDateFormat("dd");
		return sdf.format(date);
	}
	
	public static String formatDateTime(Date date) {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(date);
	}

	public static String formatDateTimeS(Date date) {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	public static String formatDateTimeWithMiliSecond(Date date) {
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return sdf.format(date);
	}
	public static String formatDateTimeWithMiliSecond2(Date date) {
		DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
	}

	public static Timestamp dateTimeFromString(String s) {
		Date date = new Date();// 获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str = sdf.format(date);// 时间存储为字符串
		Timestamp time = Timestamp.valueOf(str);// 转换时间字符串为Timestamp
		System.out.println(time);// 输出结果
		return time;
	}

	public static Timestamp dateFromString(String s) {
		Date date = new Date();// 获取当前时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(date);// 时间存储为字符串
		Timestamp time = Timestamp.valueOf(str);// 转换时间字符串为Timestamp
		System.out.println(time);// 输出结果
		return time;
	}

	public static String formateCode(long id1, long id2) {
		return strFrom(id1, 5) + strFrom(id2, 5) + formatDateTimeWithMiliSecond(new Date());
	}
	
	public static String formateCode(long id) {
		return strFrom(id, 5) + formatDateTimeWithMiliSecond(new Date());
	}

	public static String strFrom(long code, int width) {
		String str = "" + code;
		while (str.length() < width) {
			str = "0" + str;
		}
		if (str.length() > width) {
			str = str.substring(str.length() - width);
		}
		return str;
	}

//	public  static List<String> trimArray(String[] oldArray) {
//		List<String> tmp = new ArrayList<>();
//		for(String str: oldArray){
//			if(!StrKit.isBlank(str)){
//				tmp.add(str);
//			}
//		}
//		return tmp;
//	}
	
	
	/**
	 * 转换为人名币字符串
	 * @param amount
	 * @return
	 */
    public static String toRmbstr(long amount) {
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(amount / 100D);
    }
    
    public static String toRmbstr(BigDecimal amout) {
  		DecimalFormat df = new DecimalFormat("0.00");
  		return df.format(amout.divide(new BigDecimal(100)));
    }
    
}
