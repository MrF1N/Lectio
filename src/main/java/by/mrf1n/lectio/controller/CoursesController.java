package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.course.Course;
import by.mrf1n.lectio.model.course.CourseResult;
import by.mrf1n.lectio.model.course.lecture.Lecture;
import by.mrf1n.lectio.model.course.task.Task;
import by.mrf1n.lectio.model.course.task.TaskResult;
import by.mrf1n.lectio.repository.UserRepository;
import by.mrf1n.lectio.repository.coursse.CourseRepository;
import by.mrf1n.lectio.repository.coursse.CourseResultRepository;
import by.mrf1n.lectio.repository.coursse.lecture.LectureRepository;
import by.mrf1n.lectio.repository.coursse.task.TaskRepository;
import by.mrf1n.lectio.repository.coursse.task.TaskResultRepository;
import by.mrf1n.lectio.repository.coursse.test.AnswerRepository;
import by.mrf1n.lectio.repository.coursse.test.QuestionRepository;
import by.mrf1n.lectio.repository.coursse.test.QuestionResultRepository;
import by.mrf1n.lectio.repository.coursse.test.TestRepository;
import by.mrf1n.lectio.repository.coursse.test.TestResultRepository;
import by.mrf1n.lectio.service.LectioUiService;
import by.mrf1n.lectio.service.validation.LectioInputValidationService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Controller
@RequestMapping(path = "/courses")
public class CoursesController {

    private final LectioUiService lectioUiService;
    private final LectioInputValidationService inputValidationService;
    private final CourseRepository courseRepository;
    private final CourseResultRepository courseResultRepository;
    private final LectureRepository lectureRepository;
    private final TaskRepository taskRepository;
    private final TaskResultRepository taskResultRepository;
    private final TestRepository testRepository;
    private final TestResultRepository testResultRepository;
    private final QuestionRepository questionRepository;
    private final QuestionResultRepository questionResultRepository;
    private final AnswerRepository answerRepository;
    private final UserRepository userRepository;

    @Autowired
    public CoursesController(LectioUiService lectioUiService, LectioInputValidationService inputValidationService,
                             CourseRepository courseRepository, CourseResultRepository courseResultRepository,
                             LectureRepository lectureRepository,
                             TaskRepository taskRepository, TaskResultRepository taskResultRepository,
                             TestRepository testRepository, TestResultRepository testResultRepository,
                             QuestionRepository questionRepository, QuestionResultRepository questionResultRepository,
                             AnswerRepository answerRepository, UserRepository userRepository) {
        this.lectioUiService = lectioUiService;
        this.inputValidationService = inputValidationService;
        this.courseRepository = courseRepository;
        this.courseResultRepository = courseResultRepository;
        this.lectureRepository = lectureRepository;
        this.taskRepository = taskRepository;
        this.taskResultRepository = taskResultRepository;
        this.testRepository = testRepository;
        this.testResultRepository = testResultRepository;
        this.questionRepository = questionRepository;
        this.questionResultRepository = questionResultRepository;
        this.answerRepository = answerRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/catalog")
    public String getCatalogPage(Model model,
                                 Authentication authentication,
                                 @RequestParam(required = false) String filter) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        if (Strings.isEmpty(filter)) {
            model.addAttribute("courses", courseRepository.findAll());
        } else {
            model.addAttribute("courses", courseRepository.findCoursesLikeName(filter));
            model.addAttribute("filter", filter);
        }
        return "courses/catalog";
    }

    @GetMapping("/new")
    public String getNewCoursePage(Model model, Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        model.addAttribute("course", new Course());
        return "courses/new";
    }

    @PostMapping("/add")
    public String getAddCourse(@ModelAttribute("course") Course course,
                               BindingResult result,
                               Model model,
                               Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        if (inputValidationService.validateCourseName(course, result)) return "courses/new";
        Optional<User> user = userRepository.findByLogin(authentication.getName());
        if (user.isPresent()) {
            user.ifPresent(course::setCreator);
            Set<User> users = Collections.singleton(user.get());
            course.setTeachers(users);
            CourseResult courseResult = CourseResult.builder().course(course).name(course.getName()).build();
            courseResultRepository.save(courseResult);
            Course save = courseRepository.save(course);
            return "redirect:/courses/" + save.getId();
        }
        return "courses/new";
    }

