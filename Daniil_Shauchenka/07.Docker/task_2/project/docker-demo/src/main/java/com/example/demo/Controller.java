package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/api")
public class Controller {
    @GetMapping("/demo")
    public Response demo(){
        return new Response("this is demo");
    }
}
