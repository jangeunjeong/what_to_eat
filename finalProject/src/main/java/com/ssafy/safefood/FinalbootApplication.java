package com.ssafy.safefood;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages="com.ssafy.safefood.mappers")
public class FinalbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalbootApplication.class, args);
	}

}
