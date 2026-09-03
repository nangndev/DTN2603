import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Exercise_04 {
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.println("=== EXERCISE 4: STRING ===");

        // Question 1
        System.out.println("\n--- Question 1 ---");
        String sampleQ1 = "   Học  lập trình   Java   Core   rất   vui  ";
        System.out.println("Chuỗi mẫu: \"" + sampleQ1 + "\"");
        System.out.println("Số lượng từ: " + countWords(sampleQ1));

        // Question 2
        System.out.println("\n--- Question 2 ---");
        String s1 = "Hello ";
        String s2 = "World!";
        System.out.println("Nối s2 (\"" + s2 + "\") vào s1 (\"" + s1 + "\"): " + concatenateStrings(s1, s2));

        // Question 3
        System.out.println("\n--- Question 3 ---");
        String nameQ3 = "nam";
        System.out.println("Tên gốc: " + nameQ3 + " => Chuẩn hóa chữ đầu: " + capitalizeFirstLetter(nameQ3));

        // Question 4
        System.out.println("\n--- Question 4 ---");
        printCharactersInName("Nam");

        // Question 5
        System.out.println("\n--- Question 5 ---");
        System.out.println("Họ tên ghép từ họ 'Nguyễn' và tên 'Nam': " + combineName("Nguyễn", "Nam"));

        // Question 6
        System.out.println("\n--- Question 6 ---");
        splitFullName("Nguyễn Văn Nam");

        // Question 7
        System.out.println("\n--- Question 7 ---");
        String unformattedName = "   nguyễn   văn   nam   ";
        System.out.println("Chuỗi gốc: \"" + unformattedName + "\"");
        System.out.println("Chuẩn hóa họ tên: \"" + normalizeFullName(unformattedName) + "\"");

        // Question 8
        System.out.println("\n--- Question 8 ---");
        String[] groupNames = {"Java Fresher", "C# Fresher", "Java Core Pro", "Python Advanced", "Frontend Java"};
        printGroupsContainingJava(groupNames);

        // Question 9
        System.out.println("\n--- Question 9 ---");
        String[] groupsQ9 = {"Java", "C#", "java", "JAVA", "Java Fresher"};
        printGroupsNamedJava(groupsQ9);

        // Question 10
        System.out.println("\n--- Question 10 ---");
        checkReversePair("word", "drow");
        checkReversePair("hello", "world");

        // Question 11
        System.out.println("\n--- Question 11 ---");
        String sampleQ11 = "Java Core Assignment 03 - Extra";
        System.out.println("Số lần xuất hiện ký tự 'a' trong \"" + sampleQ11 + "\": " + countCharA(sampleQ11));

        // Question 12
        System.out.println("\n--- Question 12 ---");
        String sampleQ12 = "JavaCore";
        System.out.println("Chuỗi gốc: " + sampleQ12 + " => Đảo ngược bằng vòng lặp: " + reverseStringWithLoop(sampleQ12));

        // Question 13
        System.out.println("\n--- Question 13 ---");
        System.out.println("\"abc\" => " + doesNotContainDigits("abc"));
        System.out.println("\"1abc\" => " + doesNotContainDigits("1abc"));
        System.out.println("\"abc1\" => " + doesNotContainDigits("abc1"));
        System.out.println("\"123\" => " + doesNotContainDigits("123"));
        System.out.println("\"a1bc\" => " + doesNotContainDigits("a1bc"));
        System.out.println("null => " + doesNotContainDigits(null));

        // Question 14
        System.out.println("\n--- Question 14 ---");
        String strQ14 = "VTI Academy";
        System.out.println("Gốc: \"" + strQ14 + "\", thay 'e' thành '*' => \"" + replaceChar(strQ14, 'e', '*') + "\"");

        // Question 15
        System.out.println("\n--- Question 15 ---");
        String strQ15 = " I am developer ";
        System.out.println("Gốc: \"" + strQ15 + "\" => Đảo ngược theo từ: \"" + reverseWordsWithoutLibrary(strQ15) + "\"");

        // Question 16
        System.out.println("\n--- Question 16 ---");
        System.out.print("Chia \"abcdef\" làm các phần 2 ký tự: ");
        splitEqualChunks("abcdef", 2);
        System.out.print("Chia \"abcdefg\" làm các phần 2 ký tự: ");
        splitEqualChunks("abcdefg", 2);
    }

    // Question 1
    public static int countWords(String str) {
        if (str == null || str.trim().isEmpty()) {
            return 0;
        }
        String[] words = str.trim().split("\\s+");
        return words.length;
    }

    // Question 2
    public static String concatenateStrings(String s1, String s2) {
        return s1 + s2;
    }

    // Question 3
    public static String capitalizeFirstLetter(String name) {
        if (name == null || name.isEmpty()) return name;
        name = name.trim();
        return name.substring(0, 1).toUpperCase() + name.substring(1);
    }

    // Question 4
    public static void printCharactersInName(String name) {
        if (name == null) return;
        char[] chars = name.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            System.out.println("Ký tự thứ " + (i + 1) + " là: " + Character.toUpperCase(chars[i]));
        }
    }

    // Question 5
    public static String combineName(String ho, String ten) {
        return ho.trim() + " " + ten.trim();
    }

    // Question 6
    public static void splitFullName(String fullName) {
        if (fullName == null || fullName.trim().isEmpty()) {
            System.out.println("Họ tên không hợp lệ.");
            return;
        }
        String[] parts = fullName.trim().split("\\s+");
        if (parts.length == 1) {
            System.out.println("Tên là: " + parts[0]);
        } else if (parts.length == 2) {
            System.out.println("Họ là: " + parts[0]);
            System.out.println("Tên là: " + parts[1]);
        } else {
            System.out.println("Họ là: " + parts[0]);
            StringBuilder middleName = new StringBuilder();
            for (int i = 1; i < parts.length - 1; i++) {
                middleName.append(parts[i]).append(i == parts.length - 2 ? "" : " ");
            }
            System.out.println("Tên đệm là: " + middleName.toString());
            System.out.println("Tên là: " + parts[parts.length - 1]);
        }
    }

    // Question 7
    public static String normalizeFullName(String fullName) {
        if (fullName == null || fullName.trim().isEmpty()) return "";
        String[] words = fullName.trim().split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            if (!word.isEmpty()) {
                String capitalizedWord = word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
                sb.append(capitalizedWord);
                if (i < words.length - 1) {
                    sb.append(" ");
                }
            }
        }
        return sb.toString();
    }

    // Question 8
    public static void printGroupsContainingJava(String[] groups) {
        System.out.println("Các group có chứa chữ \"Java\":");
        for (String g : groups) {
            if (g != null && g.contains("Java")) {
                System.out.println("- " + g);
            }
        }
    }

    // Question 9
    public static void printGroupsNamedJava(String[] groups) {
        System.out.println("Các group có tên đúng là \"Java\":");
        for (String g : groups) {
            if (g != null && g.equalsIgnoreCase("Java")) {
                System.out.println("- " + g);
            }
        }
    }

    // Question 10
    public static void checkReversePair(String s1, String s2) {
        if (s1 == null || s2 == null) {
            System.out.println("KO");
            return;
        }
        String rev = new StringBuilder(s2).reverse().toString();
        if (s1.equalsIgnoreCase(rev)) {
            System.out.println("Chuỗi \"" + s1 + "\" và \"" + s2 + "\": OK");
        } else {
            System.out.println("Chuỗi \"" + s1 + "\" và \"" + s2 + "\": KO");
        }
    }

    // Question 11
    public static int countCharA(String str) {
        if (str == null) return 0;
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == 'a' || str.charAt(i) == 'A') {
                count++;
            }
        }
        return count;
    }

    // Question 12
    public static String reverseStringWithLoop(String str) {
        if (str == null) return null;
        StringBuilder sb = new StringBuilder();
        for (int i = str.length() - 1; i >= 0; i--) {
            sb.append(str.charAt(i));
        }
        return sb.toString();
    }

    // Question 13
    public static boolean doesNotContainDigits(String str) {
        if (str == null) return false;
        for (int i = 0; i < str.length(); i++) {
            if (Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    // Question 14
    public static String replaceChar(String str, char oldChar, char newChar) {
        if (str == null) return null;
        return str.replace(oldChar, newChar);
    }

    // Question 15
    public static String reverseWordsWithoutLibrary(String str) {
        if (str == null) return null;
        String trimmed = str.trim();
        String[] words = trimmed.split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (int i = words.length - 1; i >= 0; i--) {
            sb.append(words[i]);
            if (i > 0) {
                sb.append(" ");
            }
        }
        return sb.toString();
    }

    // Question 16
    public static void splitEqualChunks(String str, int n) {
        if (str == null || n <= 0 || str.length() % n != 0) {
            System.out.println("KO");
            return;
        }
        List<String> chunks = new ArrayList<>();
        for (int i = 0; i < str.length(); i += n) {
            chunks.add(str.substring(i, i + n));
        }
        System.out.println(chunks);
    }
}
