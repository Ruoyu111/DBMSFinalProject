package edu.neu.cs5200.project.orm.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.Administrator;

public class AdministratorDAO {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// crud
	
	// createAdministrator
	public Administrator createAdministrator(Administrator administrator) {
		em.getTransaction().begin();
		em.persist(administrator);
		em.getTransaction().commit();
		return administrator;
	}
	
	// findAdministratorById
	public Administrator findAdministratorById(Integer id)
	{
		return em.find(Administrator.class, id); 
	}
	
	// findAllAdministrators
	public List<Administrator> findAllAdministrators()
	{
		Query query = em.createQuery("select administrator from Administrator administrator");
		return (List<Administrator>)query.getResultList();
	}
	// updateAdministrator
	public Administrator updateAdministrator(Administrator administrator)
	{
		em.getTransaction().begin();
		em.merge(administrator);
		em.getTransaction().commit();
		return administrator;
	}
	// deleteAdministrator
	public void deleteAdministrator(int id) {
		em.getTransaction().begin();
		Administrator administrator = em.find(Administrator.class, id);
		em.remove(administrator);
		em.getTransaction().commit();
	}


	public static void main(String[] args) {
		
		AdministratorDAO dao = new AdministratorDAO();
		
		//	createAdministrator test
//		Administrator administrator = new Administrator(null, "ruoyu","111","neu@");
//		dao.createAdministrator(administrator);
		
		//	findAdministratorById test
//		Administrator administrator = dao.findAdministratorById(1);
//		System.out.println(administrator.getUserName());
		
		// findAllAdministrators test
//		List<Administrator> administrators = dao.findAllAdministrators();
//		for(Administrator administrator : administrators)
//		{
//			System.out.println(administrator.getUserName());
//		}
		
		// updateAdministrator test
//		Administrator check = dao.findAdministratorById(1);
//		check.setUserName("mit");
//		System.out.println(dao.updateAdministrator(check).getUserName());
		
		// deleteAdministrator test
//		dao.deleteAdministrator(1);

	}
}
