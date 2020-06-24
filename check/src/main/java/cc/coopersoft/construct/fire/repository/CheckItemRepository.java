package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.CheckItem;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CheckItemRepository extends CrudRepository<CheckItem,Long> {
}
