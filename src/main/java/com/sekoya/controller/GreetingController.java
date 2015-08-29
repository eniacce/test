package com.sekoya.controller;

import com.sekoya.jsonResponse.HelloMessage;
import com.sekoya.model.Student;
import com.sekoya.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * Created by sekoya1 on 28.08.2015.
 */
@Controller
public class GreetingController {

    @Autowired
    IStudentService studentService;

    //onyuzden baglanicalak adres
    @MessageMapping("/hello")
    @SendTo("/topic/greeting")
    public HelloMessage greeting() throws Exception {
        Thread.sleep(3000); // simulated delay
        List<Student> students = studentService.studentListService();
        HelloMessage msg = new HelloMessage();
        msg.setName(students);
        return msg;
    }

}