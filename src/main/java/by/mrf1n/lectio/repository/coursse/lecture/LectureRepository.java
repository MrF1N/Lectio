package by.mrf1n.lectio.repository.coursse.lecture;

import by.mrf1n.lectio.model.course.lecture.Lecture;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LectureRepository extends JpaRepository<Lecture, Long> {
}
