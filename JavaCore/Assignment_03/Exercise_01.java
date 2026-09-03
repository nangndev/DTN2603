import java.util.Random;

public class Exercise_01 {

    public static void main(String[] args) {
        System.out.println("=== EXERCISE 1: DATATYPE CASTING ===");

        // Question 1
        System.out.println("\n--- Question 1 ---");
        float salaryAcc1 = 5240.5f;
        float salaryAcc2 = 10970.055f;

        int roundSalary1 = (int) salaryAcc1; // Hoặc Math.round(salaryAcc1)
        int roundSalary2 = (int) salaryAcc2; // Hoặc Math.round(salaryAcc2)

        System.out.println("Lương Account 1 (gốc float): " + salaryAcc1 + "$");
        System.out.println("Lương Account 1 (làm tròn int): " + roundSalary1 + "$");
        System.out.println("Lương Account 2 (gốc float): " + salaryAcc2 + "$");
        System.out.println("Lương Account 2 (làm tròn int): " + roundSalary2 + "$");

        // Question 2
        System.out.println("\n--- Question 2 ---");
        Random random = new Random();
        int randomNumber = random.nextInt(100000); // 0 -> 99999
        String formatted5Digits = String.format("%05d", randomNumber);
        System.out.println("Số ngẫu nhiên 5 chữ số: " + formatted5Digits);

        // Question 3
        System.out.println("\n--- Question 3 ---");
        // Cách 1: String substring
        String lastTwoStr = formatted5Digits.substring(formatted5Digits.length() - 2);
        System.out.println("2 số cuối (Cách 1 - Convert String): " + lastTwoStr);

        // Cách 2: Chia lấy dư cho 100
        int lastTwoInt = randomNumber % 100;
        System.out.printf("2 số cuối (Cách 2 - Chia lấy dư %% 100): %02d%n", lastTwoInt);

        // Question 4
        System.out.println("\n--- Question 4 ---");
        int a = 9;
        int b = 4;
        System.out.println("Kết quả chia " + a + " cho " + b + " = " + divide(a, b));
    }

    /**
     * Question 4: Method nhập vào 2 số nguyên a và b và trả về thương của chúng
     */
    public static float divide(int a, int b) {
        if (b == 0) {
            System.out.println("Lỗi: Không thể chia cho 0!");
            return 0;
        }
        return (float) a / b;
    }
}
