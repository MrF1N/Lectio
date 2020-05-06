package by.mrf1n.lectio.model.course;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.course.lecture.Lecture;
import by.mrf1n.lectio.model.course.task.Task;
import by.mrf1n.lectio.model.course.test.Test;
import lombok.Data;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "courses")
@Data
public class Course implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private String description;

    @ManyToMany
    @JoinTable(name = "course_student",
            joinColumns = @JoinColumn(name = "course_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
    private Set<User> students;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "user_id", nullable = false)
    private User creator;
    @ManyToMany
    @JoinTable(name = "course_teacher",
            joinColumns = @JoinColumn(name = "course_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
    private Set<User> teachers;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "course")
    private Set<Lecture> lectures;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "course")
    private Set<Test> tests;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "course")
    private Set<Task> tasks;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "course")
    private Set<CourseResult> results;

}
