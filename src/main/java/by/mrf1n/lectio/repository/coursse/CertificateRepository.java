package by.mrf1n.lectio.repository.coursse;

import by.mrf1n.lectio.model.course.Certificate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CertificateRepository extends JpaRepository<Certificate, Long> {

}
