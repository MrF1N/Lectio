package by.mrf1n.lectio.model.course.test;

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
import java.util.Set;

@Entity
@Table(name = "questions")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Question implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String questionName;
    private Long sequenceNumber;
    private String questionDescription;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "test_id", nullable = false)
    private Test test;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private Set<QuestionResult> results;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
    private Set<Answer> answers;

    private Long correctAnswersNumber;

    @Override
    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        result = (result * PRIME) + super.hashCode();
        if (this.id != null) {
            result = (result * PRIME) + this.id.hashCode();
        }
        if (this.questionName != null) {
            result = (result * PRIME) + this.questionName.hashCode();
        }
        if (this.sequenceNumber != null) {
            result = (result * PRIME) + this.sequenceNumber.hashCode();
        }
        if (this.questionDescription != null) {
            result = (result * PRIME) + this.questionDescription.hashCode();
        }
        if (this.correctAnswersNumber != null) {
            result = (result * PRIME) + this.correctAnswersNumber.hashCode();
        }
        return result;
    }
}
