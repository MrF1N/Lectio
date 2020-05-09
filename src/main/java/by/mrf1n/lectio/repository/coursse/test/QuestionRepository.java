package by.mrf1n.lectio.repository.coursse.test;

import by.mrf1n.lectio.model.course.test.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {

}
