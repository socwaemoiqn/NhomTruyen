package vn.com.nhomtruyen.WebsiteDocTruyen.Common;

import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import vn.com.nhomtruyen.WebsiteDocTruyen.DAO.TruyenDAO;

public class Helper {
	private static Calendar cal;

	public static String CreateId(String prefix) {
		Random rand = new Random();
		int code = rand.nextInt(1000);
		int code1 = rand.nextInt(10000);
		cal = Calendar.getInstance();
		String ngay = cal.get(Calendar.YEAR) + "" + (cal.get(Calendar.MONTH) + 1) + "" + cal.get(Calendar.DAY_OF_MONTH)
				+ "" + cal.get(Calendar.HOUR_OF_DAY) + "" + cal.get(Calendar.MINUTE) + "" + cal.get(Calendar.SECOND)
				+ "" + cal.get(Calendar.MILLISECOND);
		return prefix + "_" + code + ngay + code1;
	}

	public static String getToday() {
		cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.DAY_OF_MONTH);
	}

	public static String getCurrentDateAndTime() {
		cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DAY_OF_MONTH) + " "
				+ cal.get(Calendar.HOUR_OF_DAY) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);

	}

	public static String compareTime(String timeAgo, String today) {
		// Custom date format
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(timeAgo);
			d2 = format.parse(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// trừ thời gian hiện tại cho thời gian trước đó
		long diff = d2.getTime() - d1.getTime();
		long minutes = TimeUnit.MILLISECONDS.toMinutes(diff);
		long hour = TimeUnit.MILLISECONDS.toHours(diff);
		long day = TimeUnit.MILLISECONDS.toDays(diff);
		if (day == 0) {
			if (hour == 0) {
				return minutes + " phút trước";
			} else
				return hour + " giờ trước";
		} else
			return day + " ngày trước";
	}
	public static String ngayThang(String date) {
		String[] d=date.split(" ");
		String[] m=d[0].split("-");
		return m[2]+"/"+m[1];
	}
	@Autowired
	private static TruyenDAO truyenDao;

	public static int sumSLTruyenOfTacGia(int maTacGia) {

		return truyenDao.sumSoLuongTruyenOfTacGia(maTacGia);
	}

	public static String pathVariableString(String name) {
		 try {
	            String temp = Normalizer.normalize(name, Normalizer.Form.NFD);
	            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
	            return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
	      } catch (Exception ex) {
	            ex.printStackTrace();
	      }
	      return null;
	}
	public static String subString(String string) {
		return string.substring(0, string.length()-2);
	}

	public static void main(String[] args) throws ParseException {
		String dateStart = "2017-10-28 21:29:58";
//		cal = Calendar.getInstance();
//		String dateStop = getCurrentDateAndTime();

		//System.out.println("" + compareTime(dateStart, dateStop));
		
		System.out.println(pathVariableString("Sinh Viên Công Nghệ Thông Tin trƯờnG Đh qUy Nhơn"));
		System.out.println(ngayThang(dateStart));
		
	}
}
