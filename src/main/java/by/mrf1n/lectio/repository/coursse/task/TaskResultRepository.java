package by.mrf1n.lectio.repository.coursse.task;

import by.mrf1n.lectio.model.course.task.Task;
import by.mrf1n.lectio.model.course.task.TaskResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TaskResultRepository extends JpaRepository<TaskResult, Long> {

    Optional<TaskResult> findAllByTaskIdAndStudentId(Long taskId, Long studentId);

    List<TaskResult> findAllByTask(Task task);
}
