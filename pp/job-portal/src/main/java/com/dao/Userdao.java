package com.dao;
import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Userdao {
	
	private Connection conn;
		

	public Userdao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addUser(User u){
		boolean f=false;
		try {
			String sql="insert into user(name,email,password,qualification,role) values(?,?,?,?,?)";
		PreparedStatement ps= conn.prepareStatement(sql);
		 ps.setString(1,u.getName());
		 ps.setString(2,u.getEmail());
		 ps.setString(3,u.getPassword());
		 ps.setString(4,u.getQualification());
		 ps.setString(5, "user");

	int i=ps.executeUpdate();
	if(i==1) {
		 f=true;
	}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
		
		
		
	}
	public User login(String em, String psw) {
		User u=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
				
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
}
