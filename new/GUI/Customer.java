package test;

import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.SWT;

import org.eclipse.swt.widgets.Button;

public class Customer {

	protected Shell shell;

	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			Customer window = new Customer();
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
		shell.setSize(800, 450);
		shell.setText("SWT Application");
		shell.setLayout(null);
		
		Label lblHelloCustomer = new Label(shell, SWT.NONE);
		lblHelloCustomer.setBounds(354, 10, 72, 20);
		lblHelloCustomer.setText("Hello " + user.getFirstName() + " !");
		
		Button btnSee = new Button(shell, SWT.NONE);
		btnSee.setBounds(336, 64, 103, 30);
		btnSee.setText("See your data");

	}

}
