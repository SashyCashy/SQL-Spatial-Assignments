// to run this code enter    java jdbc0Ora usrname passwd
// This is jdbc0Ora.java.   It connects JDBC to an ORACLE database.
// The database is called cfedb and is located on cslabdb.    
// The driver used is an Oracle 'thin' driver.   The other common driver
// is Oracle OCI, where OCI is Oracle Call Interface.  The drivers most
// commonly used are 'thin', 'oci7', and 'oci8'.  The 'thin' one is used
// a lot for applets.
// To run this you want to have usrname and passwd as command line params.

// NOTE, con.setAutoCommit(true) is legal for a connection called con

import java.io.*;
import java.util.*;
import java.sql.*;
public class jdbc1Ora {
  public static void main(String [] aa) {
    String url;
    url = "jdbc:oracle:thin:@cslabdb:1525:cfedb"; // jdbc is 'protocol', 
                   
    Statement stmt;
    Connection con;
    System.out.println("Enter Employee Name:-");
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    String empName = null;
    
    //  read the username from the command-line; need to use try/catch with the
    //  readLine() method
    try {
       empName = br.readLine();
    } catch (IOException ioe) {
       System.out.println("IO error trying to read your name!");
       System.exit(1);
    }

   // System.out.println("Thanks for the name, " + Integer.parseInt(empNo));
    String empno="0";
     String query = "select * from empbb02 where ename= "+ "'"+empName+"'";
    System.out.println(query);
    try { // invoke the oracle thin driver; register it with DriverManager
      Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
    }   // this step 'loads' the drivers for Oracle that are 'found'
    catch (Exception e) {
      System.out.println("MR.UnitSitQueries.constructor.Exception: " +
        e);
    }
    try {
      con = DriverManager.getConnection(url,aa[0],aa[1]); // establish
              // connection to DBMS or database
      stmt = con.createStatement(); // creates object from which SQL commands
              // can be sent to the DBMS
      ResultSet rs = stmt.executeQuery(query); //create result object to hold
             // information returned by the DBMS
      // Vector rowData = new Vector();
      while (rs.next()) {
        empno = rs.getString(1);
      }
      query = "select * from infobb02 where Empno= "+empno;
      rs = stmt.executeQuery(query); //create result object to hold
      // information returned by the DBMS
// Vector rowData = new Vector();
while (rs.next()) {
 int average = rs.getInt(5);
 int era = rs.getInt(6);
 System.out.println("Average"+average);
System.out.println("Era"+era);
}
      stmt.close();
      con.close();
    }
    catch (SQLException e){System.out.println("OOPS" + e.getMessage());}
  }
}
