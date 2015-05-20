import java.io.*;
import java.sql.*;
import java.util.Scanner;
public class lab1ques1 {
  public static void main(String [] aa) {
    String url;
    url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
        // jdbc is 'protocol', thin is the driver  ',
                   // and cs514 is the 'user data source'
    Connection conn;
	int empNumber;
	System.out.println("Please enter a employee no: ");
	Scanner in = new Scanner(System.in);
	empNumber = in.nextInt();
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
      PreparedStatement pstmt = conn.prepareStatement(
         "select nvl(average,0) from infobb02 where empNumber = ?"); // creates object
           //  from which SQL commands  can be sent to the DBMS
      int average =0;
      
      
      pstmt.setInt(1,empNumber);
      ResultSet rs = pstmt.executeQuery();
	  while ( rs.next() )
		{
		average = rs.getInt(1);
		}
	 
		if(average==0){
				System.out.println("Employee with eid "+empNumber+" has no batting average");
	    } else if(average<200){
	            System.out.println("Employee with eid "+empNumber+" has an average below the Mendoza line");
	    }else{
	            System.out.println("Employee with eid "+empNumber+" has a batting average of "+average);
	    }
	
	  rs.close();
      pstmt.close();
      conn.close();
    }
    catch (SQLException e){System.err.println("OOPS " + e.getMessage());}
  }
}
