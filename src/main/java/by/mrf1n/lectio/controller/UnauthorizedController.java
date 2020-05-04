package by.mrf1n.lectio.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/")
public class UnauthorizedController {

    @GetMapping("")
    public String getMainPage() {
        return "index";
    }
}
