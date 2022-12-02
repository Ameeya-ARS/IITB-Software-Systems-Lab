public class Person{
	protected String name;
	protected int age;
	public Person(String name,int age){
		this.name = name;
		this.age = age;
	}
	public String getName(){
		return this.name;
	}
	public int getAge(){
		return this.age;
	}
	public void intro(){
		System.out.println("I am a person, "+this.name+", "+this.age);
	}
}
