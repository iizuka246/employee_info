package com.javatpoint.beans;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.stereotype.Component;

/**
 * 作成者 : エエティン
 * クラス名 : Emp 
 * 概要 　　: 社員情報モデル
 * 作成日　:　2021/08/02
 */

@Component
public class Emp {
	
	@NotNull(message="IDが入力されていません。")
	private int id;
	
	@NotEmpty(message="名前が入力されていません。")
	private String name;
	
	@NotNull(message="性別が選択されていません。")
	private int gender;
	
	@NotNull(message="年齢が入力されていません。")
	private int age;
	
	private Date birthday;
	
	@NotEmpty(message="連絡先が入力されていません。")
	private String tel;
	
	@NotEmpty(message="メードアドレスが入力されていまさん。")
	private String address;
	
	@NotEmpty(message="職業が入力されていません。")
	private String category;
	
	private Date joined_day;
	
	@NotEmpty(message="パスワードが入力されていません。")
	@Size(min=8, max=10, message="パスワードの文字数を8文字以上10文字以下にしてください。。")
	private String password;
	
	@NotNull(message="管理者が選択されていません。")
	private int admin_auth;
	
	@NotEmpty(message="生年月日(年)が選択されていません。")
	private String birthday_year;
	
	@NotEmpty(message="生年月日(月)が選択されていません。")
	private String birthday_month;
	
	@NotEmpty(message="生年月日(日)が選択されていません。")
	private String birthday_date;
	
	@NotEmpty(message="入社日(年)が選択されていません。")
    private String joined_day_year;
	
	@NotEmpty(message="入社日(月)が選択されていません。")
	private String joined_day_month;
	
	@NotEmpty(message="入社日(日)が選択されていません。")
	private String joined_day_date;

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
	
	public String getBirthday_year() {
		return birthday_year;
	}

	public void setBirthday_year(String birthday_year) {
		this.birthday_year = birthday_year;
	}

	public String getBirthday_month() {
		return birthday_month;
	}

	public void setBirthday_month(String birthday_month) {
		this.birthday_month = birthday_month;
	}

	public String getBirthday_date() {
		return birthday_date;
	}

	public void setBirthday_date(String birthday_date) {
		this.birthday_date = birthday_date;
	}

	public String getJoined_day_year() {
		return joined_day_year;
	}

	public void setJoined_day_year(String joined_day_year) {
		this.joined_day_year = joined_day_year;
	}

	public String getJoined_day_month() {
		return joined_day_month;
	}

	public void setJoined_day_month(String joined_day_month) {
		this.joined_day_month = joined_day_month;
	}

	public String getJoined_day_date() {
		return joined_day_date;
	}

	public void setJoined_day_date(String joined_day_date) {
		this.joined_day_date = joined_day_date;
	}
	
}