package cc.coopersoft.cloud.business.camunda.security;


//@Configuration
//@Order(SecurityProperties.BASIC_AUTH_ORDER - 15) extends ResourceServerConfigurerAdapter
public class WebAppSecurityConfig  {

//    @Override
//    public void configure(HttpSecurity http) throws Exception {
//        http
//                .antMatcher("/app/**")
//                .authorizeRequests().anyRequest().authenticated()
//                .and()
//                .httpBasic();// this is just an example, use any auth mechanism you like
//
//    }
//
//    @Bean
//    public FilterRegistrationBean containerBasedAuthenticationFilter(){
//
//        FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
//        filterRegistration.setFilter(new ContainerBasedAuthenticationFilter());
//        filterRegistration.setInitParameters(Collections.singletonMap("authentication-provider", "cc.coopersoft.cloud.business.camunda.security.filter.webapp.SpringSecurityAuthenticationProvider"));
//        filterRegistration.setOrder(101); // make sure the filter is registered after the Spring Security Filter Chain
//        filterRegistration.addUrlPatterns("/app/*");
//        return filterRegistration;
//    }
}