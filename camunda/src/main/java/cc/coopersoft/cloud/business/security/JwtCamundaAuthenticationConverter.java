package cc.coopersoft.cloud.business.security;

import cc.coopersoft.common.cloud.keycloak.KeycloakAuthenticationConverter;
import lombok.extern.slf4j.Slf4j;
import org.camunda.bpm.engine.ProcessEngine;
import org.camunda.bpm.engine.rest.util.EngineUtil;
import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;

import java.util.Collection;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
public class JwtCamundaAuthenticationConverter extends KeycloakAuthenticationConverter {

    public JwtCamundaAuthenticationConverter() {
        super("master");
    }

    @Override
    public AbstractAuthenticationToken convert(Jwt jwt) {

        ProcessEngine engine = EngineUtil.lookupProcessEngine("default");

        String username = jwt.getClaimAsString("preferred_username");

        log.debug("add camund user name: " + username);

        Collection<GrantedAuthority> authorities = super.authenticationRoles(jwt);
        try {
            engine.getIdentityService().setAuthentication(username, authorities.stream()
                    .map(GrantedAuthority::getAuthority)
                    .map(res -> {
                        log.debug("add camunda role: " + res);
                        if (res.startsWith("ROLE_")) return res.substring(5);
                        else return res;

                    }) // Strip "ROLE_"
                    .collect(Collectors.toList()));
        } finally {
            engine.getIdentityService().clearAuthentication();
        }

        return new JwtAuthenticationToken(jwt, authorities);
    }
}
