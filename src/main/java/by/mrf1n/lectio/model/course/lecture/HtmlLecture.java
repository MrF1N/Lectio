package by.mrf1n.lectio.model.course.lecture;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.w3c.dom.Document;

@EqualsAndHashCode(callSuper = true)
@Data
public class HtmlLecture extends Lecture {

    private Document htmlDocument;

    public void setHtmlDocument(String url) {

    }
}
