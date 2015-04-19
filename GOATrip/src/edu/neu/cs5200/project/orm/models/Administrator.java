package edu.neu.cs5200.project.orm.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Administrator
{
	@Id
	private Integer id;
	private String userName;
	private String passWord;
	private String email;
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
	public Administrator(Integer id, String userName, String passWord, String email) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.email = email;
	}
	public Administrator() {
		super();
	}
}
