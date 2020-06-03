package by.mrf1n.lectio.model.course.task;

import by.mrf1n.lectio.model.User;
import by.mrf1n.lectio.model.course.CourseResult;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Entity
@Table(name = "task_results")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TaskResult implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "task_id", nullable = false)
    private Task task;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "course_result_id", nullable = false)
    private CourseResult courseResult;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "student_id", nullable = false)
    private User student;
    @ManyToOne(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "teacher_id")
    private User teacher;
    private Long rating;
    private String comment;

    @ElementCollection
    @CollectionTable(name = "task_result_file_paths", joinColumns = @JoinColumn(name = "file_path_id"))
    @Column(name = "file_path")
    private List<String> filePaths;
    @Transient
    private List<File> files;

    @Override
    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        result = (result * PRIME) + super.hashCode();
        if (this.id != null) {
            result = (result * PRIME) + this.id.hashCode();
        }
        if (this.rating != null) {
            result = (result * PRIME) + this.rating.hashCode();
        }
        if (this.comment != null) {
            result = (result * PRIME) + this.comment.hashCode();
        }
        return result;
    }

    public void saveFiles() {
        files.forEach(file -> {
            Path newPath = Paths.get("E:\\Progs\\Diplom\\lectio-server\\src\\main\\webapp\\resources\\files\\task\\user_" + student.getId() + "\\task_" + task.getId() + "\\", file.getPath());
            try {
                Files.createDirectories(newPath);
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            File newFile = newPath.toFile();
            try {
                boolean isCreated = newFile.createNewFile();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            try (OutputStream os = new FileOutputStream(newFile)) {

                Files.copy(file.toPath(), os);
                filePaths.add(newPath.toString());

            } catch (IOException ex) {
                ex.printStackTrace();
            }
        });
    }
}
