package edu.neu.cs5200.project.orm.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.TravelPlan;
import edu.neu.cs5200.project.orm.models.User;

public class TravelPlanDAO {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory("GOATrip");
		EntityManager em = factory.createEntityManager();
		
		// crud
		
		// createTravelPlan
		public TravelPlan createTravelPlan(TravelPlan travelPlan) {
			em.getTransaction().begin();
			em.persist(travelPlan);
			em.getTransaction().commit();
			return travelPlan;
		}
		
		// findTravelPlanById
		public TravelPlan findTravelPlanById(Integer id)
		{
			return em.find(TravelPlan.class, id); 
		}
		
		// findAllTravelPlans
		public List<TravelPlan> findAllTravelPlans()
		{
			Query query = em.createQuery("select travelPlan from TravelPlan travelPlan");
			return (List<TravelPlan>)query.getResultList();
		}
		// updateTravelPlan
		public TravelPlan updateTravelPlan(TravelPlan travelPlan)
		{
			em.getTransaction().begin();
			em.merge(travelPlan);
			em.getTransaction().commit();
			return travelPlan;
		}
		// deleteTravelPlan
		public void deleteTravelPlan(int id) {
			em.getTransaction().begin();
			TravelPlan travelPlan = em.find(TravelPlan.class, id);
			em.remove(travelPlan);
			em.getTransaction().commit();
		}

		public static void main(String[] args) {
			TravelPlanDAO dao = new TravelPlanDAO();
			
			//	createTravelPlan test
//			TravelPlan travelPlan = new TravelPlan(null, "BuPlan", new Date(), "BuLibrary");
//			dao.createTravelPlan(travelPlan);
			
			//	findTravelPlanById test
//			TravelPlan travelPlan = dao.findTravelPlanById(1);
//			System.out.println(travelPlan.getTitle());
			
			// findAllTravelPlans test
//			List<TravelPlan> travelPlans = dao.findAllTravelPlans();
//			for(TravelPlan travelPlan : travelPlans)
//			{
//				System.out.println(travelPlan.getTitle());
//			}
			
			// updateTravelPlan test
//			TravelPlan bc = dao.findTravelPlanById(2);
//			bc.setTitle("bc");
//			System.out.println(dao.updateTravelPlan(bc).getTitle());
			
			// deleteTravelPlan test
//			dao.deleteTravelPlan(2);
			
			// read user from travelPlan test
//			TravelPlan neu = dao.findTravelPlanById(1);
//			User user = neu.getUser();
//			System.out.println(user.getUserName());
			
		}

	}
