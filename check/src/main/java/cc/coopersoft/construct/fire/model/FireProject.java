package cc.coopersoft.construct.fire.model;

import cc.coopersoft.common.cloud.json.JsonRawDeserializer;
import cc.coopersoft.common.cloud.json.JsonRawSerialize;
import cc.coopersoft.common.construct.project.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "FIRE_PROJECT")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FireProject implements java.io.Serializable, ProjectCorpSummary {

    public static FireProject instance(FireCheckInfo check, Project.Default project){
        ProjectRegInfo projectInfo = project.getInfo();
        FireProject result = FireProject.builder()
                .id(check.getId())
                .corps(new HashSet<>())
                .check(check)
                .name(projectInfo.getName())
                .address(projectInfo.getAddress())
                .type(projectInfo.getType())
                .putMoney(projectInfo.getPutMoney())
                .property(projectInfo.getProperty())
                .modifyFit(projectInfo.getModifyFit())
                .modifyWarm(projectInfo.getModifyWarm())
                .modifyUse(projectInfo.getModifyUse())
                .importantType(projectInfo.getImportantType())
                .landArea((projectInfo.getLandArea())).build();
        ProjectCorpSummary.fillProjectCorpSummary(result,project.getCorps());

        for(JoinCorp<JoinCorpInfo> corp: project.getCorps()){
            result.getCorps().add(ProjectCorp.instance(result,corp));
        }

        return result;

    }

    public interface Title{}
    public interface Summary extends Title {}
    public interface Details extends Title {}

    public FireProject(long id) {
        this.id = id;
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ID", referencedColumnName = "ID")
    @MapsId
    @JsonIgnore
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;

    @Column(name = "NAME", nullable = false, length = 256)
    @JsonView(Title.class)
    private String name;

    @Column(name = "ADDRESS", length = 512)
    @JsonView(Title.class)
    private String address;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE", length = 19, nullable = false)
    @JsonView(Title.class)
    private ProjectRegInfo.Type type;

    @Column(name = "PUT_MONEY")
    @JsonView(Title.class)
    private BigDecimal putMoney;

    @Enumerated(EnumType.STRING)
    @Column(name = "PROPERTY", length = 6)
    @JsonView(Title.class)
    private ProjectRegInfo.Property property;

    @Column(name = "MODIFY_FIT")
    @JsonView(Title.class)
    private Boolean modifyFit;

    @Column(name = "MODIFY_WARM")
    @JsonView(Title.class)
    private Boolean modifyWarm;

    @Column(name = "MODIFY_USE")
    @JsonView(Title.class)
    private Boolean modifyUse;

    @Enumerated(EnumType.STRING)
    @Column(name = "MAIN_PROJECT_LEVEL", length = 8)
    @JsonView(Title.class)
    private ProjectRegInfo.ImportantType importantType;

    @Column(name = "ALL_AREA")
    @JsonView(Title.class)
    private BigDecimal landArea;

    @Column(name = "CORPS")
    @JsonDeserialize(using = JsonRawDeserializer.class)
    @JsonSerialize(using = JsonRawSerialize.class)
    @JsonView(Summary.class)
    private String corpSummary;


    @Basic(fetch = FetchType.LAZY)
    @Column(name = "TAGS", length = 1024)
    @JsonIgnore
    private String corpTags;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "id.project", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonView(Details.class)
    private Set<ProjectCorp> corps = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FireProject that = (FireProject) o;

        return id == that.id;
    }

    @Override
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
