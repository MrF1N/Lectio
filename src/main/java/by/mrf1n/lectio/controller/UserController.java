package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;

@Controller
@RequestMapping(path = "/user")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/profile")
    public String profilePage(Model model, Authentication authentication) {
        User user = userRepository.findByLogin(authentication.getName());
        model.addAttribute("roles", user.getRoles());
        return "profile";
    }
}
