package cc.coopersoft.cloud.business.services;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

@Component
public class LoginInfoServiceImpl implements LoginInfoService {


    private final String masterClientName="master";

    @Override
    public LoginInfo loginInfo() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof Jwt){
            Jwt jwt = (Jwt) principal;
            return LoginInfo.builder().id(jwt.getClaimAsString("sub"))
                    .name(getName(jwt)).build();
        }
        throw new IllegalArgumentException("login user info not found!");

    }

    private  String getName(Jwt jwt){
        String azp = jwt.getClaimAsString("azp");
        if (azp != null && azp.trim().equals(masterClientName)){
            return jwt.getClaimAsString("given_name") + jwt.getClaimAsString("family_name");
        }else{
            return null;
        }
    }
}
