package by.mrf1n.lectio.service;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Optional;

@Service("lectioUiService")
public class LectioUiService {

    private final UserRepository userRepository;

    @Autowired
    public LectioUiService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Model fillRolesModelByUser(User user, Model model) {
        model.addAttribute("roles", user.getRoles());
        return model;
    }

    public Model fillRolesModelByLogin(String currentLogin, Model model) {
        Optional<User> user = userRepository.findByLogin(currentLogin);
        user.ifPresent(value -> model.addAttribute("roles", value.getRoles()));
        return model;
    }

    public Model fillUserParamsModelByLogin(Long userId, String currentLogin, Model model) {
        Optional<User> user = userRepository.findByLogin(currentLogin);
        if (user.isPresent()) {
            model.addAttribute("roles", user.get().getRoles());
            model.addAttribute("login", user.get().getLogin());
        }
        model.addAttribute("userId", userId);
        return model;
    }
}
