package cc.coopersoft.construct.fire.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@Order(1)
public class ResourceServerConfiguration extends ResourceServerConfigurerAdapter {

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/publish/**").permitAll()
                .antMatchers("/template/**").hasAuthority("FIRE_CONSTRUCT_CHECK")
                .antMatchers("/attach/**").hasAuthority("Trust")
                .antMatchers("/manager/**").hasAuthority("Master")
                .anyRequest().authenticated();
    }

}
