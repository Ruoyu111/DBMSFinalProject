package edu.neu.cs5200.project.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.project.orm.models.Administrator;
import edu.neu.cs5200.project.orm.models.SigninRecord;
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
				SigninRecordDAO signinrecorddao = new SigninRecordDAO();
				SigninRecord record = new SigninRecord(null, username, user.getId());
				signinrecorddao.createRecord(record);
				System.out.println("succeed!");
				return user.getId();
			}
		}
		
		System.out.println("failed!");
		return -1;
		
	}
	
	// check admin's username and password
	public int signinCheckAdmin(String username, String password)
	{
		AdministratorDAO dao = new AdministratorDAO();
		List<Administrator> admins = dao.findAllAdministrators();
		
		for(Administrator admin : admins)
		{
			if(admin.getUserName().equals(username) && admin.getPassWord().equals(password))
			{
				System.out.println("succeed!");
				return admin.getId();
			}
		}
		
		System.out.println("failed!");
		return -1;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		signinDAO signindao = new signinDAO();
//		System.out.println(signindao.signinCheck("Jinrong Gong", "123456"));
		System.out.println(signindao.signinCheckAdmin("admin2", "1"));
		
	}

}
