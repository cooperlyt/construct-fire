package cc.coopersoft.construct.fire.service;


import cc.coopersoft.common.tools.EntityOrderTools;
import cc.coopersoft.construct.fire.model.template.ItemTemplate;
import cc.coopersoft.construct.fire.model.template.SubItemTemplate;
import cc.coopersoft.construct.fire.model.template.TableTemplate;
import cc.coopersoft.construct.fire.repository.ItemTemplateRepository;
import cc.coopersoft.construct.fire.repository.SubItemTemplateRepository;
import cc.coopersoft.construct.fire.repository.TableTemplateRepository;
import com.github.wujun234.uid.UidGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

@Service
public class CheckTemplateService {

    private final TableTemplateRepository tableTemplateRepository;
    private final ItemTemplateRepository itemTemplateRepository;
    private final SubItemTemplateRepository subItemTemplateRepository;

    @Resource
    private UidGenerator defaultUidGenerator;

    @Autowired
    public CheckTemplateService(TableTemplateRepository tableTemplateRepository,
                                ItemTemplateRepository itemTemplateRepository,
                                SubItemTemplateRepository subItemTemplateRepository) {
        this.tableTemplateRepository = tableTemplateRepository;
        this.itemTemplateRepository = itemTemplateRepository;
        this.subItemTemplateRepository = subItemTemplateRepository;
    }

    public List<TableTemplate> template(){
        return tableTemplateRepository.findAllByOrderByOrder();
    }

    @Transactional
    public TableTemplate addTable(TableTemplate table){
        table.setId(defaultUidGenerator.getUID());
        table.setOrder(tableTemplateRepository.maxOrder() + EntityOrderTools.ORDER_STEP);
        return tableTemplateRepository.save(table);
    }

    @Transactional
    public TableTemplate editTableName(long id, String name){
        return tableTemplateRepository.findById(id).map((value) -> {value.setName(name); return tableTemplateRepository.save(value);}).
                orElseGet(() -> {throw new IllegalArgumentException("table template not found for :" + id);});
    }

    @Transactional
    public void deleteTable(long id){
        tableTemplateRepository.deleteById(id);
    }

    @Transactional
    public void orderTable(long id , Optional<Long> beforeId){

        EntityOrderTools.order(id,beforeId, new EntityOrderTools.Collator<TableTemplate, Long>() {
            @Override
            public Optional<TableTemplate> findById(Long id) {
                return tableTemplateRepository.findById(id);
            }

            @Override
            public Optional<TableTemplate> next(int order) {
                return tableTemplateRepository.findFirstByOrderGreaterThanOrderByOrder(order);
            }

            @Override
            public int minOrder(TableTemplate tableTemplate) {
                return tableTemplateRepository.minOrder();
            }

            @Override
            public List<TableTemplate> all(TableTemplate tableTemplate) {
                return tableTemplateRepository.findAllByOrderByOrder();
            }

            @Override
            public void save(Iterable<TableTemplate> entities) {
                tableTemplateRepository.saveAll(entities);
            }

            @Override
            public void save(TableTemplate entity) {
                tableTemplateRepository.save(entity);
            }
        });

    }


    @Transactional
    public ItemTemplate addItem(ItemTemplate item){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public ItemTemplate editItemName(long id, String name){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public void deleteItem(long id){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public void orderItem(long id, Optional<Long> beforeId){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public SubItemTemplate addSubItem(SubItemTemplate item){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public SubItemTemplate editSubItem(long id, SubItemTemplate subItem){
        throw new IllegalArgumentException("not implement");
    }

    @Transactional
    public void deleteSubItem(long id){
        throw new IllegalArgumentException("not implement");
    }


    @Transactional
    public void orderSubItem(long id ,Optional<Long> beforeId){
        throw new IllegalArgumentException("not implement");
    }

}
