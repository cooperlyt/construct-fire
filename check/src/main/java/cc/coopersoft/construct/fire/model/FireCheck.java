package cc.coopersoft.construct.fire.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "FIRE_CHECK")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class FireCheck {

    public interface CreateResult {}
    public interface Summary extends FireCheckInfo.Title,FireProject.Summary {}
    public interface Details extends FireCheckInfo.Title,FireProject.Details, Report.Summary {}


    public enum Status {
        Prepare,
        Running,
        Qualified,
        Unqualified,
        NoAccept,
        Abort
    }

    public enum Type{
        First,
        Review
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView({FireCheckInfo.Title.class, CreateResult.class})
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS", nullable = false, length = 11)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView(FireCheckInfo.Title.class)
    private Status status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "APPLY_TIME", nullable = false)
    @JsonView(FireCheckInfo.Title.class)
    private Date applyTime;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "REG_TIME")
    @JsonView(FireCheckInfo.Title.class)
    private Date regTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "APPLY_TYPE", length = 16)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView(FireCheckInfo.Title.class)
    private Type type;

    @Column(name = "MEMO", length = 1024)
    @Size(max = 1024)
    private String memo;

    @Column(name = "OPINION")
    @JsonView(Details.class)
    private String opinion;

    @Column(name = "CORP_CODE", nullable = false)
    @JsonView(FireCheckInfo.Title.class)
    private long corp;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "check", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("time")
    @JsonView(Details.class)
    private List<Report> reports = new ArrayList<>(0);

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "check", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("id")
    @JsonIgnore
    private List<CheckFile> files = new ArrayList<>(0);

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "INFO", nullable = false)
    @JsonView(FireCheckInfo.Title.class)
    private FireCheckInfo info;


}
