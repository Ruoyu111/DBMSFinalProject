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
	public int signinCheck(String username, String password)
	{
		UserDAO dao = new UserDAO();
		List<User> users = dao.findAllUsers();
		
		for(User user : users)
		{
			if(user.getUserName().equals(username) && user.getPassWord().equals(password))
			{
				System.out.println("succeed!");
				return 1;
			}
			
			else
			{
				System.out.println("failed!");
				return 0;
			}
		}
		return 0;
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		signinDAO signindao = new signinDAO();
		System.out.println(signindao.signinCheck("ruoyu", "111"));
	}

}
