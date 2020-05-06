package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.service.LectioUiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/courses")
public class CoursesController {

    private final LectioUiService lectioUiService;

    @Autowired
    public CoursesController(LectioUiService lectioUiService) {
        this.lectioUiService = lectioUiService;
    }

    @GetMapping("/catalog")
    public String getCatalogPage(Model model, Authentication authentication) {
        if (authentication != null) {
            lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        }
        return "catalog";
    }

    @GetMapping("/new")
    public String getNewCoursePage(Model model, Authentication authentication) {
        if (authentication != null) {
            lectioUiService.fillRolesModelByLogin(authentication.getName(), model);
        }
        return "catalog";
    }
}
