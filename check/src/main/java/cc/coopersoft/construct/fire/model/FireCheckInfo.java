package cc.coopersoft.construct.fire.model;

import cc.coopersoft.common.construct.corp.CorpProperty;
import com.fasterxml.jackson.annotation.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "FIRE_CHECK_INFO")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class FireCheckInfo {

    public enum UseProperty{
        FULL, //人员密集场所
        PUB, //公众聚集场所
        DAN //易燃易爆场所
    }


    public interface Title {}


    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView(Title.class)
    private Long id;

    @Column(name = "SPECIAL", nullable = false)
    @JsonView(Title.class)
    private boolean special;

    @Column(name = "PROJECT_CODE", nullable = false)
    @JsonView(Title.class)
    private long projectCode;

    @Column(name = "CONTACTS", length = 64)
    @JsonView(Title.class)
    @Size(max = 64)
    private String contracts;

    @Column(name = "TEL", length = 16)
    @JsonView(Title.class)
    private String tel;

    @Column(name = "IN_RANDOM", nullable = false)
    @JsonView({Title.class, FireCheck.CreateResult.class})
    private boolean inRandom;

    @Column(name = "QUALIFIED", nullable = false)
    @JsonIgnore
    private boolean qualified;

    @Column(name = "CONSTRUCTION_FILE", length = 32)
    @Size(max = 32)
    @JsonView(Title.class)
    private String constructFile;

    @Temporal(TemporalType.DATE)
    @Column(name = "CON_FILE_DATE")
    @JsonView(Title.class)
    private Date constructFileDate;

    @Column(name = "DESIGN_FILE", length = 32)
    @JsonView(Title.class)
    private String designFile;

    @Temporal(TemporalType.DATE)
    @Column(name = "DESIGN_FILE_DATE")
    @JsonView(Title.class)
    private Date designFileDate;

    @Column(name = "USE_PROPERTY", length = 16)
    @Enumerated(EnumType.STRING)
    @JsonView(Title.class)
    private UseProperty property;

    @Column(name = "PART", nullable = false)
    @JsonView(Title.class)
    private boolean part;

    @Column(name = "CONCLUSION", length = 1024)
    @Size(max = 1024)
    @JsonView(Title.class)
    private String conclusion;

    @Column(name = "OLD_USE", length = 16)
    @Size(max = 16)
    @JsonView(Title.class)
    private String oldUse;

    @OneToOne(fetch = FetchType.LAZY, optional = false, mappedBy = "check", orphanRemoval = true, cascade = CascadeType.ALL)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView(Title.class)
    private FireProject project;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "check" , orphanRemoval = true, cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonView(FireCheck.Details.class)
    private StoreSquareCheck square;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "check", orphanRemoval = true, cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonView(FireCheck.Details.class)
    private StoreTinCheck tin;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "check", orphanRemoval = true, cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonView(FireCheck.Details.class)
    private ModifyFitCheck fit;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "check", orphanRemoval = true, cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonView(FireCheck.Details.class)
    private ModifyWarmCheck warm;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "check", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    private List<CheckTable> items = new ArrayList<>(0);

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "check", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("id")
    @JsonManagedReference
    @JsonView(FireCheck.Details.class)
    private List<BuildCheck> builds = new ArrayList<>(0);

}
