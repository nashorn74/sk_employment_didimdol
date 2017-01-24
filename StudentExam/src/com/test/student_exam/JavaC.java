package com.test.student_exam;

import java.util.ArrayList;

public class JavaC {
	public static final int MAJOR_MECHANICAL_ENGINEERING = 0;
	public static final int MAJOR_COMPUTER_SCIENCE = 1;
	public static final int MAJOR_COMPUTER_ENGINEERING = 2;
	public static final int MAJOR_INFORMATION_AND_COMMUNICATION = 3;
	public static final int CITY_SEOUL = 0;
	public static final int CITY_ANSAN = 1;
	public static final int CITY_BUCHON = 2;
	ArrayList<Student> students = new ArrayList<Student>();
	public JavaC() {
		students.add(new Student(1,"강동훈",'m',
				MAJOR_MECHANICAL_ENGINEERING,CITY_SEOUL));
		students.add(new Student(2,"곽다인",'f',
				MAJOR_COMPUTER_SCIENCE,CITY_ANSAN));
		students.add(new Student(3,"김기호",'m',
				MAJOR_COMPUTER_ENGINEERING,CITY_SEOUL));
		students.add(new Student(4,"김동근",'m',
				MAJOR_INFORMATION_AND_COMMUNICATION,CITY_SEOUL));
		students.add(new Student(5,"김서준",'m',
				MAJOR_COMPUTER_ENGINEERING,CITY_BUCHON));
	}
	public Student getStudent(int index) { 
		return this.students.get(index); 
	}
	public int getLength() { return this.students.size(); }
}
