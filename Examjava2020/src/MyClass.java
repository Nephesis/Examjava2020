import java.sql.*;

public class MyClass {

	public static void main(String[] args) {
		String dbUrl = "jdbc:mariadb://localhost/classicmodels?user=classicmodels&password=classicmodels";
		String dbClass = "org.mariadb.jdbc.Driver";
		String query = "select employeeNumber, firstName, lastName FROM employees";
		
		
	
	try {
		Class.forName(dbClass);
		Connection con = DriverManager.getConnection (dbUrl);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
		int employeeNumber = rs.getInt("employeeNumber");
		String firstName = rs.getString("firstName");
		String lastName = rs.getString("lastName");
		System.out.println("Employee ppr "+ employeeNumber+ " " + firstName + " " + lastName );
		} //end while
		stmt.close();
		con.close();
		} //end try
		catch(ClassNotFoundException e) {
		e.printStackTrace();
		}
		catch(SQLException e) {
		e.printStackTrace();
		}

}

}
