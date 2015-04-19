package edu.neu.cs5200.project.orm.models;

import java.util.Date;

import javax.persistence.*;

@Entity
public class Comment
{
	@Id
	private Integer id;
	private String title;
	private String content;
	@Temporal(TemporalType.DATE)
	private Date date;
	@ManyToOne(fetch=FetchType.LAZY)
 	@JoinColumn(name="userId")
 	private User user;
	@ManyToOne(fetch=FetchType.LAZY)
 	@JoinColumn(name="noteId")
 	private Note note;
	 
	public Note getNote() {
		return note;
	}
	public void setNote(Note note) {
		this.note = note;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Comment(Integer id, String title, String content, Date date) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
	}
	public Comment() {
		super();
	}
	
	
}
