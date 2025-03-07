package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class JOBDAO {
	private Connection conn;
	
	public JOBDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	
	
	public boolean addJobs(Jobs j) {
	    boolean f = false;
	    try {
	        String sql = "INSERT INTO jobs(title, description, category, status, location,user_email) VALUES (?, ?, ?, ?, ?,?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, j.getTitle());
	        ps.setString(2, j.getDescription());
	        ps.setString(3, j.getCategory());
	        ps.setString(4, j.getStatus());
	        ps.setString(5, j.getLocation());
	        ps.setString(6, j.getUserEmail());

	        int i = ps.executeUpdate();
	        System.out.println("SQL Query Executed, Rows Affected: " + i); // Debugging Line

	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	public List<Jobs> getAllJobs()
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				list.add(j);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public Jobs getJobById(int id)
	{
		
		Jobs j=null;
		try {
			String sql="select * from jobs where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return j;
		
	}
	public boolean updateJob(Jobs j) {
		boolean f=false;
		try {
	        String sql = "update jobs  set title=?, description=?, category=?, status=?, location=? where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, j.getTitle());
	        ps.setString(2, j.getDescription());
	        ps.setString(3, j.getCategory());
	        ps.setString(4, j.getStatus());
	        ps.setString(5, j.getLocation());
	        ps.setInt(6,j.getId());
	        
	        int i=ps.executeUpdate();

	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	
	public boolean deleteJob(int id) {
		boolean f=false;
		try {
	        String sql = "delete from jobs   where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        ps.setInt(1,id);
	        
	        int i=ps.executeUpdate();

	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	public List<Jobs> getAllJobsForUser()
	{
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs  where status=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				list.add(j);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	

	public List<Jobs> getJobsByCategoryOrLocation(String category, String location) {
	    List<Jobs> list = new ArrayList<>();
	    Jobs j = null;

	    try {
	        String sql = "SELECT * FROM jobs WHERE category LIKE ? OR location LIKE ? ORDER BY id DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, (category == null || category.isEmpty()) ? "%" : "%" + category + "%");
	        ps.setString(2, (location == null || location.isEmpty()) ? "%" : "%" + location + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            j = new Jobs();
	            j.setId(rs.getInt(1));
	            j.setTitle(rs.getString(2));
	            j.setDescription(rs.getString(3));
	            j.setCategory(rs.getString(4));
	            j.setStatus(rs.getString(5));
	            j.setLocation(rs.getString(6));
	            j.setPdate(rs.getTimestamp(7).toString());
	            list.add(j);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public List<Jobs> getJobsByCategoryAndLocation(String category, String location) {
	    List<Jobs> list = new ArrayList<>();
	    Jobs j = null;

	    try {
	        // AND Condition: Ensures exact match for both category and location
	        String sql = "SELECT * FROM jobs WHERE category = ? AND  location = ?  ORDER BY id DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, category.trim());
	        ps.setString(2, location.trim());

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            j = new Jobs();
	            j.setId(rs.getInt(1));
	            j.setTitle(rs.getString(2));
	            j.setDescription(rs.getString(3));
	            j.setCategory(rs.getString(4));
	            j.setStatus(rs.getString(5));
	            j.setLocation(rs.getString(6));
	            j.setPdate(rs.getTimestamp(7).toString());
	            list.add(j);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}


public List<Jobs> getJobsByUserEmail(String userEmail) {
    List<Jobs> list = new ArrayList<>();
    try {
        String sql = "SELECT * FROM jobs WHERE user_email=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, userEmail);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Jobs j = new Jobs();
            j.setId(rs.getInt("id"));
            j.setTitle(rs.getString("title"));
            j.setDescription(rs.getString("description"));
            j.setLocation(rs.getString("location"));
            j.setCategory(rs.getString("category"));
            j.setStatus(rs.getString("status"));
            j.setPdate(rs.getString("pdate"));
            j.setUserEmail(rs.getString("user_email")); // New field
            list.add(j);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}



	}

