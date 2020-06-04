package com.joshuakaplan;

public class Main {

	public static Person getFromDatabase(String username, String password) {
		Database.open();
		Person person = Database.getPersonFromUsernamePassword(username, password);
		Database.close();
		return person;
	}
	
	public static boolean addToDatabase(Person person) {
		Database.open();
		boolean result = Database.addPerson(person);
		Database.close();
		return result;
	}
	
	public static void main(String[] args) {
		
	}
}
