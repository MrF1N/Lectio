package by.mrf1n.lectio.model.course.lecture;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.w3c.dom.Document;

@EqualsAndHashCode(callSuper = true)
@Data
public class PdfLecture extends Lecture {

    private Document pdfDocument;

    public void setPdfDocument(String url) {

    }
}
