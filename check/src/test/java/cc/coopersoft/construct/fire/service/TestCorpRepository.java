package cc.coopersoft.construct.fire.service;

import cc.coopersoft.construct.fire.model.ProjectCorp;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TestCorpRepository extends CrudRepository<ProjectCorp,ProjectCorp.JoinCorpPK> {

    Optional<ProjectCorp> findByIdCodeAndIdProjectId(long code, long id);


}
