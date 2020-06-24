package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.CheckSubItem;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CheckSubItemRepository extends CrudRepository<CheckSubItem,Long> {

}
