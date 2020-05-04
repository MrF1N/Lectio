package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;

@Controller
@RequestMapping(path = "/study")
public class StudentController {

    @GetMapping("/profile")
    public String profilePage(Model model) {
        model.addAttribute("roles", Collections.singletonList(Role.STUDENT));
        return "profile";
    }
}
