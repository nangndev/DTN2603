import java.time.LocalDate;
import java.util.Random;

public class Exercise4 {
    public static void main(String[] args) {
        Random random = new Random();

        // Question 1: Random số nguyên
        int randInt = random.nextInt();
        System.out.println("Question 1 (Random Int): " + randInt);

        // Question 2: Random số thực
        float randFloat = random.nextFloat();
        System.out.println("Question 2 (Random Float): " + randFloat);

        // Question 3: Random tên học sinh
        String[] classMembers = {"Nam", "Hoa", "Linh", "Duy", "Tùng", "Mai"};
        String randName = classMembers[random.nextInt(classMembers.length)];
        System.out.println("Question 3 (Random Name): " + randName);

        // Question 4: Random ngày từ 24-07-1995 đến 20-12-1995
        long minDayQ4 = LocalDate.of(1995, 7, 24).toEpochDay();
        long maxDayQ4 = LocalDate.of(1995, 12, 20).toEpochDay();
        long randomDayQ4 = minDayQ4 + (long) (random.nextDouble() * (maxDayQ4 - minDayQ4 + 1));
        System.out.println("Question 4 (Random Date 1995): " + LocalDate.ofEpochDay(randomDayQ4));

        // Question 5: Random ngày trong 1 năm trở lại đây
        long maxDayQ5 = LocalDate.now().toEpochDay();
        long minDayQ5 = maxDayQ5 - 365;
        long randomDayQ5 = minDayQ5 + (long) (random.nextDouble() * (maxDayQ5 - minDayQ5 + 1));
        System.out.println("Question 5 (Last 1 year): " + LocalDate.ofEpochDay(randomDayQ5));

        // Question 6: Random 1 ngày trong quá khứ
        long nowDay = LocalDate.now().toEpochDay();
        long randomPastDay = nowDay - (random.nextInt(365 * 10) + 1); // 1 ngày đến 10 năm trước
        System.out.println("Question 6 (Past Date): " + LocalDate.ofEpochDay(randomPastDay));

        // Question 7: Random 1 số có 3 chữ số (100 -> 999)
        int rand3Digits = random.nextInt(900) + 100;
        System.out.println("Question 7 (3 Digits): " + rand3Digits);
    }
}