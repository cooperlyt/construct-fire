package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubItemTemplateRepository extends CrudRepository<SubItemTemplate,Long> {

    @Query("SELECT coalesce(max(s.order), 0) FROM SubItemTemplate s")
    int maxOrder();

    @Query("SELECT coalesce(min(s.order), 0) FROM SubItemTemplate s")
    int minOrder();
}
