package edu.neu.cs5200.project.orm.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import edu.neu.cs5200.project.orm.models.Book;
import edu.neu.cs5200.project.orm.models.Comment;
import edu.neu.cs5200.project.orm.models.Note;
import edu.neu.cs5200.project.orm.models.TravelPlan;
import edu.neu.cs5200.project.orm.models.User;

public class UserDAO {
	EntityManagerFactory factory = Persistence
			.createEntityManagerFactory("GOATrip");
	EntityManager em = factory.createEntityManager();

	// crud

	// createUser
	public User createUser(User user) {
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		return user;
	}

	// findUserById
	public User findUserById(Integer id) {
		return em.find(User.class, id);
	}

	// findAllUsers
	public List<User> findAllUsers() {
		Query query = em.createQuery("select user from User user");
		return (List<User>) query.getResultList();
	}

	// updateUser
	public User updateUser(User user) {
		em.getTransaction().begin();
		em.merge(user);
		em.getTransaction().commit();
		return user;
	}

	// deleteUser
	public void deleteUser(int id) {
		em.getTransaction().begin();
		User user = em.find(User.class, id);
		em.remove(user);
		em.getTransaction().commit();
	}

	// addTravelPlan usecase(1)
	public void addTravelPlan(Integer userId, TravelPlan travelPlan) {
		em.getTransaction().begin();
		
		User user = em.find(User.class, userId);
		travelPlan.setUser(user);
		em.persist(travelPlan);
		
		user.getTravelPlans().add(travelPlan);
		em.merge(user);
		em.getTransaction().commit();
	}

	// addBook usecase(2)
	public void addBook(Integer userId, Book book) {
		em.getTransaction().begin();
		User user = em.find(User.class, userId);
		book.setUser(user);
		user.getBooks().add(book);
		em.merge(user);
		em.getTransaction().commit();
	}

	// addNote usecase(3)
	public void addNote(Integer userId, Note note) {
		em.getTransaction().begin();
		User user = em.find(User.class, userId);
		note.setUser(user);
		em.persist(note);
		user.getNotes().add(note);
		em.merge(user);
		em.getTransaction().commit();
	}

	// addComment by a USER for a NOTE usecase(4)
	public void addComment(Integer userId, Integer noteId, Comment comment) {
		em.getTransaction().begin();
		User user = em.find(User.class, userId);
		Note note = em.find(Note.class, noteId);
		comment.setUser(user);
		comment.setNote(note);
		user.getComments().add(comment);
		note.getComments().add(comment);
		em.merge(user);
		em.merge(note);
		em.getTransaction().commit();
	}

	// user like a note usecase(5)
	public void likeNote(Integer userId, Integer noteId) {
		em.getTransaction().begin();

		User user = em.find(User.class, userId);
		Note note = em.find(Note.class, noteId);

		note.getLikedUsers().add(user);
		em.merge(note);
		em.flush();

		user.getLikednotes().add(note);
		em.merge(user);
		em.flush();

		em.getTransaction().commit();
	}
	
	// user unlike a note
	public void unlikeNote(Integer userId, Integer noteId)
	{
		em.getTransaction().begin();

		User user = em.find(User.class, userId);
		Note note = em.find(Note.class, noteId);

		note.getLikedUsers().remove(user);
		em.merge(note);
		em.flush();

		user.getLikednotes().remove(note);
		em.merge(user);
		em.flush();

		em.getTransaction().commit();
	}
	
	// user follow other user usecase(6)
	public void follow(Integer followerId, Integer leaderId) {
		em.getTransaction().begin();

		User follower = em.find(User.class, followerId);
		User leader = em.find(User.class, leaderId);

		follower.getLeaders().add(leader);
		em.merge(follower);
		em.flush();

		leader.getFollowers().add(follower);
		em.merge(leader);
		em.flush();

		em.getTransaction().commit();
	}
	
	// find user by userName or email
	public int findUserByNameOrEmail(String keyword)
	{
		List<User> allUsers = findAllUsers();
		for (User user : allUsers)
		{
			if ((user.getUserName().equals(keyword)) || (user.getEmail().equals(keyword)))
			{
				return user.getId();
			}
		}
		return -1;
	}
	

	public static void main(String[] args) {
		UserDAO dao = new UserDAO();

		// readUserById test
//		 User user = dao.findUserById(1);
//		 System.out.println(user.getUserName());

		// findAllUsers test
//		 List<User> users = dao.findAllUsers();
//		 for(User user : users)
//		 {
//		 System.out.println(user.getUserName());
//		 }

		// updateUser test
		// User ruoyu = dao.findUserById(1);
		// ruoyu.setUserName("ruoyu");
		// System.out.println(dao.updateUser(ruoyu).getUserName());

		// deleteUser test
		// dao.deleteUser(2);

		// createUser test
		// User user = new User(0, "jump", "234", "jump@husky.neu.edu");
		// dao.createUser(user);

		// get travelPlan from user test
		// User ruoyu = dao.findUserById(1);
		// List<TravelPlan> travelPlans = ruoyu.getTravelPlans();
		// for(TravelPlan plan : travelPlans)
		// {
		// System.out.println(plan.getTitle());
		// }

		// addTravelPlan test
		// TravelPlan hvd = new TravelPlan(null, "hvdPlan", new Date(), "hvd");
		// dao.addTravelPlan(1, hvd);

		// get book from user test
		// User ruoyu = dao.findUserById(1);
		// List<Book> books = ruoyu.getBooks();
		// for(Book b : books)
		// {
		// System.out.println(b.getType());
		// }

		// addBook test
		// Book book = new Book(null, new Date(), "Brookline", "Inn");
		// dao.addBook(1, book);

		// addNote test
		// Note note = new Note(null, "a title", "a content", new Date(), new
		// Date(), "a picture");
		// dao.addNote(1, note);

		// get note from user test
		// User ruoyu = dao.findUserById(1);
		// List<Note> notes = ruoyu.getNotes();
		// for(Note note : notes)
		// {
		// System.out.println(note.getTitle());
		// }

		// get comment from user test
		// User ruoyu = dao.findUserById(1);
		// List<Comment> comments = ruoyu.getComments();
		// for(Comment c : comments)
		// {
		// System.out.println(c.getTitle());
		// }

		// addComment by a USER for a NOTE test
		// Comment comment = new Comment(null, "createst", "just test", new
		// Date());
		// dao.addComment(1, 2, comment);

		// like a note test
//		dao.likeNote(1, 18);
		
		// user unlike a note test
//		dao.unlikeNote(1, 18);
		
		// find likednotes by user test
//		User ruoyu = dao.findUserById(1);
//		List<Note> likednotes = ruoyu.getLikednotes();
//		for(Note n : likednotes)
//		{
//			System.out.println(n.getId());
//		}
		
		// user follow other user test
//		dao.follow(3,1);
		
		// follower get all its leaders
//		User ruoyu = dao.findUserById(1);
//		List<User> leaders = ruoyu.getLeaders();
//		for(User u : leaders)
//		{
//			System.out.println(u.getUserName());
//		}
		
		// leader get all its followers
//		User ruoyu = dao.findUserById(1);
//		List<User> followers = ruoyu.getFollowers();
//		for(User u : followers)
//		{
//			System.out.println(u.getUserName());
//		}
		
		// find user by keyword
//		int ruoyuId = dao.findUserByNameOrEmail("chen.sheng@husky.neu.edu");
//		System.out.println(ruoyuId);
		

	}

}
