package cc.coopersoft.construct.fire.model;

import cc.coopersoft.common.construct.project.BuildInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "FIRE_PROJECT_BUILD")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProjectBuildInfo implements java.io.Serializable{

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @Column(name = "NAME", length = 32, nullable = false)
    @JsonView(FireCheck.Details.class)
    private String name;

    @Column(name = "ALL_AREA")
    @JsonView(FireCheck.Details.class)
    private BigDecimal landArea;

    @Enumerated(EnumType.STRING)
    @Column(name = "STRUCTURE", length = 16)
    @JsonView(FireCheck.Details.class)
    private BuildInfo.Struct structure;


    @Column(name = "GROUND_FLOOR_COUNT")
    @JsonView(FireCheck.Details.class)
    private Integer onCount;

    @Column(name = "UNDER_FLOOR_COUNT")
    @JsonView(FireCheck.Details.class)
    private Integer underCount;

    @Column(name = "HEIGHT")
    @JsonView(FireCheck.Details.class)
    private BigDecimal height;

    @Column(name = "_LENGTH")
    @JsonView(FireCheck.Details.class)
    private BigDecimal length;


    @Column(name = "GROUND_AREA")
    @JsonView(FireCheck.Details.class)
    private BigDecimal onArea;

    @Column(name = "UNDER_AREA")
    @JsonView(FireCheck.Details.class)
    private BigDecimal underArea;


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ID",columnDefinition = "ID")
    @MapsId
    @JsonIgnore
    private BuildCheck check;


}
