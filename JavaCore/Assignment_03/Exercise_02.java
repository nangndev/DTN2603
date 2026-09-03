import java.time.LocalDate;

public class Exercise_02 {

    static class Account {
        int id;
        String email;
        String userName;
        String fullName;
        LocalDate createDate;

        @Override
        public String toString() {
            return "Account{" +
                    "id=" + id +
                    ", email='" + email + '\'' +
                    ", userName='" + userName + '\'' +
                    ", fullName='" + fullName + '\'' +
                    ", createDate=" + createDate +
                    '}';
        }
    }

    public static void main(String[] args) {
        System.out.println("=== EXERCISE 2: DEFAULT VALUE ===");

        // Question 1
        System.out.println("\n--- Question 1 ---");
        Account[] accounts = new Account[5];

        for (int i = 0; i < accounts.length; i++) {
            accounts[i] = new Account();
            accounts[i].id = i + 1;
            accounts[i].email = "Email " + (i + 1);
            accounts[i].userName = "User name " + (i + 1);
            accounts[i].fullName = "Full name " + (i + 1);
            accounts[i].createDate = LocalDate.now();
        }

        // In danh sách 5 account vừa khởi tạo
        System.out.println("Danh sách 5 Account khởi tạo thành công:");
        for (Account acc : accounts) {
            System.out.println(acc);
        }
    }
}
