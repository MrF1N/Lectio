package by.mrf1n.lectio.model.course.test;

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
import javax.persistence.Table;
import java.util.Set;

@Entity
@Table(name = "questions")
@Data
public class Question {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;
    private Long sequenceNumber;
    private String description;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "test_id", nullable = false)
    private Test test;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private Set<QuestionResult> results;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private Set<Answer> answers;

    private Long correctAnswersNumber;

}
