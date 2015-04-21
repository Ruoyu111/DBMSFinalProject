package edu.neu.cs5200.project.orm.dao;

import java.util.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.SigninRecord;
import edu.neu.cs5200.project.orm.models.User;

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
	
	// get all records
	public List<SigninRecord> findAllRecord(){
		Query query = em.createQuery("select record from SigninRecord record");
		return (List<SigninRecord>) query.getResultList();
	}
	
	// get last record
	public int findLastRecord(){
		List<SigninRecord> records = findAllRecord();
		int length = 0;
		for(SigninRecord record : records)
		 {
			 length = length + 1;
		 }
		SigninRecord lastRecord = records.get(length-1);
		return lastRecord.getUserId();
	}

	public static void main(String[] args) {
		SigninRecordDAO dao = new SigninRecordDAO();
		
//		SigninRecord record = new SigninRecord(null, "testname", 999);
//		dao.createRecord(record);
		
		// find all records
		 List<SigninRecord> records = dao.findAllRecord();
		 for(SigninRecord record : records)
		 {
			 System.out.println(record.getUserId());
		 }
		 
		 // get last record
		 System.out.println(dao.findLastRecord());
		
		
	}

}
