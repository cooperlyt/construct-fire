package cc.coopersoft.cloud.business.security;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class BusinessSecurityConfig extends WebSecurityConfigurerAdapter {


    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/master/**").hasAuthority("SCOPE_Master")
                .antMatchers("/trust/**").hasAuthority("SCOPE_Trust")
                .antMatchers("/manager/**").hasRole("DATA.MGR")
                //.antMatchers("/publish/**", "/app/**", "/lib/**", "/api/**").permitAll()
                .anyRequest().permitAll()
                .and()
                .oauth2ResourceServer().jwt()
                .jwtAuthenticationConverter(new JwtCamundaAuthenticationConverter());

    }

//    @Bean
//    public FilterRegistrationBean statelessUserAuthenticationFilter(){
//        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
//        filterRegistration.setFilter(new StatelessUserAuthenticationFilter());
//        filterRegistration.setOrder(102); // make sure the filter is registered after the Spring Security Filter Chain
//        filterRegistration.addUrlPatterns("/rest/*","/adapter/*");
//        return filterRegistration;
//    }
}
