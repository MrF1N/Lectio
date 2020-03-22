package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URI;

@Controller
@RequestMapping(path = "/lectio/auth")
public class AuthController {
    private final UserRepository userRepository;

    public AuthController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping(value = "/check")
    public ResponseEntity authCheck() {
        return ResponseEntity.ok().body("Check OK");
    }

    @PostMapping("/reg")
    public ResponseEntity registration(@RequestBody User user) {
        User userDb = userRepository.findByLogin(user.getLogin());
        if (userDb == null) {
            return ResponseEntity.created(URI.create("")).body(userRepository.save(user));
        } else {
            return ResponseEntity.ok().body(userDb);
        }

    }



}
