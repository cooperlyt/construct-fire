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


@Entity
@Table(name = "FIRE_CHECK_USE_CHANGE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class UseChange {

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

    @Column(name = "USE_PROPERTY", length = 16)
    @Enumerated(EnumType.STRING)
    @JsonView(FireCheck.Details.class)
    private FireCheckInfo.UseProperty property;

    @Column(name = "OLD_USE", length = 16)
    @Size(max = 16)
    @JsonView(FireCheck.Details.class)
    private String oldUse;
}
