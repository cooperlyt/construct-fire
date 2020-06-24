package cc.coopersoft.construct.fire.model.template;

import cc.coopersoft.common.tools.EntityOrderTools;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "DFCT")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class TableTemplate implements EntityOrderTools.OrderEntity,java.io.Serializable{

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @Column(name = "NAME", nullable = false, length = 32)
    @Size(max = 32)
    @NotBlank
    private String name;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "PART", nullable = false)
    private boolean part;

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "table", orphanRemoval = true, cascade = CascadeType.ALL)
    @OrderBy("order")
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<ItemTemplate> items = new ArrayList<>(0);

}
