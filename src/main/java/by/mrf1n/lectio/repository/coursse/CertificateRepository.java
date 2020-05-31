package by.mrf1n.lectio.repository.coursse;

import by.mrf1n.lectio.model.course.Certificate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {

    List<Certificate> findAllByStudentId(Long studentId);

}
