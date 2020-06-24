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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Entity
@Table(name = "FIRE_CHECK_STORE_TIN")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class StoreTinCheck implements java.io.Serializable{

    public enum Type{
        OUTSIDE, // 浮顶罐 - 外
        INSIDE, // 浮顶罐 - 内
        FIX, // 固定顶罐
        HORIZONTAL, // 卧式罐
        WATER, // 球形罐 - 液体
        GAS, //球形罐 - 气体
        DRY, // 可燃气体储罐 - 干式
        WET, // 可燃气体储罐 - 湿式
        OTHER // 其它
    }

    public enum Layout{
        ON, //地上
        HALF, //半地下
        UNDER //地下
    }

    @Id
    @Column(name = "ID", nullable = false, unique = false)
    @JsonIgnore
    private long id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ID", referencedColumnName = "ID")
    @MapsId
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;

    @Column(name = "LOCATION", length = 64)
    @Size(max = 64)
    @JsonView(FireCheck.Details.class)
    private String location;

    @Column(name = "AREA")
    @JsonView(FireCheck.Details.class)
    private BigDecimal area;

    @Enumerated(EnumType.STRING)
    @Column(name = "TYPE", nullable = false, length = 10)
    @NotNull
    @JsonView(FireCheck.Details.class)
    private Type type;

    @Enumerated(EnumType.STRING)
    @Column(name = "STORE_TYPE", nullable = false, length = 6)
    @NotNull
    @JsonView(FireCheck.Details.class)
    private Layout layout;

    @Column(name = "NAME", length = 32)
    @Size(max = 32)
    @JsonView(FireCheck.Details.class)
    private String name;

}
