package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.URI;

@Controller
@RequestMapping(path = "/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public AuthController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = "/check")
    public ResponseEntity authCheck() {
        return ResponseEntity.ok().body("Check OK");
    }

    @PostMapping("/reg")
    public ResponseEntity registration(@RequestBody User user) {
        User userDb = userRepository.findByLogin(user.getLogin());
        if (userDb == null) {
            String password = user.getPassword();
            String encryptPwd = passwordEncoder.encode(password);
            user.setPassword(encryptPwd);
            return ResponseEntity.created(URI.create("")).body(userRepository.save(user));
        } else {
            return ResponseEntity.ok().body(userDb);
        }

    }



}
