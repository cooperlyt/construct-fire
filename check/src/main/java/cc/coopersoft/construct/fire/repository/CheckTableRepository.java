package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.CheckTable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CheckTableRepository extends CrudRepository<CheckTable, Long> {

    List<CheckTable> findByCheckId(long id);

    List<CheckTable> findByCheckIdOrderByOrder(long checkId);
}
