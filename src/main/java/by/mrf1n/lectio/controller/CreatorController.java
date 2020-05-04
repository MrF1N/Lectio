package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Arrays;
import java.util.Collections;

@Controller
@RequestMapping(path = "/create")
public class CreatorController {

    @GetMapping("/profile")
    public String profilePage(Model model, User user) {
        model.addAttribute("roles", Arrays.asList(Role.CREATOR, Role.TEACHER));
        return "profile";
    }
}
