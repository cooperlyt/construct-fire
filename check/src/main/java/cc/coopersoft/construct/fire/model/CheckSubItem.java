package cc.coopersoft.construct.fire.model;


import cc.coopersoft.construct.fire.model.template.CheckContentTemplate;
import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "FIRE_CHECK_SUB_ITEM")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@Slf4j
public class CheckSubItem {

    public CheckSubItem(CheckItem item, SubItemTemplate template) {
        this.order = template.getOrder();
        this.name = template.getName();
        this.item = item;
        for(CheckContentTemplate content : template.getContents()){
            this.contents.add(new CheckContent(this,content));
        }
    }

    @Id
    @Column(name = "ID",nullable = false, unique = true)
    @JsonIgnore
    private Long id;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "NAME", nullable = false, length = 32)
    @Size(max = 32)
    @NotBlank
    private String name;

    @Column(name = "COUNT")
    private Integer count;

    @Column(name = "FULL", nullable = false)
    private boolean full;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ITEM_ID", nullable = false)
    @JsonBackReference
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private CheckItem item;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "item", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("order")
    private List<CheckContent> contents = new ArrayList<>(0);

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        if (id == null) return false;

        CheckSubItem that = (CheckSubItem) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : super.hashCode();
    }
}
