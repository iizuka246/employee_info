package com.javatpoint.beans;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

/**
 * 作成者 : エエティン
 * クラス名 : Emp 
 * 概要 　　: 社員情報モデル
 * 作成日　:　2021/08/02
 */

@Component
public class Emp {
	
	@NotEmpty(message="NotEmpty.employeeForm.id")
	private int id;
	
	//@NotEmpty(message="NotEmpty.employeeForm.name")
	@NotEmpty(message="名前が入力されていません")
	private String name;
	
	@NotEmpty(message="NotEmpty.employeeForm.gender")
	private int gender;
	
	@NotEmpty(message="NotEmpty.employeeForm.age")
	private int age;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@NotEmpty(message="NotEmpty.employeeForm.birthday")
	private Date birthday;
	
	@NotEmpty(message="NotEmpty.employeeForm.tel")
	private String tel;
	
	@NotEmpty(message="NotEmpty.employeeForm.address")
	private String address;
	
	@NotEmpty(message="NotEmpty.employeeForm.category")
	private String category;
	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@NotEmpty(message="NotEmpty.employeeForm.joined_day")
	private Date joined_day;
	
	@NotEmpty(message="NotEmpty.employeeForm.password")
	@Size(min=8, max=10, message="Size.employeeForm.password")
	private String password;
	
	@NotEmpty(message="NotEmpty.employeeForm.admin_auth")
	private int admin_auth;

	private float salary;
	private String designation;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getJoined_day() {
		return joined_day;
	}

	public void setJoined_day(Date joined_day) {
		this.joined_day = joined_day;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAdmin_auth() {
		return admin_auth;
	}

	public void setAdmin_auth(int admin_auth) {
		this.admin_auth = admin_auth;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

}