import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class Exercise3 {
    public static void main(String[] args) {
        Exam exam1 = new Exam(1, "VTI001", "Java Core", LocalDateTime.now());

        // Question 1: Format Vietnamese
        DateTimeFormatter dtfVn = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss", new Locale("vi", "VN"));
        System.out.println("Question 1 (Vietnamese format): " + exam1.createDate.format(dtfVn));

        // Question 2: Năm – tháng – ngày – giờ – phút – giây
        DateTimeFormatter dtfDetail = DateTimeFormatter.ofPattern("yyyy - MM - dd - HH - mm - ss");
        System.out.println("Question 2: " + exam1.createDate.format(dtfDetail));

        // Question 3: Chỉ in năm
        DateTimeFormatter dtfYear = DateTimeFormatter.ofPattern("yyyy");
        System.out.println("Question 3 (Year): " + exam1.createDate.format(dtfYear));

        // Question 4: Chỉ in tháng và năm
        DateTimeFormatter dtfMonthYear = DateTimeFormatter.ofPattern("MM-yyyy");
        System.out.println("Question 4 (Month-Year): " + exam1.createDate.format(dtfMonthYear));

        // Question 5: Chỉ in MM-dd
        DateTimeFormatter dtfMonthDay = DateTimeFormatter.ofPattern("MM-dd");
        System.out.println("Question 5 (MM-dd): " + exam1.createDate.format(dtfMonthDay));
    }
}