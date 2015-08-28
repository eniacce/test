package com.sekoya.controller;

import com.sekoya.jsonResponse.StudentResponse;
import com.sekoya.model.Student;
import com.sekoya.service.IStudentService;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.TriggerKey;
import org.quartz.impl.triggers.CronTriggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
@Controller
@Scope("request")
@RequestMapping(value = "/student")
public class StudentController  {




    @Autowired
    private SimpMessagingTemplate template;

    private TaskScheduler scheduler;

    private List<Student> students = new ArrayList<Student>();






    @Autowired
    IStudentService studentService;

    public void updatePriceAndBroadcast(){
        System.out.println("Update from backend");
        for (Student student : students) {
            student.setName("ahmet");
            student.setSurname("korler");
            student.setUrl("localhost");
        }
        template.convertAndSend("/topic/price", students);
    }


    @PostConstruct
    private void broadcastTimePeriodically() {
        scheduler.scheduleAtFixedRate(new Runnable() {

            public void run() {
                updatePriceAndBroadcast();
            }
        }, 1000);
    }


    @MessageMapping("/addStock")
    public void addStudent(Student student) throws Exception {
        students.add(student);
        updatePriceAndBroadcast();
    }


    @RequestMapping(value = "/listing", method = RequestMethod.GET)
    public String listingStudent(Model model, HttpSession session) {
        int i = studentService.countService();
        System.out.println(i);
        session.setAttribute("test", 12);
        System.out.println("Konu");
        List<Student> students = studentService.studentListService();


        model.addAttribute("liste", students);
        return "sorun";
    }


    @RequestMapping(value = "/createStudent", method = RequestMethod.GET)
    public String createStudent(Model model, HttpSession session) {


        return "studentSave";
    }


    @RequestMapping(value = "/createStudentSave", headers = "Accept=*/*", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    String createStudentSave(HttpSession session, @RequestBody String name,@RequestBody String surname) {


        System.out.println("Test");
        return "test";


    }


    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    StudentResponse createRecord(Model model) {
        StudentResponse response = new StudentResponse();


        response.setData(studentService.studentListService());
        response.setStatus("OK");
        return response;

    }


    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public
    @ResponseBody
    String updateRecord(Model model, HttpSession httpSession) {

        int id = 2;
        Student student = studentService.updateStudent(2);
        return "Test";

    }







}
