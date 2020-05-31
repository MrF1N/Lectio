package by.mrf1n.lectio.model.course.task;

import by.mrf1n.lectio.model.course.Course;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.File;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "tasks")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Task implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private Long sequenceNumber;
    private String description;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "task")
    private List<TaskResult> results;

    private String comment;

    @Transient
    private List<File> files;

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
        if (this.comment != null) {
            result = (result * PRIME) + this.comment.hashCode();
        }
        return result;
    }
}
