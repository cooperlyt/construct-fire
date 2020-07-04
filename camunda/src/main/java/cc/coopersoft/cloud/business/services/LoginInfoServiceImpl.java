package cc.coopersoft.cloud.business.services;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

@Component
public class LoginInfoServiceImpl implements LoginInfoService {


    @Override
    public LoginInfo loginInfo() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof Jwt){
            Jwt jwt = (Jwt) principal;
            return LoginInfo.builder().id(jwt.getClaimAsString("preferred_username"))
                    .name(jwt.getClaimAsString("given_name") + jwt.getClaimAsString("family_name")).build();
        }
        throw new IllegalArgumentException("login user info not found!");

    }
}
