package edu.neu.cs5200.project.orm.dao;

import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import edu.neu.cs5200.project.orm.models.SigninRecord;

public class SigninRecordDAO {
	EntityManagerFactory factory = Persistence
			.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// crud
	
	// create record
	public SigninRecord createRecord(SigninRecord record)
	{
		em.getTransaction().begin();
		em.persist(record);
		em.getTransaction().commit();
		return record;
	}
	
	// get userId
	

	public static void main(String[] args) {
		SigninRecordDAO dao = new SigninRecordDAO();
		
		SigninRecord record = new SigninRecord(null, "testname", 999);
		dao.createRecord(record);
	}

}
