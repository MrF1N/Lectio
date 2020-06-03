package by.mrf1n.lectio.model.course.test;

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
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "tests")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Test implements Serializable {
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
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "test")
    private Set<Question> questions;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "test")
    private Set<TestResult> results;

    public Long getRatingByStudentId(Long studentId) {
        return results.stream().filter(testResult -> Objects.equals(studentId, testResult.getStudent().getId())).map(TestResult::getRating).findFirst().orElse(null);
    }

    public boolean isExistsResultByStudentId(Long studentId) {
        return results.stream().filter(testResult -> Objects.equals(studentId, testResult.getStudent().getId())).findFirst().orElse(null) != null;
    }

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
        return result;
    }
}
