package edu.neu.cs5200.project.orm.models;

import java.util.Collection;
import java.util.List;

import javax.persistence.*;

@Entity
public class User
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String userName;
	private String passWord;
	private String email;
	
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<TravelPlan> travelPlans;
	
	@OneToMany(mappedBy="user")
	private List<Book> books;
	
	@OneToMany(mappedBy="user")
	private List<Comment> comments;
	
	@OneToMany(mappedBy="user")
	private List<Note> notes;
	
	@ManyToMany
	@JoinTable(name="userlikesnotes",
    joinColumns=
         @JoinColumn(name="userId", referencedColumnName="id"),
    inverseJoinColumns=
         @JoinColumn(name="noteId", referencedColumnName="id"))
	private List<Note> likednotes;
	
	@ManyToMany
	@JoinTable(name="userfollowotheruser",
    joinColumns=
         @JoinColumn(name="followerId", referencedColumnName="id"),
    inverseJoinColumns=
         @JoinColumn(name="leaderId", referencedColumnName="id"))
	private List<User> leaders;
	
	@ManyToMany(mappedBy="leaders", fetch=FetchType.EAGER)
	private List<User> followers;
	
	public List<User> getFollowers() {
		return followers;
	}
	public void setFollowers(List<User> followers) {
		this.followers = followers;
	}
	public List<User> getLeaders() {
		return leaders;
	}
	public void setLeaders(List<User> leaders) {
		this.leaders = leaders;
	}
	public List<Note> getLikednotes() {
		return likednotes;
	}
	public void setLikednotes(List<Note> likednotes) {
		this.likednotes = likednotes;
	}
	public List<Note> getNotes() {
		return notes;
	}
	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<TravelPlan> getTravelPlans() {
		return travelPlans;
	}
	public void setTravelPlans(List<TravelPlan> travelPlans) {
		this.travelPlans = travelPlans;
	}
	public User(Integer id, String userName, String passWord, String email) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}
	public User() {
		super();
	}
	
}
