package by.mrf1n.lectio.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/")
public class UnauthorizedController {

    @RequestMapping("")
    public String getMainPage() {
        return "index.jsp";
    }
}
