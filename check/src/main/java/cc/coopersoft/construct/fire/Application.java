package cc.coopersoft.construct.fire;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

@SpringCloudApplication
@EnableResourceServer
public class Application {
    public static void main(String[] args){
        SpringApplication.run(Application.class,args);
    }


}
