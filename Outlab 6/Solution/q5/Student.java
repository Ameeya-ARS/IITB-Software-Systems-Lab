import java.util.ArrayList;

public class Student extends Person{
	private int rollno;
	private ArrayList<Teacher> list = new ArrayList<Teacher>();
	public Student(String name,int age,int rollno){
		super(name,age);
		this.rollno = rollno;
	}
	public Student(Person p,int rollno){
		super(p.getName(),p.getAge());
		this.rollno = rollno;
	}
	public int getRollNo(){
		return this.rollno;
	}
	public void addTeacher(Teacher teachr){
		list.add(teachr);
	}
	public ArrayList<Teacher> getTeachers(){
		return list;
	}
	public void intro(){
		System.out.println("I am a Student, "+this.name+", "+this.age+", "+this.rollno);
	}
}

