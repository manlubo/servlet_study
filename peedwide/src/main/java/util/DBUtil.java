package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection("jdbc:mariadb://np.gitbaby.com:3306/", "sample", "1234");
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		return connection;
	}
	
	// 접속 테스트
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
