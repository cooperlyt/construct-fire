package cc.coopersoft.construct.fire.model;

import cc.coopersoft.construct.fire.model.template.ItemTemplate;
import cc.coopersoft.construct.fire.model.template.TableTemplate;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
@Table(name = "FIRE_CHECK_TABLE")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class CheckTable {

    public CheckTable(FireCheckInfo check, TableTemplate template) {
        this.check = check;
        this.part = template.isPart();
        this.name = template.getName();
        this.order = template.getOrder();
        for(ItemTemplate item: template.getItems()){
            this.items.add(new CheckItem(this,item));
        }
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonIgnore
    private Long id;

    @Column(name = "NAME",length = 32, nullable = false)
    @Size(max = 32)
    @NotBlank
    private String name;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "PART", nullable = false)
    private boolean part;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CHECK_ID", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private FireCheckInfo check;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "table", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    @JsonManagedReference
    private List<CheckItem> items = new ArrayList<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CheckTable that = (CheckTable) o;

        return id != null && id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : super.hashCode();
    }
}
