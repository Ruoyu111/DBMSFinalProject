package edu.neu.cs5200.project.orm.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.Book;
import edu.neu.cs5200.project.orm.models.User;

public class BookDAO {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// crud
	
	// createBook
	public Book createBook(Book book) {
		em.getTransaction().begin();
		em.persist(book);
		em.getTransaction().commit();
		return book;
	}
	
	// findBookById
	public Book findBookById(Integer id)
	{
		return em.find(Book.class, id); 
	}
	
	// findAllBooks
	public List<Book> findAllBooks()
	{
		Query query = em.createQuery("select book from Book book");
		return (List<Book>)query.getResultList();
	}
	// updateBook
	public Book updateBook(Book book)
	{
		em.getTransaction().begin();
		em.merge(book);
		em.getTransaction().commit();
		return book;
	}
	// deleteBook
	public void deleteBook(int id) {
		em.getTransaction().begin();
		Book book = em.find(Book.class, id);
		em.remove(book);
		em.getTransaction().commit();
	}


	public static void main(String[] args) {
		
		BookDAO dao = new BookDAO();
		
		//	createBook test
//		Book book = new Book(null, new Date(), "neuSnell", "car");
//		dao.createBook(book);
		
		//	findBookById test
//		Book book = dao.findBookById(1);
//		System.out.println(book.getLocation());
		
		// findAllBooks test
//		List<Book> books = dao.findAllBooks();
//		for(Book book : books)
//		{
//			System.out.println(book.getLocation());
//		}
		
		// updateBook test
//		Book check = dao.findBookById(1);
//		check.setLocation("mit");
//		System.out.println(dao.updateBook(check).getLocation());
		
		// deleteBook test
		//dao.deleteBook(1);
		
		// read user from Book test
//		Book hotel = dao.findBookById(2);
//		User user = hotel.getUser();
//		System.out.println(user.getUserName());
	
	}

}
