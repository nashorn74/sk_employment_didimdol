package com.test.quiz3;

public class Tiger extends Animal {
	public Tiger(int age) {
		super();
		this.feed = 1;
		this.strength = 
				this.weight = 310;
		this.skin = 1;
		this.speed = 65;
		this.life = 26; 
		this.age = age;
		//////////////////////
/*		Animal feed = new Animal();
		this.eat(feed);
		super.eat(feed);*/
	}
	@Override
	boolean eat(Animal feed) {
		if (this.alive == true) {
			int satiety = feed.weight / 5;
			this.weight += satiety;
			this.strength += satiety * 3;
			return true;
		}
		return false;
	}
	@Override
	boolean eat(Plant feed) { 
		return false;
	}
	@Override
	boolean attack(Animal enemy) {
		if (this.alive == true && enemy.alive == true) {
			int defence = enemy.weight;
			defence = defence / (enemy.age*100/enemy.life);
			defence += enemy.speed * (Math.random()*10);
			if (enemy.skin == 3) defence += defence*0.2;
			else if (enemy.skin == 4) defence += defence*0.3;
			System.out.println("방어력:"+defence);//debug 코드
			int attack = (int)(this.weight*(1.2));
			attack += attack*0.3;
			attack += this.speed * (Math.random()*10);
			attack += this.horns * (Math.random()*5);
			if (this.wings > 0) attack *= 2;
			System.out.println("공격력:"+attack);//debug 코드
			int demage = attack - defence;
			if (demage > 0) {
				enemy.strength -= demage;
				if (enemy.strength < 0) enemy.alive = false;
				return true;
			}
			else if (demage < 0) {
				this.strength += demage;
				if (this.strength < 0) this.alive = false;
			}
		}
		return false;
	}
}
