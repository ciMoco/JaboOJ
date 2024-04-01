package com.ynjabo77.jaboojbackquestionservice;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication()
@MapperScan("com.ynjabo77.jaboojbackquestionservice.mapper")
@EnableScheduling
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@ComponentScan("com.ynjabo77")
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"com.ynjabo77.jaboojbackserviceclient.service"})
public class JaboojBackQuestionServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(JaboojBackQuestionServiceApplication.class, args);
    }

}
