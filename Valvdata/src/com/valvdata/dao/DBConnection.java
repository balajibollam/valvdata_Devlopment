package com.valvdata.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Map;




//import com.valvdata.util.PropertyReader;



public class DBConnection {
	private static DBConnection instance = new DBConnection();

    private DBConnection()
    {
    	
    }
	
	public static DBConnection getInstance() {
		//Map<String, String> rap=ReadPropertyFile.getInstance().readProperties();
		//System.out.println("adsdsas"+rap.get("DBUrlHost"));
		
		
		System.out.println("instance is in main pattern:::"
				+ instance.hashCode());
		return instance;
	}

	Connection con = null;

	public Connection getConnection(String URL,String User,String pwd) {
		try {
			
			
						
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection(
					URL, User, pwd);
 
			System.out.println("Printing connection here"+con);
			
		} catch (Exception e) {
			//System.out.println("===Connection Failed check database once!"
				//	+ e.getMessage());
			e.printStackTrace();
		}

		return con;

	}
}
