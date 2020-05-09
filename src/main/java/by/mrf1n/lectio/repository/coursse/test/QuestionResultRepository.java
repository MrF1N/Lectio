package by.mrf1n.lectio.repository.coursse.test;

import by.mrf1n.lectio.model.course.test.QuestionResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionResultRepository extends JpaRepository<QuestionResult, Long> {

}
