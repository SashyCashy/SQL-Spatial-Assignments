import java.io.*;
import java.sql.*;
import java.util.Scanner;
public class Lab1ques3 {
  public static void main(String [] aa) {
    String url;
    url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
        // jdbc is 'protocol', thin is the driver  ',
                   // and cs514 is the 'user data source'
    Connection conn;
	String lastName = "";
	System.out.println("Please enter a last name: ");
	Scanner in = new Scanner(System.in);
	lastName = in.nextLine();
	
    try { // invoke oracle thin driver; register it with DriverManager
      Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch (Exception e) {
      System.out.println("MR.UnitSitQueries.constructor.Exception: " +
        e);
    }
    try {
      conn = DriverManager.getConnection(url,"st27","sashank123"); 
         // establish connection to DBMS or database
      CallableStatement cstmt = conn.prepareCall(
         "{CALL second(?,?,?)}"); // creates object
           //  from which SQL commands  can be sent to the DBMS
      int era = 0, average = 0;
	  
      
      cstmt.setString(1,lastName);
      cstmt.setInt(2,era);
      cstmt.setInt(3,average);
      cstmt.registerOutParameter(2,Types.NUMERIC,0); // 0 is the 'scale'
                       // which is the number of digits after the decimal
      cstmt.registerOutParameter(3,Types.NUMERIC,0);
      cstmt.executeUpdate();
      era = cstmt.getInt(2);
      average = cstmt.getInt(3); 
	  System.out.println(lastName+" has an era of " + era + " and has an average of "+ average );
      cstmt.close();
      conn.close();
    }
    catch (SQLException e){System.err.println("OOPS " + e.getMessage());}
  }
}
