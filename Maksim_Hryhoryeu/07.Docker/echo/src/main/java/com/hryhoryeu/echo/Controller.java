package com.hryhoryeu.echo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/echo/{msg}")
    public String getMsg(@PathVariable String msg) {
        return msg;
    }
}
