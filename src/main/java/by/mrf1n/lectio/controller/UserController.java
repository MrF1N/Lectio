package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
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
    private final LectioUiService lectioUiService;

    @Autowired
    public UserController(UserRepository userRepository, LectioUiService lectioUiService) {
        this.userRepository = userRepository;
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
                return "user/profile";
            }
        }

        return "redirect:/error";
    }

    @GetMapping("/courses")
    public String getMyCoursesPage(Model model,
                                   @PathVariable Long userId,
                                   Authentication authentication) {
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
        return "courses/courses";
    }
}
