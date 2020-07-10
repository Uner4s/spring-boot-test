package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AppdemoApplication {

	public static void main(final String[] args) {
		SpringApplication.run(AppdemoApplication.class, args);
	}

	@GetMapping("/")
	public String main(@RequestParam(value = "name", defaultValue = "World new try 2") final String name) {
		return String.format("Hello %s!", name);
	}

	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", defaultValue = "World asdasd") final String name) {
		return String.format("Hello %s!", name);
	}
}