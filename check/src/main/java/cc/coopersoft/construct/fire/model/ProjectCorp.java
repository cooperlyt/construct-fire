package cc.coopersoft.construct.fire.model;

import cc.coopersoft.common.construct.corp.CorpProperty;
import cc.coopersoft.common.data.GroupIdType;
import cc.coopersoft.common.data.PersonIdType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.*;

import javax.persistence.*;


@Entity
@Table(name = "FIRE_JOIN_CORP")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProjectCorp {

    @Embeddable
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    public static class JoinCorpPK implements java.io.Serializable{

        @Enumerated(EnumType.STRING)
        @Column(name = "CORP_TYPE", nullable = false, length = 16)
        private CorpProperty property;

        @Column(name = "CORP_CODE", nullable = false)
        private long code;

        @ManyToOne(fetch = FetchType.LAZY, optional = false)
        @JoinColumn(name = "PROJECT", nullable = false)
        @ToString.Exclude
        @EqualsAndHashCode.Exclude
        private FireProject project;


    }

    public static ProjectCorp instance(FireProject project, cc.coopersoft.common.construct.project.JoinCorp<? extends cc.coopersoft.common.construct.project.JoinCorpInfo> corp){
        return ProjectCorp.builder().id(JoinCorpPK.builder().project(project).code(corp.getCode()).property(corp.getProperty()).build())
                .level(corp.getInfo().getLevel())
                .name(corp.getInfo().getName())
                .groupId(corp.getInfo().getGroupId())
                .groupIdType(corp.getInfo().getGroupIdType())
                .contacts(corp.getContacts())
                .tel(corp.getTel())
                .contactsId(corp.getContactsId())
                .ownerId(corp.getInfo().getOwnerId())
                .ownerIdType(corp.getInfo().getOwnerIdType())
                .ownerName(corp.getInfo().getOwnerName()).build();

    }

    @EmbeddedId
    @JsonIgnore
    private JoinCorpPK id = new JoinCorpPK();

    @Transient
    @JsonView(FireProject.Details.class)
    public CorpProperty getProperty(){
        return id.getProperty();
    }

    @Transient
    @JsonView(FireProject.Details.class)
    public long getCode(){
        return id.getCode();
    }

    @Column(name = "LEVEL",nullable = false)
    @JsonView(FireProject.Details.class)
    private int level;

    @Column(name = "NAME", length = 128, nullable = false)
    @JsonView(FireProject.Details.class)
    private String name;

    @Enumerated(EnumType.STRING)
    @Column(name = "REG_ID_TYPE", length = 16, nullable = false)
    @JsonView(FireProject.Details.class)
    private GroupIdType groupIdType;

    @Column(name = "REG_ID_NUMBER", length = 32, nullable = false)
    @JsonView(FireProject.Details.class)
    private String groupId;

    @Column(name = "CONTACTS", length = 64)
    @JsonView(FireProject.Details.class)
    private String contacts;

    @Column(name = "CONTACTS_ID", length = 32)
    @JsonView(FireProject.Details.class)
    private String contactsId;

    @Column(name = "TEL", length = 16)
    @JsonView(FireProject.Details.class)
    private String tel;


    @Column(name ="OWNER_NAME", length = 32, nullable = false)
    @JsonView(FireProject.Details.class)
    private String ownerName;

    @Enumerated(EnumType.STRING)
    @Column(name ="OWNER_ID_TYPE", length = 16, nullable = false)
    @JsonView(FireProject.Details.class)
    private PersonIdType ownerIdType;

    @Column(name ="OWNER_ID_NUMBER", length = 32, nullable = false)
    @JsonView(FireProject.Details.class)
    private String ownerId;
}
