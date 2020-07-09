package cc.coopersoft.construct.fire.service;

import cc.coopersoft.construct.fire.model.*;
import cc.coopersoft.construct.fire.repository.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

@Service
public class FireCheckBusiness {

    private final static  int PAGE_SIZE = 20;

    private final FireCheckRepository fireCheckRepository;

    private final CheckSubItemRepository checkSubItemRepository;

    private final CheckContentRepository checkContentRepository;

    private final CheckItemRepository checkItemRepository;


    public FireCheckBusiness(FireCheckRepository fireCheckRepository,
                             CheckSubItemRepository checkSubItemRepository,
                             CheckContentRepository checkContentRepository,
                             CheckItemRepository checkItemRepository) {
        this.fireCheckRepository = fireCheckRepository;
        this.checkSubItemRepository = checkSubItemRepository;
        this.checkContentRepository = checkContentRepository;
        this.checkItemRepository = checkItemRepository;
    }

    public List<Report> reports(long id){
       return fireCheckRepository.findById(id).orElseThrow().getReports();
    }

    public List<CheckTable> getCheckTable(long corp, long id){
        return fireCheckRepository.findByIdAndCorp(id, corp).orElseThrow().getInfo().getItems();
    }

    @Transactional
    public void setCheckCount(long id, int count){
        CheckSubItem subItem = checkSubItemRepository.findById(id).orElseThrow();
        if (count < 0){
            subItem.setFull(true);
        }else{
            subItem.setFull(false);
            subItem.setCount(count);
        }
        checkSubItemRepository.save(subItem);
    }

    @Transactional
    public void setCheckContentDescription(long id, String description){
        CheckContent content =  checkContentRepository.findById(id).orElseThrow();
        content.setDescription(description);
        checkContentRepository.save(content);
    }

    @Transactional
    public void setCheckContentPart(long id, String part){
        CheckContent content =  checkContentRepository.findById(id).orElseThrow();
        content.setParts(part);
        checkContentRepository.save(content);
    }

    @Transactional
    public void setCheckContentQualified(long itemId, long contentId, boolean qualified){
        CheckItem checkItem = checkItemRepository.findById(itemId).orElseThrow();
        boolean result = false;
        for(CheckSubItem subItem: checkItem.getItems() ){
            for(CheckContent content: subItem.getContents()){
                if (content.getId().equals(contentId)){
                    content.setQualified(qualified);
                }
                if (content.isQualified()){
                    result = true;
                }
            }
        }
        checkItem.setQualified(result);
        checkItemRepository.save(checkItem);
    }



    public List<FireCheck> search(long corp, Boolean my, String key, FireCheck.Status status){
        Specification<FireCheck> specification = (Specification<FireCheck>) (root, criteriaQuery, cb) -> {

            List<Predicate> predicates = new LinkedList<>();

            Fetch<FireCheck, FireCheckInfo> infoFetch = root.fetch("info",JoinType.LEFT);
            Join<FireCheck, FireCheckInfo> infoJoin = (Join<FireCheck, FireCheckInfo>) infoFetch;

            Fetch<FireCheckInfo,FireProject> projectFetch = infoJoin.fetch("project", JoinType.LEFT);
            Join<FireCheckInfo,FireProject> projectJoin = (Join<FireCheckInfo, FireProject>) projectFetch;

            if ((my != null) && my){
                predicates.add(cb.and(cb.equal(root.get("corp"),corp)));
            }else{
                Join<FireProject,ProjectCorp> corpJoin = root.join("info").join("project").join("corps", JoinType.LEFT);
                predicates.add(cb.and(cb.equal(corpJoin.get("id").get("code"),corp)));
            }


            if (status != null){
                predicates.add(cb.and(cb.equal(root.get("status"),status)));
            }

            if (key != null && StringUtils.isNotBlank(key)){
                List<Predicate> keyPredicate = new LinkedList<>();
                String _k = "%" + key + "%";
                keyPredicate.add(cb.equal(root.get("id").as(String.class),key));
                keyPredicate.add(cb.equal(infoJoin.get("projectCode").as(String.class), key));

                keyPredicate.add(cb.like(root.get("memo"),_k));
                keyPredicate.add(cb.like(infoJoin.get("applyFile"), _k));
                keyPredicate.add(cb.like(infoJoin.get("fireFile"), _k));
                keyPredicate.add(cb.like(infoJoin.get("constructFile"), _k));
                keyPredicate.add(cb.like(infoJoin.get("designFile"), _k));

                keyPredicate.add(cb.like(infoJoin.get("contracts"), _k));
                keyPredicate.add(cb.like(infoJoin.get("tel"), _k));
                keyPredicate.add(cb.like(infoJoin.get("conclusion"), _k));

                keyPredicate.add(cb.like(projectJoin.get("name"),_k));
                keyPredicate.add(cb.like(projectJoin.get("address"),_k));
                keyPredicate.add(cb.like(projectJoin.get("corpTags"),_k));
                predicates.add(cb.or(keyPredicate.toArray(new Predicate[0])));
            }
            criteriaQuery.distinct(true);

            return cb.and(predicates.toArray(new Predicate[0]));
        };
        return fireCheckRepository.findAll(specification, Sort.by(Sort.Direction.DESC,"applyTime"));
    }

