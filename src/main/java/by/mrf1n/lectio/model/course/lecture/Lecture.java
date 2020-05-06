package by.mrf1n.lectio.model.course.lecture;

import by.mrf1n.lectio.model.course.Course;
import by.mrf1n.lectio.model.course.lecture.type.DocTypes;
import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "lectures")
@Data
public class Lecture {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private Long sequenceNumber;
    private String description;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "teacher_id", nullable = false)
    private Course course;

    private DocTypes type;
    private String fileUrl;
    private String binaryFile;
}
