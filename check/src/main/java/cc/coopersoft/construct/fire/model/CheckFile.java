package cc.coopersoft.construct.fire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "FIRE_FILE_CHECK")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class CheckFile {

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @Column(name = "PASS",nullable = false)
    private boolean pass;

    @Column(name = "NAME", nullable = false, length = 64)
    @NotBlank
    @Size(max = 64)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "BUSINESS", nullable = false)
    @JsonIgnore
    private FireCheck check;
}
