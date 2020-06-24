package cc.coopersoft.construct.fire.model.template;


import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "DFCL")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
public class CheckContentTemplate implements java.io.Serializable{

    public enum ImportLevel{
        A,//A(关键项目)
        B,//B(主要项目)
        C, //C(一般项目)
        D
    }

    @Id
    @Column(name = "ID", nullable = false, unique = true)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Long id;

    @Column(name = "_ORDER", nullable = false)
    @JsonIgnore
    private int order;

    @Column(name = "NAME", length = 1024, nullable = false)
    @Size(max = 1024)
    @NotBlank
    private String name;

    @Column(name = "_REQUIRE", length = 1024)
    @Size(max = 1024)
    private String require;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "LEVEL",nullable = false)
    @NotNull
    private ImportLevel level;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "PARENT", nullable = false)
    @JsonIgnore
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private SubItemTemplate item;


}
