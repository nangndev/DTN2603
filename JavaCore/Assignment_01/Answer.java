public class Answer {

    public Integer answerId;
    public String content;
    public Integer questionId;
    public IsCorrect isCorrect;

    public enum IsCorrect {
        TRUE,
        FALSE
    }

}