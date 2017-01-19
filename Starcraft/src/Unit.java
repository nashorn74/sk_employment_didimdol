
public class Unit {
	private int hitPoint;	private int shield;	private int mp;
	final int MAX_HP; final int MAX_MP; final int MAX_SHIELD;
	Unit(int hp, int mp, int shield) { 
		MAX_HP = hp; MAX_MP = mp; MAX_SHIELD = shield; }
	public void setHP(int hp) { this.hitPoint = hp; }
	public void decHP(int hp) { 
		if (shield > 0) {
			setShield(getShield()-hp);
			if (getShield() < 0) setHP(getHP()+getShield());
		} else setHP(getHP()-hp);
	}
	public int getHP() { return this.hitPoint; }
	public void setMP(int mp) { this.mp = mp; }
	public int getMP() { return this.mp; }
	public void setShield(int shield) { this.shield = shield; }
	public int getShield() { return this.shield; } 
	private Unit target = null;
	public void setTarget(Unit unit) { this.target = unit; }
	public Unit getTarget() { return this.target; }
	private int state = Unit.WAIT;
	public final static int WAIT = 0;
	public final static int WORKING = 1;
	public final static int REPAIR = 2;
	public final static int CURE = 3;
	public final static int ATTACK = 4;
}
class GroundUnit extends Unit {
	GroundUnit(int hp, int mp, int shield) { super(hp, mp, shield); }
}
class AirUnit extends Unit {
	AirUnit(int hp, int mp, int shield) { super(hp, mp, shield); }
}
interface Repairable {}
interface Curable {}
interface SelfRepairable { abstract void selfRepair(); }
interface AirAttackable { abstract void airStrike(AirUnit airUnit); }
interface GroundAttackable { 
	abstract void groundAttack(GroundUnit groundUnit); }
interface Terran {}
interface Protoss {}
interface Zerg {}
class SCV extends GroundUnit implements Repairable,Curable,
	GroundAttackable,Terran {
	SCV() { super(60,0,0); 
		setHP(MAX_HP); setMP(MAX_MP); setShield(MAX_SHIELD); }
	public void groundAttack(GroundUnit groundUnit) {
		groundUnit.decHP(5);
	}
	public static int getPrice() { return 50; }
	public void repair(Repairable repairable) {
		Unit unit = (Unit)repairable;
		if (unit.getHP() < unit.MAX_HP)
			unit.setHP(unit.getHP()+1);
	}
}
class Marine extends GroundUnit implements Curable,GroundAttackable,
	AirAttackable,Terran {
	Marine() { super(40,0,0);
		setHP(MAX_HP); setMP(MAX_MP); setShield(MAX_SHIELD); }
	public void groundAttack(GroundUnit groundUnit) {
		groundUnit.decHP(6);
	}
	public void airStrike(AirUnit airUnit) {
		airUnit.decHP(6);
	}
	public static int getPrice() { return 50; }
}
class Medic extends GroundUnit implements Curable,SelfRepairable,
	Terran {
	Medic() { super(60,200,0); 
		setHP(MAX_HP); setMP(MAX_MP); setShield(MAX_SHIELD); }
	public void selfRepair() {
		if (getMP() < MAX_MP) setMP(getMP()+1);
	}
	void cure(Curable curable) {
		Unit unit = (Unit)curable;
		if (getMP() > 0) {
			if (unit.getHP() < unit.MAX_HP){
				unit.setHP(unit.getHP()+2);
				setMP(getMP()-1);
			}
		}
	}
	public static int getPrice() { return 75; }
}
class Probe extends GroundUnit implements SelfRepairable,
	GroundAttackable,Protoss {
	Probe() { super(20,0,20); 
		setHP(MAX_HP); setMP(MAX_MP); setShield(MAX_SHIELD); }
	public void groundAttack(GroundUnit groundUnit) {
		groundUnit.decHP(5);
	}
	public static int getPrice() { return 50; }
	public void selfRepair() { 
		if (getShield() < MAX_SHIELD) setShield(getShield()+1);
	}
}
class Zealot extends GroundUnit implements SelfRepairable,
	GroundAttackable,Protoss {
	Zealot() { super(100,0,60);
		setHP(MAX_HP); setMP(MAX_MP); setShield(MAX_SHIELD); }
	public void groundAttack(GroundUnit groundUnit) {
		groundUnit.decHP(16);
	}
	public void selfRepair() {
		if (getShield() < MAX_SHIELD) setShield(getShield()+1);
	}
	public static int getPrice() { return 100; }
}