import java.util.ArrayList;

public class Teacher extends Person{
	private int salary;
	private ArrayList<Student> list = new ArrayList<Student>();
	public Teacher(String name,int age,int salary){
		super(name,age);
		this.salary = salary;
	}
	public Teacher(String name,int age){
		super(name,age);
		this.salary = 10000;
	}
	public Teacher(Person p,int salary){
		super(p.getName(),p.getAge());
		this.salary = salary;
	}
	public int getSalary(){
		return this.salary;
	}
	public void addStudent(Student stud){
		list.add(stud);
	}
	public ArrayList<Student> getStudents(){
		return list;
	}
	public void intro(){
		System.out.println("I am a Teacher, "+this.name+", "+this.age+", "+this.salary);
	}
}
