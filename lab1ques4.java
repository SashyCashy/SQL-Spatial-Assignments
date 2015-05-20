import java.io.*;
import java.sql.*;

public class lab1ques4 {
  static BufferedReader getData = new BufferedReader(new InputStreamReader(
                 System.in));
  static int empNumber;
  static int salary;
  public static void main(String [] aa) throws IOException{
    String url;
     url = "jdbc:oracle:thin:@cslabdb:1525:cfedb";
        // jdbc is 'protocol', thin is the driver  ',
                   // and cs514 is the 'user data source'
    Connection conn;
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
         "UPDATE empbb02 set sal= ? where empNumber=?"); // creates object
           //  from which SQL commands  can be sent to the DBMS

      boolean done = false;
      while (!done) {
        gimmeData();
        if (empNumber == 0) {
          done = true; 
          continue;
        }
        pstmt.setInt(2,empNumber);
        pstmt.setInt(1,salary);
        pstmt.executeUpdate();
      }
      pstmt.close();
      conn.close();
    }
    catch (SQLException e){System.err.println("OOPS " + e.getMessage());}
  }
  static void gimmeData() throws IOException {
    System.out.println("Enter a employee number.  Enter 0 to quit.");
    empNumber = Integer.parseInt(getData.readLine());
    if (empNumber != 0) {
      System.out.println("Enter the new salary: ");
      salary = Integer.parseInt(getData.readLine());
      
    }
  }
}
