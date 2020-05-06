package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import by.mrf1n.lectio.service.LectioUiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping(path = "")
public class MainController {

    private final LectioUiService lectioUiService;
    private final UserRepository userRepository;

    @Autowired
    public MainController(LectioUiService lectioUiService, UserRepository userRepository) {
        this.lectioUiService = lectioUiService;
        this.userRepository = userRepository;
    }

    @GetMapping("/")
    public String getMainPage(Model model, Authentication authentication) {
        if (authentication != null) {
            lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        }
        return "index";
    }

    @GetMapping("/error")
    public String getErrorPage(Model model, Authentication authentication) {
        if (authentication != null) {
            lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        }
        return "error";
    }

    @GetMapping("/profile")
    public String profilePage(Authentication authentication) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());
        return authUser.map(user -> "redirect:/user/" + user.getId() + "/profile").orElse("redirect:/");

    }


    @GetMapping("/courses")
    public String getMyCoursesPage(Authentication authentication) {
        Optional<User> authUser = userRepository.findByLogin(authentication.getName());
        return authUser.map(user -> "redirect:/user/" + user.getId() + "/courses").orElse("redirect:/");

    }
}
