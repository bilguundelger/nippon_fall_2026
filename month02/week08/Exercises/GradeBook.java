public class GradeBook {
private int[] scores;
private int count;
public GradeBook(int maxExams){
    if (maxExams > 0){
        score = new int[maxExams];

    }else{
        score = new int[5];
        count = 5;
    }
}

