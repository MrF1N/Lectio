package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.UserModel;
import by.mrf1n.lectio.repository.UserRepository;
import by.mrf1n.lectio.repository.coursse.CertificateRepository;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashSet;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping(path = "/admin")
public class AdminController {

    private final LectureRepository lectureRepository;
    private final TaskRepository taskRepository;
    private final TaskResultRepository taskResultRepository;
    private final AnswerRepository answerRepository;
    private final QuestionRepository questionRepository;
    private final QuestionResultRepository questionResultRepository;
    private final TestRepository testRepository;
    private final TestResultRepository testResultRepository;
    private final CertificateRepository certificateRepository;
    private final CourseRepository courseRepository;
    private final CourseResultRepository courseResultRepository;
    private final UserRepository userRepository;
    private final LectioUiService lectioUiService;
    private final BCryptPasswordEncoder passwordEncoder;

    public AdminController(LectureRepository lectureRepository, TaskRepository taskRepository,
                           TaskResultRepository taskResultRepository, AnswerRepository answerRepository,
                           QuestionRepository questionRepository, QuestionResultRepository questionResultRepository,
                           TestRepository testRepository, TestResultRepository testResultRepository,
                           CertificateRepository certificateRepository, CourseRepository courseRepository,
                           CourseResultRepository courseResultRepository, UserRepository userRepository,
                           LectioUiService lectioUiService, BCryptPasswordEncoder passwordEncoder) {
        this.lectureRepository = lectureRepository;
        this.taskRepository = taskRepository;
        this.taskResultRepository = taskResultRepository;
        this.answerRepository = answerRepository;
        this.questionRepository = questionRepository;
        this.questionResultRepository = questionResultRepository;
        this.testRepository = testRepository;
        this.testResultRepository = testResultRepository;
        this.certificateRepository = certificateRepository;
        this.courseRepository = courseRepository;
        this.courseResultRepository = courseResultRepository;
        this.userRepository = userRepository;
        this.lectioUiService = lectioUiService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/manage")
    public String profilePage(Model model, Authentication authentication) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());

        if (authUser.isPresent()) {
            lectioUiService.fillUserParamsModelByLogin(authUser.get().getId(), authUser.get().getLogin(), model);
            model.addAttribute("lectures", lectureRepository.findAll());
            model.addAttribute("tasks", taskRepository.findAll());
            model.addAttribute("task_results", taskResultRepository.findAll());
            model.addAttribute("answers", answerRepository.findAll());
            model.addAttribute("questions", questionRepository.findAll());
            model.addAttribute("question_results", questionResultRepository.findAll());
            model.addAttribute("tests", testRepository.findAll());
            model.addAttribute("test_results", testResultRepository.findAll());
            model.addAttribute("certificates", certificateRepository.findAll());
            model.addAttribute("courses", courseRepository.findAll());
            model.addAttribute("course_results", courseResultRepository.findAll());
            model.addAttribute("users", userRepository.findAll());
            return "admin/manage_system";
        }
        return "redirect:/error";
    }

    @GetMapping("/user/{id}")
    public String updateUserPage(Model model, Authentication authentication, @PathVariable Long id) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());

        if (authUser.isPresent()) {
            lectioUiService.fillUserParamsModelByLogin(authUser.get().getId(), authUser.get().getLogin(), model);
            UserModel userModel = new UserModel();
            if (id != 0) {
                User user = userRepository.findById(id).get();
                userModel.setUser(user);
                userModel.setCreator(user.getRoles().contains(Role.CREATOR));
                userModel.setStudent(user.getRoles().contains(Role.STUDENT));
                userModel.setTeacher(user.getRoles().contains(Role.TEACHER));
                userModel.setAdmin(user.getRoles().contains(Role.ADMIN));
            }
            model.addAttribute("userModel", userModel);
            return "admin/user";
        }
        return "redirect:/error";
    }

    @PostMapping("/user")
    public String updateUser(@ModelAttribute("userModel") UserModel userModel, Model model, Authentication authentication) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());

        if (authUser.isPresent()) {
            lectioUiService.fillUserParamsModelByLogin(authUser.get().getId(), authUser.get().getLogin(), model);
            User user = userModel.getUser();
            Long id = user.getId();
            if (id != null) {
                User curUser = userRepository.findById(id).get();
                if (!Objects.equals(curUser.getPassword(), user.getPassword())) {
                    user.setPassword(passwordEncoder.encode(user.getPassword()));
                }
            } else {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
            if (user.getRoles() == null) {
                user.setRoles(new HashSet<>());
            }
            if (userModel.isStudent()) {
                user.getRoles().add(Role.STUDENT);
            }
            if (userModel.isTeacher()) {
                user.getRoles().add(Role.TEACHER);
            }
            if (userModel.isCreator()) {
                user.getRoles().add(Role.CREATOR);
            }
            if (userModel.isAdmin()) {
                user.getRoles().add(Role.ADMIN);
            }
            userRepository.save(user);
            return "redirect:/admin/manage";
        }
        return "redirect:/error";
    }

    @GetMapping("/user/{id}/delete")
    public String deleteUserPage(Model model, Authentication authentication, @PathVariable Long id) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());

        if (authUser.isPresent()) {
            userRepository.deleteById(id);
            return "redirect:/admin/manage";
        }
        return "redirect:/error";
    }

}
