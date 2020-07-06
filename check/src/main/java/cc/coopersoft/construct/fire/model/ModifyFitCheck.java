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
import java.math.BigDecimal;

@Entity
@Table(name = "FIRE_CHECK_FIT")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class ModifyFitCheck implements java.io.Serializable{

    public enum PART{
        CELL, //顶棚
        WALL, //墙面
        FLOOR, //地面
        PARTITION, //隔断
        FIXED, //固定家具
        FABRIC, //装饰织物
        OTHER //其他
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
    @Column(name = "PART", nullable = false, length = 12)
    @NotNull
    @JsonView(FireCheck.Details.class)
    private PART part;

    @Column(name = "AREA")
    @JsonView(FireCheck.Details.class)
    @NotNull
    private BigDecimal area;

    @Column(name = "LAYERS", length = 16)
    @Size(max = 16)
    @NotBlank
    @JsonView(FireCheck.Details.class)
    private String layers;
}
