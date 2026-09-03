public class Exercise_03 {

    public static void main(String[] args) {
        System.out.println("=== EXERCISE 3: BOXING & UNBOXING ===");

        // Question 1
        System.out.println("\n--- Question 1 ---");
        Integer salaryInteger = 5000;
        float salaryFloat = salaryInteger.floatValue();
        System.out.printf("Lương kiểu float (2 chữ số thập phân): %.2f%n", salaryFloat);

        // Question 2
        System.out.println("\n--- Question 2 ---");
        String strNumber = "1234567";
        int primitiveIntQ2 = Integer.parseInt(strNumber);
        System.out.println("Giá trị int từ String \"1234567\": " + primitiveIntQ2);

        // Question 3
        System.out.println("\n--- Question 3 ---");
        Integer wrapperInt = Integer.valueOf("1234567");
        int primitiveIntQ3 = wrapperInt.intValue();
        System.out.println("Giá trị datatype int từ Integer wrapper: " + primitiveIntQ3);
    }
}
