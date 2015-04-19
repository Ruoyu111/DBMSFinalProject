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

public class NoteDAO {
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();
	
	// crud
	
	// createNote
	public Note createNote(Note note) {
		em.getTransaction().begin();
		em.persist(note);
		em.getTransaction().commit();
		return note;
	}
	
	// findNoteById
	public Note findNoteById(Integer id)
	{
		return em.find(Note.class, id); 
	}
	
	// findAllNotes
	public List<Note> findAllNotes()
	{
		Query query = em.createQuery("select note from Note note");
		return (List<Note>)query.getResultList();
	}
	// updateNote
	public Note updateNote(Note note)
	{
		em.getTransaction().begin();
		em.merge(note);
		em.getTransaction().commit();
		return note;
	}
	// deleteNote
	public void deleteNote(int id) {
		em.getTransaction().begin();
		Note note = em.find(Note.class, id);
		em.remove(note);
		em.getTransaction().commit();
	}

	public static void main(String[] args) {
		NoteDAO dao = new NoteDAO();
		
		//	createNote test
//		Note note = new Note(null, "BuNote", "this is a note", new Date(), new Date(), "Massarati");
//		dao.createNote(note);
		
		//	findNoteById test
//		Note note = dao.findNoteById(2);
//		System.out.println(note.getTitle());
		
		// findAllNotes test
//		List<Note> notes = dao.findAllNotes();
//		for(Note note : notes)
//		{
//			System.out.println(note.getTitle());
//		}
		
		// updateNote test
//		Note mit = dao.findNoteById(1);
//		mit.setTitle("mit");
//		System.out.println(dao.updateNote(mit).getTitle());
		
		// deleteNote test
//		dao.deleteNote(1);
		
		// read user from note test
//		Note note = dao.findNoteById(2);
//		User user = note.getUser();
//		System.out.println(user.getUserName());
		
		// get comment from note test
//		 Note note = dao.findNoteById(2);
//		 List<Comment> comments = note.getComments();
//		 for(Comment c : comments)
//		 {
//		 System.out.println(c.getTitle());
//		 }
		
		// get likeduser from note test
//		Note note = dao.findNoteById(2);
//		List<User> likedUsers = note.getLikedUsers();
//		for(User u : likedUsers)
//		{
//			System.out.println(u.getUserName());
//		}
		
	}

}
