package cc.coopersoft.construct.fire.model;

import com.fasterxml.jackson.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "FIRE_CHECK_BUILD")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class BuildCheck extends BuildCheckOpinion implements java.io.Serializable{


    public enum DangerLevel{
        甲, //轻危险级
        乙, //中危险级
        丙, //严重危险级
        丁, //仓库危险级
        戊
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @Column(name = "FIRE_RATING", nullable = false)
    @JsonView(FireCheck.Details.class)
    private int rating;

    @Column(name = "DANGER", nullable = false)
    @JsonView(FireCheck.Details.class)
    private int danger;

    @OneToOne(fetch = FetchType.LAZY, mappedBy = "check", cascade = CascadeType.ALL,orphanRemoval = true, optional = false)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @JsonView(FireCheck.Details.class)
    private ProjectBuildInfo info;

    @ManyToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "FIRE_CHECK", nullable = false)
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;


}
