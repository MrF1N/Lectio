package by.mrf1n.lectio.repository.coursse.task;

import by.mrf1n.lectio.model.course.task.TaskResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskResultRepository extends JpaRepository<TaskResult, Long> {

}
