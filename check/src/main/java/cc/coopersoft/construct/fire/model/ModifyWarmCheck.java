package cc.coopersoft.construct.fire.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "FIRE_CHECK_WARM")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class ModifyWarmCheck implements java.io.Serializable{

    public enum Type{
        A,
        B1,
        B2
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ID", referencedColumnName = "ID")
    @MapsId
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE", nullable = false, length = 2)
    @JsonView(FireCheck.Details.class)
    @NotNull
    private Type type;

    @Column(name = "LAYERS", length = 16)
    @Size(max = 16)
    @NotBlank
    @JsonView(FireCheck.Details.class)
    private String layers;

    @Column(name = "PART", length = 32)
    @Size(max = 32)
    @NotBlank
    @JsonView(FireCheck.Details.class)
    private String part;


    @Column(name = "MATERIAL", length = 32)
    @Size(max = 32)
    @NotBlank
    @JsonView(FireCheck.Details.class)
    private String material;

}
