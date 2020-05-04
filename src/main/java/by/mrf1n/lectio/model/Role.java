package by.mrf1n.lectio.model;

public enum Role {
    STUDENT("STUDENT"),
    TEACHER("TEACHER"),
    CREATOR("CREATOR"),
    ADMIN("ADMIN");

    private final String name;

    Role(String name) {
        this.name = name;
    }

    public String getRoleName() {
        return this.name;
    }
}
