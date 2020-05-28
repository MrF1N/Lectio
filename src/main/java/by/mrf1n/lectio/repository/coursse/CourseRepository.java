package by.mrf1n.lectio.repository.coursse;

import by.mrf1n.lectio.model.course.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    @Query("select course from Course course where lower(course.name) like lower(concat('%', :name,'%'))")
    List<Course> findCoursesLikeName(@Param("name") String name);
}
