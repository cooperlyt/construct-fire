package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.CheckContent;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CheckContentRepository extends CrudRepository<CheckContent, Long> {

}
