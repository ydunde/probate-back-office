package uk.gov.hmcts.probate.config;

import feign.Feign;
import feign.jackson.JacksonEncoder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.openfeign.support.SpringMvcContract;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import uk.gov.hmcts.reform.authorisation.ServiceAuthorisationApi;
// import uk.gov.hmcts.reform.authorisation.generators.ServiceAuthTokenGenerator;
import uk.gov.hmcts.reform.authorisation.generators.AuthTokenGeneratorFactory;
import uk.gov.hmcts.reform.authorisation.generators.AuthTokenGenerator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class ServiceTokenGeneratorConfiguration {
    @Bean
    public AuthTokenGenerator authTokenGenerator (
            ServiceAuthorisationApi serviceAuthorisationApi,
            @Value("${auth.provider.service.client.key}") String secret,
            @Value("${auth.provider.service.client.microservice}") String microservice) {

        // log.info("s2sUrl: {}", s2sUrl);
        log.info("auth.provider.service.client.key: {}", secret);
        log.info("${auth.provider.service.client.microservice}: {}", microservice);
        return AuthTokenGeneratorFactory.createDefaultGenerator(secret, microservice, serviceAuthorisationApi);
    }
}