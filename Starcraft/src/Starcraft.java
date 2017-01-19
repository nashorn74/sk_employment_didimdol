import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;


public class Starcraft {

	protected Shell shell;

	/**
	 * Launch the application.
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			Starcraft window = new Starcraft();
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
		shell.setSize(450, 300);
		shell.setText("SWT Application");

		SCV scv = new SCV();
		Marine marine = new Marine();
		Medic medic = new Medic();
		Probe probe = new Probe();
		Zealot zealot = new Zealot();
		
		System.out.println(String.format("marine=%d,zealot=%d/%d", 
				marine.getHP(),zealot.getHP(),zealot.getShield()));
		marine.groundAttack(zealot);
		zealot.groundAttack(marine);
		System.out.println(String.format("marine=%d,zealot=%d/%d", 
				marine.getHP(),zealot.getHP(),zealot.getShield()));
		medic.cure(marine);
		System.out.println(String.format("marine=%d,zealot=%d/%d", 
				marine.getHP(),zealot.getHP(),zealot.getShield()));
		zealot.groundAttack(marine);
		System.out.println(String.format("marine=%d,zealot=%d/%d", 
				marine.getHP(),zealot.getHP(),zealot.getShield()));
		//medic.cure(zealot);
		medic.cure(scv);
		//scv.repair(marine);
		if (scv instanceof SCV) System.out.println("SCV ok!");
		if (scv instanceof Unit) System.out.println("Unit ok!");
		if (scv instanceof Repairable) System.out.println("Repairable ok!");
		if (scv instanceof Terran) System.out.println("Terran ok!");
		
		//if (probe instanceof SCV) System.out.println("SCV ok!");
		if (probe instanceof Unit) System.out.println("Unit ok!");
		if (probe instanceof Repairable) System.out.println("Repairable ok!");
		if (probe instanceof Terran) System.out.println("Terran ok!");
		
	}

}
