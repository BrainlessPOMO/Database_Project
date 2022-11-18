package test;

public class user {
	static int user_id;
	static String first_name;
	static String last_name;
	static String email;
	static int address_id;
	static int active;
	static String date;
	static String role;
	static String type_of_reg;
	
	//constructors
	user(int user_id,String first_name,String last_name, String email, int address_id, int active, String date, String role, String type_of_reg){
		user.user_id = user_id;
		user.first_name = first_name;
		user.last_name = last_name;
		user.email = email;
		user.address_id = address_id;
		user.active = active;
		user.date = date;
		user.role = role;
		user.type_of_reg = type_of_reg;
	}
	user(){}
	user(int user_id){
		user.user_id = user_id;
	}
	
	//getters
	static int getUser() {
		return user_id;
	}
	static String getFirstName() {
		return first_name;
	}
	static String getLastName() {
		return last_name;
	}
	static String getEmail() {
		return email;
	}
	static int getAddressId() {
		return address_id;
	}
	static int getActive() {
		return active;
	}
	static String getDate() {
		return date;
	}
	static String getRole() {
		return role;
	}
	static String getTypeOfReg() {
		return type_of_reg;
	}
	//setters
	static void setEverything(int user_id,String first_name,String last_name, String email, int address_id, int active, String date, String role, String type_of_reg) {
		user.user_id = user_id;
		user.first_name = first_name;
		user.last_name = last_name;
		user.email = email;
		user.address_id = address_id;
		user.active = active;
		user.date = date;
		user.role = role;
		user.type_of_reg = type_of_reg;
	}
	
	static void setUserId(int user_id) {
		user.user_id = user_id;
	}
	static void setFirstName(String first_name) {
		user.first_name = first_name;
	}
	static void setLastName(String last_name) {
		user.last_name = last_name;
	}
	static void setEmail(String email) {
		user.email = email;
	}
	static void setAddressId(int address_id) {
		user.address_id = address_id;
	}
	static void setActive(int active) {
		user.active = active;
	}
	static void setDate(String date) {
		user.date = date;
	}
	static void setRole(String role) {
		user.role = role;
	}
	static void setTypeOfReg(String type_of_reg) {
		user.type_of_reg = type_of_reg;
	}
}
