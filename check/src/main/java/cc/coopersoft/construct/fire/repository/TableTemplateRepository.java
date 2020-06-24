package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.template.TableTemplate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TableTemplateRepository extends CrudRepository<TableTemplate,Long> {

    @Query("SELECT coalesce(max(t.order), 0) FROM TableTemplate t")
    int maxOrder();

    @Query("SELECT coalesce(min(t.order), 0) FROM TableTemplate t")
    int minOrder();

    List<TableTemplate> findAllByOrderByOrder();

    Optional<TableTemplate> findFirstByOrderGreaterThanOrderByOrder(int order);
}
