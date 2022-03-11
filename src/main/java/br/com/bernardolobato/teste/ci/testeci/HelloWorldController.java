package br.com.bernardolobato.teste.ci.testeci;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @ResponseBody
    @GetMapping("/hello-world")
    public String helloWorld() {
        return "Hello, World!!! - " + System.getenv("BUILD_ID");
    }
}
