import java.sql.*;
import java.util.Scanner;

public class MyClass {

	public static void main(String[] args) {
		
		Connection connection;
		Statement statement;
		ResultSet result;
		
		Scanner clavier = new Scanner(System.in);

		
		String other_details;
		int id;
		
		// Parametre de la BDD
		String dbUrl = "jdbc:mariadb://localhost/examjava2020";
		String user = "examjava2020";
		String password = "examjava2020";
		String dbClass = "org.mariadb.jdbc.Driver";
		
		try {
			Class.forName(dbClass);
			connection = DriverManager.getConnection(dbUrl, user, password);
			statement = connection.createStatement();
			result = statement.executeQuery("SELECT * FROM Timesheets");
			while(result.next())
			{
				System.out.println("ID:"+ result.getString("timesheet_id") +"  -  details: "+ result.getString("other_details"));
			}
			System.out.println("Ajout d'un details à la Table 'Timesheet' de la BD examjava2020 ");
			
			
			
			
			
			System.out.print("Entrer le details du timesheet : ");
			other_details = clavier.nextLine();
			
			System.out.println("le texte : "+other_details +" est ajouter dans la bdd");
			String query = "INSERT INTO Timesheets(other_details) VALUES('"+other_details+"')";
			statement.executeQuery(query);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}