    @GetMapping("/{id}")
    public String getCoursePage(Model model,
                                @PathVariable Long id,
                                Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            model.addAttribute("course", course.get());
            return "courses/course";
        }
        return "redirect:/error";
    }

    @GetMapping("/{id}/plan")
    public String getPlanOfCoursePage(Model model,
                                      @PathVariable Long id,
                                      Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            List<TaskResult> taskResults = new ArrayList<>();
            for (Task task : course.get().getTasks()) {
                taskResults.addAll(taskResultRepository.findAllByTask(task));
            }
            model.addAttribute("course", course.get());
            model.addAttribute("task_results", taskResults);
            model.addAttribute("rating", new Long(0L));
            model.addAttribute("course_page", "plan");
            return "courses/course";
        }
        return "redirect:/error";
    }

    @PostMapping("/{id}/taskResult/{taskResultId}/teacher/{teacherId}/rate")
    public String setRatingTaskResult(Model model,
                                      @PathVariable Long id,
                                      @PathVariable Long taskResultId,
                                      @PathVariable Long teacherId,
                                      @RequestParam("rating") Long rating,
                                      Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<TaskResult> taskResult = taskResultRepository.findById(taskResultId);
        if (taskResult.isPresent()) {
            taskResult.get().setTeacher(userRepository.getOne(teacherId));
            taskResult.get().setRating(rating);
            taskResultRepository.save(taskResult.get());
            return "redirect:/courses/" + id + "/plan";
        }
        return "redirect:/error";
    }

    @GetMapping("/{id}/preview")
    public String getCoursePreviewPage(Model model,
                                       @PathVariable Long id,
                                       Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            model.addAttribute("course", course.get());
            return "courses/preview";
        }
        return "redirect:/error";
    }

    @GetMapping("/{id}/join")
    public String joinToCourse(Model model,
                               @PathVariable Long id,
                               Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            Course courseItem = course.get();
            Optional<User> byLogin = userRepository.findByLogin(authentication.getName());
            if (byLogin.isPresent()) {
                courseItem.getStudents().add(byLogin.get());
                courseRepository.save(courseItem);
                model.addAttribute("course", courseItem);
                model.addAttribute("course_page", "plan");
                return "courses/course";
            }
        }
        return "redirect:/error";
    }

    @GetMapping("/{id}/lecture/{lectureId}")
    public String getLecturePage(Model model,
                                 @PathVariable Long id,
                                 @PathVariable Long lectureId,
                                 Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Lecture> lecture = lectureRepository.findById(lectureId);
        if (lecture.isPresent()) {
            model.addAttribute("lecture", lecture.get());
            return "lecture/lecture_view";
        }
        return "redirect:/error";
    }

    @GetMapping("/{id}/task/{taskId}")
    public String getTaskPage(Model model,
                              @PathVariable Long id,
                              @PathVariable Long taskId,
                              Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Task> task = taskRepository.findById(taskId);
        Optional<User> student = userRepository.findByLogin(authentication.getName());
        User user = student.orElse(new User());
        Optional<TaskResult> taskResult = taskResultRepository.findAllByTaskIdAndStudentId(taskId, user.getId());
        if (task.isPresent()) {
            model.addAttribute("task", task.get());
            model.addAttribute("taskResult", taskResult.orElse(new TaskResult()));
            return "task/task";
        }
        return "redirect:/error";
    }

    @PostMapping("/{id}/task/{taskId}/answer")
    public String getAddTask(Model model,
                             @PathVariable Long id,
                             @ModelAttribute("taskResult") TaskResult taskResult,
                             @PathVariable Long taskId,
                             Authentication authentication) {
        lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        Optional<Task> task = taskRepository.findById(taskId);
        Optional<User> student = userRepository.findByLogin(authentication.getName());
        User user = student.orElse(new User());
        Optional<CourseResult> courseResult = courseResultRepository.findAllByStudentIdAndCourseId(user.getId(), id);
        taskResult.setCourseResult(courseResult.orElse(new CourseResult()));
        taskResult.setStudent(user);
        taskResult.setTask(task.orElse(new Task()));
        taskResult.saveFiles();
        taskResultRepository.save(taskResult);
        taskResult = taskResultRepository.findAllByTaskIdAndStudentId(taskId, user.getId()).orElse(null);
        if (task.isPresent()) {
            model.addAttribute("task", task.get());
            model.addAttribute("taskResult", taskResult);
            return "redirect:/courses/" + id + "/task/" + taskId;
        }
        return "redirect:/error";
    }
}
