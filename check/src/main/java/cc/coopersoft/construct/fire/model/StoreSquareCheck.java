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
import javax.validation.constraints.Size;
import java.math.BigDecimal;

@Entity
@Table(name = "FIRE_CHECK_STORE_SQUARE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class StoreSquareCheck implements java.io.Serializable {

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private long id;

    @Column(name = "AREA")
    @JsonView(FireCheck.Details.class)
    private BigDecimal area;

    @Column(name = "NAME", length = 32)
    @Size(max = 32)
    @JsonView(FireCheck.Details.class)
    private String name;

    @OneToOne(fetch = FetchType.LAZY,optional = false)
    @JoinColumn(name = "ID", referencedColumnName = "ID")
    @MapsId
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;
}
