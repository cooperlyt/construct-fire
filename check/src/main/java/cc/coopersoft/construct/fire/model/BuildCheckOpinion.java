package cc.coopersoft.construct.fire.model;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
@Data
@NoArgsConstructor
public class BuildCheckOpinion {

    @Column(name = "BUILD_CODE", nullable = false)
    @JsonView(FireCheck.Details.class)
    private long code;


    @Column(name = "OPINION")
    @JsonView(FireCheck.Details.class)
    private String opinion;

    @Column(name = "PASS")
    @JsonView(FireCheck.Details.class)
    private Boolean pass;

}
