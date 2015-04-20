package edu.neu.cs5200.project.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.project.orm.models.User;

public class registerDAO {
	EntityManagerFactory factory = Persistence
			.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// check duplicate user
	public int registerCheck(String username, String email)
	{
		
		UserDAO dao = new UserDAO();
		List<User> users = dao.findAllUsers();
		
		for(User user : users)
		{
			if(user.getUserName().equals(username))
			{
				System.out.println("The username already exit!");
				return 1;
			}
			
			else if(user.getEmail().equals(email))
			{
				System.out.println("The email already exit!");
				return 2;
			}
		}
		
		System.out.println("congritulations!");
		return 3;
		
	}
	
	public static void main(String[] args)
	{
		registerDAO dao = new registerDAO();
		dao.registerCheck("xiaohua", "xiaohua@gmail.com");
	}
}