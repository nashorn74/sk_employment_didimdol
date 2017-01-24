package com.test.student_exam;

import java.util.Date;

public class Student {
	private int no;
	private String name;
	private char gender;
	private int major;
	private int city;
	private Date created_at;
	public Student(int no, String name, char gender, 
			int major, int city) {
		setNo(no); setName(name); setGender(gender);
		setMajor(major); setCity(city); this.created_at = new Date();
	}
	public void setNo(int no) { this.no = no; }
	public int getNo() { return this.no; }
	public void setName(String name) { this.name = name; }
	public String getName() { return this.name; }
	public void setGender(char gender) { this.gender = gender; }
	public char getGenter() { return this.gender; }
	public void setMajor(int major) { this.major = major; }
	public int getMajor() { return this.major; }
	public void setCity(int city) { this.city = city; }
	public int getCity() { return this.city; }
	public Date getDate() { return this.created_at; }
}
