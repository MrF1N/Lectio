package by.mrf1n.lectio.model;

import java.util.Arrays;
import java.util.List;

public enum Role {
    STUDENT("STUDENT"),
    TEACHER("TEACHER"),
    CREATOR("CREATOR"),
    MODERATOR("MODERATOR"),
    ADMIN("ADMIN");

    private final String name;

    Role(String name) {
        this.name = name;
    }

    public String getRoleName() {
        return this.name;
    }

    public static List<Role> getPermittedViewAllUsers() {
        return Arrays.asList(MODERATOR, ADMIN);
    }
}
