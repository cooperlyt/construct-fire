package cc.coopersoft.construct.fire.service;

import cc.coopersoft.common.construct.fire.business.Messages;
import cc.coopersoft.construct.fire.model.FireCheck;
import cc.coopersoft.construct.fire.repository.FireCheckRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;


@EnableBinding(Sink.class)
@Slf4j
public class BusinessMessageHandler {


    private final FireCheckRepository fireCheckRepository;
    private final ReportService reportService;

    public BusinessMessageHandler(FireCheckRepository fireCheckRepository, ReportService reportService) {
        this.fireCheckRepository = fireCheckRepository;
        this.reportService = reportService;
    }

    @StreamListener(Sink.INPUT)
    @Transactional
    public void handle(Messages messages){
        FireCheck check = fireCheckRepository.findById(messages.getId()).orElseThrow();

        switch (messages.getType()){
            case NoAccept:
                check.setStatus(FireCheck.Status.NoAccept);
                check.setRegTime(new Date());
            case Accept:
                reportService.applyResultReport(check);
                break;
            case Unqualified:
            case Qualified:
                check.setStatus(Messages.Type.Qualified.equals(messages.getType())? FireCheck.Status.Qualified : FireCheck.Status.Unqualified);
                check.setRegTime(new Date());
                reportService.viewResultReport(check);
                check.setOpinion(messages.getMemo());
                check.getInfo().setQualified(Messages.Type.Qualified.equals(messages.getType()));
                break;
            case Record:
                check.setStatus(FireCheck.Status.Qualified);
                check.getInfo().setQualified(true);
                check.setRegTime(new Date());
                break;
            case Review:
                //TODO review
                break;

        }

        fireCheckRepository.save(check);
    }
}
