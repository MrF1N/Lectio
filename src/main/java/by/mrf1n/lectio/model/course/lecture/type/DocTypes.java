package by.mrf1n.lectio.model.course.lecture.type;

public enum DocTypes {
    html("html"),
    pdf("pdf"),
    txt("txt"),
    mp4("mp4");

    private final String name;

    DocTypes(String name) {
        this.name = name;
    }

    public String getDocTypeName() {
        return this.name;
    }
}
