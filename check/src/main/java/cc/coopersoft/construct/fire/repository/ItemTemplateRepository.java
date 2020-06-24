package cc.coopersoft.construct.fire.repository;

import cc.coopersoft.construct.fire.model.template.ItemTemplate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ItemTemplateRepository extends CrudRepository<ItemTemplate,Long> {

    @Query("SELECT coalesce(max(i.order), 0) FROM ItemTemplate i")
    int maxOrder();

    @Query("SELECT coalesce(min(i.order), 0) FROM ItemTemplate i")
    int minOrder();
}
