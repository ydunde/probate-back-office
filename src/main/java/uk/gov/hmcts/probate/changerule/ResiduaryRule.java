package uk.gov.hmcts.probate.changerule;

import org.springframework.stereotype.Component;
import uk.gov.hmcts.probate.model.ccd.raw.request.CaseData;
import static uk.gov.hmcts.probate.model.Constants.NO;

@Component
public class ResiduaryRule implements ChangeRule {
    private static final String MESSAGE_KEY = "stopBodyResiduary";

    @Override
    public boolean isChangeNeeded(CaseData caseData) {
        return NO.equals(caseData.getSolsResiduary());
    }

    @Override
    public String getConfirmationBodyMessageKey() {
        return MESSAGE_KEY;
    }
}
