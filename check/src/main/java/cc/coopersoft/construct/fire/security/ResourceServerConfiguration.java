package cc.coopersoft.construct.fire.security;

import cc.coopersoft.common.cloud.keycloak.KeycloakAuthenticationConverter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class ResourceServerConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/publish/**").permitAll()
                .antMatchers("/attach/**").hasAuthority("SCOPE_Trust")
                .antMatchers("/manager/**").hasAuthority("SCOPE_Master")
                .anyRequest().authenticated()
                .and()
                .oauth2ResourceServer().jwt()
                .jwtAuthenticationConverter(new KeycloakAuthenticationConverter("master"));
    }

}
