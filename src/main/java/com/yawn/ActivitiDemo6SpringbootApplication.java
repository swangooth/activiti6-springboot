package com.yawn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author yawn
 */
@SpringBootApplication
@EnableAutoConfiguration(exclude = {
		org.activiti.spring.boot.SecurityAutoConfiguration.class,
})
public class ActivitiDemo6SpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(ActivitiDemo6SpringbootApplication.class, args);
	}
}
