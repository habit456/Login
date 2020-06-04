package com.joshuakaplan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
	private static final String DATABASE = "people.db";
	private static final String URL = "jdbc:sqlite:C:\\Users\\Joshua\\eclipse-workspace\\Login\\src\\" + DATABASE;
	private static Connection conn;

	public static void open() {
		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection(URL);
			createTable();
		} catch (SQLException e) {
			System.out.println("Error opening connection to database: " + e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found: " + e.getMessage());
		}
	}

	public static void createTable() {
		try (Statement statement = conn.createStatement()) {
			statement.execute(
					"CREATE TABLE IF NOT EXISTS people (_id INTEGER PRIMARY KEY, name TEXT, age INTEGER, username TEXT, password TEXT)");
		} catch (SQLException e) {
			System.out.println("Error creating table: " + e.getMessage());
		}
	}

	public static Person getPersonFromUsernamePassword(String username, String password) {
		Person person = null;
		StringBuilder query = new StringBuilder();
		query.append("SELECT * FROM people WHERE username=\"").append(username).append("\" AND password=\"")
				.append(password).append("\"");

		try (Statement statement = conn.createStatement();
				ResultSet resultSet = statement.executeQuery(query.toString())) {
			while (resultSet.next()) {
				String name = resultSet.getString("name");
				int age = resultSet.getInt("age");
				person = new Person(name, age, username, password);
			}
		} catch (SQLException e) {
			System.out.println("Error getting person from the database: " + e.getMessage());
		}

		return person;
	}

	public static boolean addPerson(Person person) {
		StringBuilder query = new StringBuilder();
		query.append("SELECT * FROM people WHERE username=\"").append(person.getUsername()).append("\"");
		try (Statement statement = conn.createStatement(); ResultSet rs = statement.executeQuery(query.toString())) {
			if (rs.next()) {
				return false;
			} else {
				String queryString = String.format("INSERT INTO people (name, age, username, password) VALUES ('%s', %d, '%s', '%s')", 
						person.getName(), person.getAge(), person.getUsername(), person.getPassword());
				statement.execute(queryString);
				return true;
			}
		} catch (SQLException e) {
			System.out.println("Trouble adding person to the database: " + e.getMessage());
		}
		
		return false;
	}
	
	private static void delete(String name) {
		try (Statement statement = conn.createStatement()) {
			statement.execute("DELETE FROM people WHERE name=\"" + name + "\"");
		} catch (SQLException e) {
			System.out.println("error deleting " + name + ": " + e.getMessage());
		}
	}
	
	public static void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Trouble closing connection: " + e.getMessage());
		}
	}

}
