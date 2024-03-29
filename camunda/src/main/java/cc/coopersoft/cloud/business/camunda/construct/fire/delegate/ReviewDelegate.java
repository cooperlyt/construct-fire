package cc.coopersoft.cloud.business.camunda.construct.fire.delegate;

import cc.coopersoft.cloud.business.camunda.construct.fire.service.FireBusinessService;
import cc.coopersoft.common.construct.fire.business.Messages;
import org.springframework.stereotype.Component;

@Component
public class ReviewDelegate extends MessageNotifyDelegate {

    public ReviewDelegate(FireBusinessService fireBusinessService) {
        super(fireBusinessService);
    }

    @Override
    protected Messages.Type getType() {
        return Messages.Type.Review;
    }

}
