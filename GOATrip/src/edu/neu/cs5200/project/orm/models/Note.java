package edu.neu.cs5200.project.orm.models;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Note
{
	@Id
	private Integer id;
	private String title;
	private String content;
	@Temporal(TemporalType.DATE)
	private Date createDate;
	@Temporal(TemporalType.DATE)
	private Date postDate;
	private String picture;
	@ManyToOne(fetch=FetchType.LAZY)
 	@JoinColumn(name="userId")
 	private User user;
	@OneToMany(mappedBy="note")
	private List<Comment> comments;
	
	@ManyToMany(mappedBy="likednotes", fetch=FetchType.EAGER)
	private List<User> likedUsers;
	
	public List<User> getLikedUsers() { 
        return likedUsers;
    }
	public void setLikedUsers(List<User> likedUsers) {
		this.likedUsers = likedUsers;
	}
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Note(Integer id, String title, String content, Date createDate,
			Date postDate, String picture) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.postDate = postDate;
		this.picture = picture;
	}
	public Note() {
		super();
	}
}
