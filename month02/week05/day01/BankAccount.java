
/**
 * Write a description of class BankAccount here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */

    // balance field
    public class BankAccount {

        private double balance;

        public BankAccount() {
            balance = 0.0;
        }

        public double getBalance() {
            return balance;
        }

        public void deposit(double amount) {
            if (amount > 0) {
                balance = balance + amount;
            } else {
                System.out.println("Алдаа: 0-ээс их дүн оруулна уу!");
            }
        }
    }

