package cc.coopersoft.construct.fire.model;

import cc.coopersoft.common.cloud.schemas.WeedFsResult;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "FIRE_CHECK_REPORT")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class Report implements java.io.Serializable {

    public interface Summary  {}
    public interface Details extends Summary {}


    public Report(FireCheck check, WeedFsResult weedFsResult, String name, boolean fail) {
        this.check = check;
        this.id = weedFsResult.getFid();
        this.name = name;
        this.time = new Date();
        this.size = weedFsResult.getSize();
        this.type = weedFsResult.getMime();
        this.fail = fail;
    }

    @Id
    @Column(name = "FILE_ID", length = 32, nullable = false, unique = true)
    @NotNull
    @JsonView(Summary.class)
    private String id;

    @Column(name = "NAME", length = 32, nullable = false)
    @NotBlank
    @JsonView(Summary.class)
    private String name;

    @Column(name = "FAIL", nullable = false)
    private boolean fail;

    @Column(name = "MD5", length = 32)
    private String md5;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "UPLOAD_TIME")
    @NotNull
    private Date time;

    @Column(name = "FILE_SIZE")
    private Integer size;

    @Column(name = "FILE_TYPE", length = 512, nullable = false)
    @NotNull
    private String type;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "BUSINESS", nullable = false)
    @JsonIgnore
    private FireCheck check;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Report report = (Report) o;

        if (!Objects.equals(id, report.id)) return false;
        return Objects.equals(name, report.name);
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
