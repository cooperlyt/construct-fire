package cc.coopersoft.construct.fire.model;

import cc.coopersoft.construct.fire.model.template.CheckContentTemplate;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "FIRE_CHECK_CONTENT")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class CheckContent implements java.io.Serializable{

    public CheckContent(CheckSubItem item, CheckContentTemplate template){
        this.item = item;
        this.order = template.getOrder();
        this.name = template.getName();
        this.require = template.getRequire();
        this.level = template.getLevel();
    }


    @Id
    @Column(name = "ID",nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ITEM_ID", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    @JsonIgnore
    private CheckSubItem item;

    @Column(name = "_ORDER",nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "DESCRIPTION", length = 32)
    @Size(max = 32)
    private String description;

    @Column(name = "QUALIFIED", nullable = false)
    private boolean qualified;

    @Column(name = "NAME", length = 1024 )
    @Size(max = 1024)
    private String name;

    @Column(name = "_REQUIRE", length = 256)
    @Size(max = 256)
    private String require;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "LEVEL",nullable = false)
    @NotNull
    private CheckContentTemplate.ImportLevel level;

    @Column(name = "PARTS", length = 32)
    @Size(max = 32)
    private String parts;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CheckContent that = (CheckContent) o;

        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }
}
