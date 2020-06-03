package by.mrf1n.lectio.repository.coursse.task;

import by.mrf1n.lectio.model.course.task.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {

    List<Task> findAllByCourseId(Long courseId);
}
