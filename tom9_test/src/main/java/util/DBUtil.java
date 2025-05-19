package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mariadb://np.gitbaby.com:3306/sample", "sample", "1234");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return connection;
	}
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
