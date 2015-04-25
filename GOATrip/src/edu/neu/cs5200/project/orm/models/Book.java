package edu.neu.cs5200.project.orm.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Book
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
      private Integer id;
      @Temporal(TemporalType.DATE)
  	  private Date date;
      private String location;
      private String type;
      @ManyToOne(fetch=FetchType.LAZY)
  	  @JoinColumn(name="userId")
  	  private User user;
      
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Book(Integer id, Date date, String location, String type) {
		super();
		this.id = id;
		this.date = date;
		this.location = location;
		this.type = type;
	}
	public Book() {
		super();
	}
      
}