    public Page<FireCheck> search(Optional<FireCheck.Status> status,
                                    Optional<Integer> page,
                                    Optional<String> key,
                                    Optional<String> sort,
                                    Optional<Sort.Direction> dir){
        Specification<FireCheck> specification = (Specification<FireCheck>) (root, criteriaQuery, cb) -> {
            boolean countQuery = criteriaQuery.getResultType().equals(Long.class);
            List<Predicate> predicates = new LinkedList<>();

            Join<FireCheck, FireCheckInfo> infoJoin;
            Join<FireCheckInfo, FireProject> projectJoin;
            if (countQuery){
                infoJoin = root.join("info", JoinType.LEFT);
                projectJoin = infoJoin.join("project", JoinType.LEFT);
            }else {
                Fetch<FireCheck, FireCheckInfo> infoFetch = root.fetch("info",JoinType.LEFT);
                infoJoin = (Join<FireCheck, FireCheckInfo>) infoFetch;
                Fetch<FireCheckInfo, FireProject> projectFetch = infoFetch.fetch("project", JoinType.LEFT);
                projectJoin = (Join<FireCheckInfo, FireProject>) projectFetch;
            }

            key.ifPresent(k -> {
                if (StringUtils.isNotBlank(k)){
                    List<Predicate> keyPredicate = new LinkedList<>();
                    String _k =  k + "%";
                    keyPredicate.add(cb.equal(root.get("id").as(String.class),k));
                    keyPredicate.add(cb.equal(infoJoin.get("projectCode").as(String.class), k));
                    keyPredicate.add(cb.equal(infoJoin.get("corp").as(String.class), k));

                    keyPredicate.add(cb.like(root.get("memo"),_k));

                    keyPredicate.add(cb.like(infoJoin.get("applyFile"), _k));
                    keyPredicate.add(cb.like(infoJoin.get("fireFile"), _k));
                    keyPredicate.add(cb.like(infoJoin.get("constructFile"), _k));
                    keyPredicate.add(cb.like(infoJoin.get("designFile"), _k));


                    keyPredicate.add(cb.like(infoJoin.get("contracts"), _k));
                    keyPredicate.add(cb.like(infoJoin.get("tel"), _k));
                    keyPredicate.add(cb.like(infoJoin.get("conclusion"), _k));

                    keyPredicate.add(cb.like(projectJoin.get("name"),_k));
                    keyPredicate.add(cb.like(projectJoin.get("address"),_k));
                    keyPredicate.add(cb.like(projectJoin.get("corpTags"),_k));
                    predicates.add(cb.or(keyPredicate.toArray(new Predicate[0])));
                }
            });


            status.ifPresentOrElse(s -> {
                predicates.add(cb.and(cb.equal(root.get("status"),s)));
            },() -> {
                predicates.add(cb.and(cb.notEqual(root.get("status"),FireCheck.Status.Prepare)));
            });

            return cb.and(predicates.toArray(new Predicate[0]));
        };

        Sort sortable = Sort.by(dir.orElse(Sort.Direction.DESC)
                , sort.orElse("regTime"));

        return fireCheckRepository.findAll(specification, PageRequest.of(page.orElse(0),PAGE_SIZE,sortable));
    }
}
