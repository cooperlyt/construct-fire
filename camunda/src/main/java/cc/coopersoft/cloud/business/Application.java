package cc.coopersoft.cloud.business;

import org.camunda.bpm.spring.boot.starter.annotation.EnableProcessApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;


@SpringCloudApplication
@EnableProcessApplication
public class Application {
    public static void main(String... args){
        SpringApplication.run(Application.class, args);
    }
}
