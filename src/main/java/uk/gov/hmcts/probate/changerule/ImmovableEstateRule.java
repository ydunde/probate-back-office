package uk.gov.hmcts.probate.changerule;

import org.springframework.stereotype.Component;
import uk.gov.hmcts.probate.model.ccd.raw.request.CaseData;

import static uk.gov.hmcts.probate.model.Constants.NO;

@Component
public class ImmovableEstateRule implements ChangeRule {

    private static final String MESSAGE_KEY = "stopBodyNotImmovableEstate";

    @Override
    public boolean isChangeNeeded(CaseData caseData) {
        return NO.equals(caseData.getImmovableEstate());
    }

    @Override
    public String getConfirmationBodyMessageKey() {
        return MESSAGE_KEY;
    }
}
