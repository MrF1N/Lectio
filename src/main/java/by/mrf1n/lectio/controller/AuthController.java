package by.mrf1n.lectio.controller;

import by.mrf1n.lectio.model.Role;
import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.UserModel;
import by.mrf1n.lectio.repository.UserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URI;
import java.util.HashSet;
import java.util.Optional;

@Controller
@RequestMapping(path = "/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public AuthController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/registration")
    public String registrationPage(Model model) {
        model.addAttribute("userModel", new UserModel());
        return "user/registration";
    }

    @PostMapping("/register")
    public String registration(@ModelAttribute("userModel") UserModel userModel, BindingResult result, Model model) {
        User user = userModel.getUser();
        user.setActive(true);
        if (user.getRoles() == null) {
            user.setRoles(new HashSet<>());
        }
        if (userModel.isStudent()) {
            user.getRoles().add(Role.STUDENT);
        }
        if (userModel.isTeacher()) {
            user.getRoles().add(Role.TEACHER);
        }
        if (userModel.isCreator()) {
            user.getRoles().add(Role.CREATOR);
        }
        String password = user.getPassword();
        String encryptPwd = passwordEncoder.encode(password);
        user.setPassword(encryptPwd);
        userRepository.save(user);
        return "redirect:/";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        return "user/login";
    }

    @GetMapping(value = "/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
    }

    @GetMapping(value = "/check")
    public ResponseEntity authCheck() {
        return ResponseEntity.ok().body("Check OK");
    }

    @PostMapping("/reg")
    public ResponseEntity registrationHttp(@RequestBody User user) {
        Optional<User> userDb = userRepository.findByLogin(user.getLogin());
        if (userDb.isEmpty()) {
            String password = user.getPassword();
            String encryptPwd = passwordEncoder.encode(password);
            user.setPassword(encryptPwd);
            return ResponseEntity.created(URI.create("")).body(userRepository.save(user));
        } else {
            return ResponseEntity.ok().body(userDb.get());
        }

    }

}
