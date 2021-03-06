package uk.gov.hmcts.probate.changerule;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import uk.gov.hmcts.probate.model.ccd.raw.request.CaseData;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

public class MinorityInterestRuleTest {

    @InjectMocks
    private MinorityInterestRule underTest;

    @Mock
    private CaseData caseDataMock;

    @Before
    public void setup() {
        initMocks(this);
    }

    @Test
    public void shouldNeedChange() {
        when(caseDataMock.getSolsMinorityInterest()).thenReturn("Yes");

        assertTrue(underTest.isChangeNeeded(caseDataMock));
    }

    @Test
    public void shouldNotNeedChange() {
        when(caseDataMock.getSolsMinorityInterest()).thenReturn("No");

        assertFalse(underTest.isChangeNeeded(caseDataMock));
    }

    @Test
    public void shouldGetBodyMessageKey() {
        assertEquals("stopBodyMinorityInterest", underTest.getConfirmationBodyMessageKey());
    }
}
