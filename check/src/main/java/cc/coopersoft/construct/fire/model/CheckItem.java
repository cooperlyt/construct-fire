package cc.coopersoft.construct.fire.model;

import cc.coopersoft.construct.fire.model.template.ItemTemplate;
import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import com.fasterxml.jackson.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "FIRE_CHECK_ITEM")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class CheckItem {

    public CheckItem(CheckTable table, ItemTemplate template) {
        this.name = template.getName();
        this.order = template.getOrder();
        this.table = table;
        for(SubItemTemplate sub: template.getSubItems()){
            this.items.add(new CheckSubItem(this,sub));
        }
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @Column(name = "NAME", length = 32, nullable = false)
    @NotBlank
    private String name;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "QUALIFIED", nullable = false)
    private boolean qualified;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "TABLE_ID", nullable = false)
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private CheckTable table;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "item", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    @JsonManagedReference
    private List<CheckSubItem> items = new ArrayList<>(0);

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CheckItem checkItem = (CheckItem) o;

        return id != null && id.equals(checkItem.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : super.hashCode();
    }
}
