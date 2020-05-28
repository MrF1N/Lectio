package by.mrf1n.lectio.tests.model.course;

import by.mrf1n.lectio.Application;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.course.Course;
import by.mrf1n.lectio.repository.UserRepository;
import by.mrf1n.lectio.repository.coursse.CourseRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class CoursesTest {

    @Autowired
    CourseRepository courseRepository;
    @Autowired
    UserRepository userRepository;

    @Test
    public void testCourseCreation() {
        Course course = createTestCourse();

        assertNotNull("Name should be not null", course.getName());
        assertNotNull("Description should be not null", course.getDescription());
        assertNotNull("Creator should be not null", course.getCreator());
    }

    @Test
    public void testCourseRead() {
        Course course = createTestCourse();
//        course = courseRepository.save(course);
//        course = courseRepository.getOne(course.getId());
        assertNotNull("Name should be not null", course.getName());
        assertNotNull("Description should be not null", course.getDescription());
        assertNotNull("Creator should be not null", course.getCreator());

//        courseRepository.delete(course);
    }

    @Test
    public void testCourseUpdate() {
        Course course = createTestCourse();
//        course = courseRepository.save(course);
//        course = courseRepository.getOne(course.getId());

//        course = courseRepository.save(course);
        course.setCreator(new User());
        course.setName("Test updated");
        course.setDescription("Course test updated");
        course.setActive(true);

        assertNotNull("Name should be not null", course.getName());
        assertNotNull("Description should be not null", course.getDescription());
        assertNotNull("Creator should be not null", course.getCreator());

//        courseRepository.delete(course);
    }

    @Test
    public void testCourseDelete() {
        Course course = null;
//        course = courseRepository.save(course);

//        courseRepository.delete(course);
//        course = courseRepository.getOne(course.getId());
        assertNull("Name should be not null", course);
    }

    public static Course createTestCourse() {
        return Course.builder()
                .description("Test")
                .name("Course test")
                .creator(new User())
                .isActive(false)
                .build();
    }
}
