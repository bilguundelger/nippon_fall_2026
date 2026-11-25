
/**
 * Write a description of class BookChapter here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class BookChapter {
    private String chapterTitle;
    private int totalPages;
    private int pagesRead;

    public BookChapter(String chapterTitle, int totalPages) {
        this.chapterTitle = chapterTitle;
        this.totalPages = totalPages;
        this.pagesRead = 0;
    }

    public void readPages(int count) {
        pagesRead += count;
        if (pagesRead > totalPages) {
            pagesRead = totalPages;
        }
    }

    public int getPagesLeft() {
        return totalPages - pagesRead;
    }

    public double estimateMinutesToFinish(double minutesPerPage) {
        return getPagesLeft() * minutesPerPage;
    }
}