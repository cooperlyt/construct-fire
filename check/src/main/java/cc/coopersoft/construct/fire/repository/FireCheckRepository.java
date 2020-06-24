package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.FireCheck;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FireCheckRepository extends CrudRepository<FireCheck,Long>, JpaRepository<FireCheck,Long> , JpaSpecificationExecutor<FireCheck> {

    Optional<FireCheck> findByIdAndCorp(long id, long corp);

    Optional<FireCheck> findByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status status, long code);

    Optional<FireCheck> findByCorpAndStatusAndInfoProjectCode(long corp, FireCheck.Status status, long code);

    void deleteByCorpAndStatusAndId(long corp, FireCheck.Status status,long id);

    boolean existsByCorpAndStatusAndInfoProjectCode(long corp, FireCheck.Status status, long code);

    boolean existsByStatusAndInfoProjectCode(FireCheck.Status status, long code);

    boolean existsByInfoPartIsFalseAndStatusAndInfoProjectCode(FireCheck.Status status, long code);

    boolean existsByInfoPartIsTrueAndStatusAndInfoProjectCode(FireCheck.Status status, long code);

    boolean existsByInfoSpecialIsFalseAndInfoQualifiedIsFalseAndStatusAndInfoProjectCode(FireCheck.Status status, long code);

}
