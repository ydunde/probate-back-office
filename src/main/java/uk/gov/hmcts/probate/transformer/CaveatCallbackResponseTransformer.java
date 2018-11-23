package uk.gov.hmcts.probate.transformer;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import uk.gov.hmcts.probate.model.ccd.caveat.request.CaveatCallbackRequest;
import uk.gov.hmcts.probate.model.ccd.caveat.request.CaveatData;
import uk.gov.hmcts.probate.model.ccd.caveat.request.CaveatDetails;
import uk.gov.hmcts.probate.model.ccd.caveat.response.CaveatCallbackResponse;
import uk.gov.hmcts.probate.model.ccd.caveat.response.ResponseCaveatData;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import static uk.gov.hmcts.probate.model.Constants.CAVEAT_LIFESPAN;

@Component
@RequiredArgsConstructor
public class CaveatCallbackResponseTransformer {

    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public CaveatCallbackResponse caveatRaised(CaveatCallbackRequest caveatCallbackRequest) {
        CaveatDetails caveatDetails = caveatCallbackRequest.getCaveatDetails();

        ResponseCaveatData responseCaveatData = getResponseCaveatData(caveatDetails)
                .cavExpiryDate(dateTimeFormatter.format(LocalDate.now().plusMonths(CAVEAT_LIFESPAN)))
                .build();

        return transformResponse(responseCaveatData);
    }

    public CaveatCallbackResponse transform(CaveatCallbackRequest callbackRequest) {
        ResponseCaveatData responseCaveatData = getResponseCaveatData(callbackRequest.getCaveatDetails())
                .build();

        return transformResponse(responseCaveatData);
    }

    private CaveatCallbackResponse transformResponse(ResponseCaveatData responseCaveatData) {
        return CaveatCallbackResponse.builder().caveatData(responseCaveatData).build();
    }

    private ResponseCaveatData.ResponseCaveatDataBuilder getResponseCaveatData(CaveatDetails caveatDetails) {
        CaveatData caveatData = caveatDetails.getCaveatData();

        return ResponseCaveatData.builder()

                .cavDeceasedForenames(caveatData.getCavDeceasedForenames())
                .cavDeceasedSurname(caveatData.getCavDeceasedSurname())
                .cavDeceasedDateOfDeath(dateTimeFormatter.format(caveatData.getCavDeceasedDateOfDeath()))
                .cavDeceasedDateOfBirth(dateTimeFormatter.format(caveatData.getCavDeceasedDateOfBirth()))
                .cavDeceasedAnyOtherNames(caveatData.getCavDeceasedAnyOtherNames())
                .cavDeceasedFullAliasNameList(caveatData.getCavDeceasedFullAliasNameList())
                .cavDeceasedAddress(caveatData.getCavDeceasedAddress())

                .cavCaveatorForenames(caveatData.getCavCaveatorForenames())
                .cavCaveatorSurname(caveatData.getCavCaveatorSurname())
                .cavCaveatorEmailAddress(caveatData.getCavCaveatorEmailAddress())
                .cavCaveatorAddress(caveatData.getCavCaveatorAddress())

                .cavMessageContent(caveatData.getCavMessageContent())

                .cavDocumentsUploaded(caveatData.getCavDocumentsUploaded())
                .cavDocumentsGenerated(caveatData.getCavDocumentsGenerated());
    }
}
