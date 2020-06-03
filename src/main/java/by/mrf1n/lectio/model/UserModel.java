package by.mrf1n.lectio.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserModel implements Serializable {
    private static final long serialVersionUID = 1L;

    private User user;
    private boolean isStudent;
    private boolean isTeacher;
    private boolean isCreator;
    private boolean isAdmin;
}
