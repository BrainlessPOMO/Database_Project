package test;

import test.user;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Text;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.MouseAdapter;
import org.eclipse.swt.events.MouseEvent;
import java.util.regex.Pattern;
import org.eclipse.wb.swt.SWTResourceManager;
import java.sql.*;

public class Main {

	protected Shell shell;
	private Text textLogin;
	private Label lblCheck;

	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			Main window = new Main();
			window.open();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Open the window.
	 */
	public void open() {
		Display display = Display.getDefault();
		createContents();
		shell.open();
		shell.layout();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch()) {
				display.sleep();
			}
		}
	}

	/**
	 * Create contents of the window.
	 */
	protected void createContents() {
		shell = new Shell();
		shell.setToolTipText("");
		shell.setSize(500, 300);
		shell.setText("tv on demand");
		
		Button btnLoginButton = new Button(shell, SWT.NONE);
		btnLoginButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseDown(MouseEvent e) {
				//check if the given email is in fact an email
				String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + 
							"[a-zA-Z0-9_+&*-]+)*@" + 
							"(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
							"A-Z]{2,7}$";
				Pattern emailPat = Pattern.compile(emailRegex);
				//check if the email is right
				if(textLogin.getText() == null || textLogin.getText() == "") {
					lblCheck.setText("Email cannot be empty!");
				}else if(!emailPat.matcher(textLogin.getText()).matches()) {
					lblCheck.setText("This is not a valid email!!");
				}else {
					try {
						//connect to the database
						String url = "jdbc:mysql://localhost:3306/tvondemand?characterEncoding=latin1";
						String user = "simpleUser";
						String password = "password";
						
						Class.forName("com.mysql.jdbc.Driver");  
						Connection con = DriverManager.getConnection(url, user, password);
						Statement stmt = con.createStatement();  
						ResultSet rs = stmt.executeQuery("select * from user where email = " + "'"+ textLogin.getText() +"'");
						
						//save user to class user
						user usr = new user();
						while(rs.next()) {				
							test.user.setEverything(rs.getInt("user_id"), 
									rs.getString("first_name"), 
									rs.getString("last_name"), 
									rs.getString("email"), 
									rs.getInt("address_id"), 
									rs.getInt("active"), 
									rs.getString("create_date"), 
									rs.getString("role"), 
									rs.getString("type_of_reg"));
						}
						
						//get the roles to see what the user's role is
						String [] roles = usr.getRole().split(",", 0);
						
						boolean isAdmin = false;
						boolean isEmployee = false;
						for(String role : roles) {
							
							if(role.equals("admin")) {
								isAdmin = true;
							}else if(role.equals("employee")) {
								isEmployee = true;
							}
						}
						
						//check what the user is (admin, employee, customer)
						
						
						if(isAdmin == true) {
							Admin.main(null);
						}else if (isEmployee == true) {
							Employee.main(null);
						}else {
							Customer.main(null);
						}
						con.close();
					}catch(Exception e1) {
						System.out.println(e1);
					}
				}
			}
		});
		btnLoginButton.addSelectionListener(new SelectionAdapter() {
			@Override
			public void widgetSelected(SelectionEvent e) {
			}
		});
		btnLoginButton.setBounds(200, 171, 90, 30);
		btnLoginButton.setText("Login");	
		
		
		
		textLogin = new Text(shell, SWT.BORDER);
		textLogin.setToolTipText("");
		textLogin.setBounds(145, 113, 200, 26);
		
		Label lblPleaseInsertYour = new Label(shell, SWT.NONE);
		lblPleaseInsertYour.setBounds(111, 44, 267, 20);
		lblPleaseInsertYour.setText("Please insert your email and Press Login!");
		
		lblCheck = new Label(shell, SWT.NONE);
		lblCheck.setForeground(SWTResourceManager.getColor(SWT.COLOR_RED));
		lblCheck.setBounds(171, 207, 170, 20);

	}
}
