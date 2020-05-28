package by.mrf1n.lectio.tests.model.lection;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.course.Course;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;

public class LectionTest {

    @Test
    public void testCourseCreation() {
        Course course = createTestCourse();

        assertNotNull("Name should be not null", course.getName());
        assertNotNull("Description should be not null", course.getDescription());
        assertNotNull("Creator should be not null", course.getCreator());
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
