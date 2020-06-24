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
@Table(name = "DFCI")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class SubItemTemplate implements EntityOrderTools.OrderEntity,java.io.Serializable{



    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @Column(name = "NAME", nullable = false , length = 32)
    @Size(max = 32)
    @NotBlank
    private String name;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @ManyToOne(fetch = FetchType.LAZY, optional = false )
    @JoinColumn(name = "ITEM_ID", nullable = false)
    @JsonIgnore
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private ItemTemplate item;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "item" ,cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<CheckContentTemplate> contents = new ArrayList<>(0);
}
