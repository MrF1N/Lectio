package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import by.mrf1n.lectio.repository.coursse.CertificateRepository;
import by.mrf1n.lectio.repository.coursse.CourseRepository;
import by.mrf1n.lectio.repository.coursse.CourseResultRepository;
import by.mrf1n.lectio.service.LectioUiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping(path = "/user/{userId}")
public class UserController {

    private final UserRepository userRepository;
    private final CertificateRepository certificateRepository;
    private final CourseResultRepository courseResultRepository;
    private final CourseRepository courseRepository;
    private final LectioUiService lectioUiService;

    @Autowired
    public UserController(UserRepository userRepository,
                          CertificateRepository certificateRepository,
                          CourseResultRepository courseResultRepository,
                          CourseRepository courseRepository, LectioUiService lectioUiService) {
        this.userRepository = userRepository;
        this.certificateRepository = certificateRepository;
        this.courseResultRepository = courseResultRepository;
        this.courseRepository = courseRepository;
        this.lectioUiService = lectioUiService;
    }

    @GetMapping("/profile")
    public String getProfilePage(Model model,
                                 @PathVariable Long userId,
                                 Authentication authentication) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());

        if (userId != null) {
            Optional<User> user = userRepository.findById(userId);
            if (authUser.isPresent()
                    && user.isPresent()
                    && (CollectionUtils.containsAny(authUser.get().getRoles(), Role.getPermittedViewAllUsers())
                    || Objects.equals(authUser.get().getId(), user.get().getId()))) {
                lectioUiService.fillUserParamsModelByLogin(userId, authUser.get().getLogin(), model);
                User curUser = user.get();
                model.addAttribute("user", curUser);
                model.addAttribute("certificates", certificateRepository.findAllByStudentId(curUser.getId()));
                model.addAttribute("courses", courseRepository.findAllByStudents(curUser));
                return "user/profile";
            }
        }

        return "redirect:/error";
    }

    @GetMapping("/courses")
    public String getMyCoursesPage(Model model,
                                   @PathVariable Long userId,
                                   Authentication authentication) {
        model.addAttribute("certificates", courseResultRepository.findAll());
//        Optional<User> authUser = userRepository.findByLogin(authentication.getName());
//
//        if (userId != null) {
//            Optional<User> user = userRepository.findById(userId);
//            if (authUser.isPresent()
//                    && user.isPresent()
//                    && (CollectionUtils.containsAny(authUser.get().getRoles(), Role.getPermittedViewAllUsers())
//                    || Objects.equals(authUser.get().getId(), user.get().getId()))){
//                model.addAttribute("roles", authUser.get().getRoles());
//                model.addAttribute("login", authUser.get().getLogin());
//                return "courses";
//            }
////        }
//
//        return "redirect:/";
//        CourseResult result = CourseResult.builder().name("Основы защиты информации на предприятии").course(courseRepository.findById(13L).get()).build();
//        result = courseResultRepository.save(result);
//        Certificate cert = Certificate.builder().name("Основы защиты информации на предприятии").student(userRepository.findById(1L).get()).courseResult(result).build();
//        cert = certificateRepository.save(cert);
        return "courses/courses";
    }
}
