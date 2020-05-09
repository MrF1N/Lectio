package by.mrf1n.lectio.service.validation;

import by.mrf1n.lectio.model.course.Course;
import by.mrf1n.lectio.repository.coursse.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("lectioInputValidationService")
public class LectioInputValidationService {

    private final CourseRepository courseRepository;

    @Autowired
    public LectioInputValidationService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public boolean validateCourseName(@ModelAttribute("course") Course user, BindingResult result) {
        boolean error = false;

        if (user.getName().isEmpty()) {
            result.rejectValue("course", "error.login.empty");
            error = true;
        }

        return error;
    }
}
