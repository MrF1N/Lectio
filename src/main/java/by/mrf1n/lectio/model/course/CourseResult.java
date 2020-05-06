package by.mrf1n.lectio.model.course;

import by.mrf1n.lectio.model.course.task.TaskResult;
import by.mrf1n.lectio.model.course.test.TestResult;
import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.util.Set;

@Entity
@Table(name = "courses")
@Data
public class CourseResult {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "courseResult")
    private Set<TestResult> testResults;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "courseResult")
    private Set<TaskResult> taskResults;
    @OneToOne(optional = false)
    @JoinColumn(name = "certificate_id", unique = true, nullable = false, updatable = false)
    private Certificate certificate;

}
