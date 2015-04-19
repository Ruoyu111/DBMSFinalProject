package edu.neu.cs5200.project.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.project.orm.models.User;

public class signinDAO {
	EntityManagerFactory factory = Persistence
			.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// check username and password
	public boolean signinCheck(String username, String password)
	{
		UserDAO dao = new UserDAO();
		List<User> users = dao.findAllUsers();
		
		for(User user : users)
		{
			if(user.getUserName().equals(username) && user.getPassWord().equals(password))
			{
				System.out.println("succeed!");
				return true;
			}
			
			else
			{
				System.out.println("failed!");
				return false;
			}
		}
		return false;
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		signinDAO signindao = new signinDAO();
//		signindao.signinCheck("ru", "123");
	}

}
