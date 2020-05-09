package by.mrf1n.lectio.repository;

import by.mrf1n.lectio.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByLogin(String login);

    @Query("select user.id from User user where user.login = :login")
    Optional<Long> getIdByLogin(@Param("login") String login);

}
