
/**
 * Write a description of class RPGCharacter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class RPGCharacter {
    
    private String name;
    private int level;
    private int hp;
    private int mana;
    private int attackCount;
    private boolean isAlive;

    
    public RPGCharacter(String name) {
        this.name = name;
        this.level = 1;
        this.hp = 100;
        this.mana = 50;
        this.attackCount = 0;
        this.isAlive = true;
    }

    
    public void receiveDamage(int damage) {
        if (!isAlive) {
            System.out.println(name + " is already defeated!");
            return;
        }

        hp -= damage;

        if (hp <= 0) {
            hp = 0;
            isAlive = false;
            System.out.println(name + " has fallen in battle!");
        } else {
            System.out.println(name + " took " + damage + " dmg! HP left: " + hp);
        }
    }

    
    public void attack(RPGCharacter enemy) {
        if (!isAlive) {
            System.out.println(name + " cannot attack while defeated!");
            return;
        }

        attackCount++;
        int damage = 15 + (level * 3);

    
        if (attackCount % 3 == 0) {
            damage = damage * 2;
            System.out.println("CRITICAL HIT!");
        }

        enemy.receiveDamage(damage);
    }

    
    public void castHeal() {
        if (isAlive && mana >= 20) {
            mana -= 20;
            hp += 35;
            if (hp > 100) {
                hp = 100;
            }
            System.out.println(name + " healed! HP: " + hp + ", Mana: " + mana);
        } else {
            System.out.println("Cannot heal (dead or not enough mana).");
        }
    }
}
            
        
    
    
