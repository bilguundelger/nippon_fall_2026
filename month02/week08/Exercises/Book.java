public class Book {
    private String title;
    private boolean borrowed;

    public Book(String bookTitle) {
        this.title = bookTitle;
        this.borrowed = false;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isBorrowed() {
        return this.borrowed;
    }

    public void setBorrowed(boolean borrowed) {
        this.borrowed = borrowed;
    }
}
