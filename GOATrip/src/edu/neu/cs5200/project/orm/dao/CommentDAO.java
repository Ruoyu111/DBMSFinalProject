package edu.neu.cs5200.project.orm.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.Comment;
import edu.neu.cs5200.project.orm.models.Note;
import edu.neu.cs5200.project.orm.models.User;

public class CommentDAO {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// crud
	
	// createComment
	public Comment createComment(Comment comment) {
		em.getTransaction().begin();
		em.persist(comment);
		em.getTransaction().commit();
		return comment;
	}
	
	// findCommentById
	public Comment findCommentById(Integer id)
	{
		return em.find(Comment.class, id); 
	}
	
	// findAllComments
	public List<Comment> findAllComments()
	{
		Query query = em.createQuery("select comment from Comment comment");
		return (List<Comment>)query.getResultList();
	}
	// updateComment
	public Comment updateComment(Comment comment)
	{
		em.getTransaction().begin();
		em.merge(comment);
		em.getTransaction().commit();
		return comment;
	}
	// deleteComment
	public void deleteComment(int id) {
		em.getTransaction().begin();
		Comment comment = em.find(Comment.class, id);
		em.remove(comment);
		em.getTransaction().commit();
	}


	public static void main(String[] args) {
		
		CommentDAO dao = new CommentDAO();
		
		//	createComment test
//		Comment comment = new Comment(null, "this is comment", "this is content",new Date());
//		dao.createComment(comment);
		
		//	findCommentById test
//		Comment comment = dao.findCommentById(1);
//		System.out.println(comment.getContent());
		
		// findAllComments test
//		List<Comment> comments = dao.findAllComments();
//		for(Comment comment : comments)
//		{
//			System.out.println(comment.getContent());
//		}
		
		// updateComment test
//		Comment check = dao.findCommentById(1);
//		check.setContent("check");
//		System.out.println(dao.updateComment(check).getContent());
		
		// deleteComment test
	//	dao.deleteComment(1);
		
		// read user from comment test
//		Comment comment = dao.findCommentById(2);
//		User user = comment.getUser();
//		System.out.println(user.getUserName());
		
		// read note from comment test
//		Comment comment = dao.findCommentById(2);
//		Note note = comment.getNote();
//		System.out.println(note.getTitle());
	}

}
