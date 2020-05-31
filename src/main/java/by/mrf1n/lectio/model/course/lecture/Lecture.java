package by.mrf1n.lectio.model.course.lecture;

import by.mrf1n.lectio.model.course.Course;
import by.mrf1n.lectio.model.course.lecture.type.DocTypes;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "lectures")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Lecture implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private Long sequenceNumber;
    private String description;
    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @Enumerated(EnumType.STRING)
    private DocTypes type;
    private String fileUrl;
    private String binaryFile;

    @Override
    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        result = (result * PRIME) + super.hashCode();
        if (this.id != null) {
            result = (result * PRIME) + this.id.hashCode();
        }
        if (this.name != null) {
            result = (result * PRIME) + this.name.hashCode();
        }
        if (this.description != null) {
            result = (result * PRIME) + this.description.hashCode();
        }
        if (this.sequenceNumber != null) {
            result = (result * PRIME) + this.sequenceNumber.hashCode();
        }
        if (this.fileUrl != null) {
            result = (result * PRIME) + this.fileUrl.hashCode();
        }
        if (this.binaryFile != null) {
            result = (result * PRIME) + this.binaryFile.hashCode();
        }
        if (this.type != null) {
            result = (result * PRIME) + this.type.hashCode();
        }
        return result;
    }
}
