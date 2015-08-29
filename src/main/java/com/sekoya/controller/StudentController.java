package com.sekoya.controller;

import com.sekoya.jsonResponse.HelloMessage;
import com.sekoya.jsonResponse.StudentResponse;
import com.sekoya.model.Student;
import com.sekoya.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
@Controller
@Scope("request")
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    IStudentService studentService;
    GreetingController greetingController = new GreetingController();


    @RequestMapping(value = "/listing", method = RequestMethod.GET)

    public String listingStudent(Model model, HttpSession session) {
        int i = studentService.countService();
        System.out.println(i);
        session.setAttribute("test", 12);
        System.out.println("Konu");
        List<Student> students = studentService.studentListService();


        model.addAttribute("liste", students);
        return "liste";
    }


    @RequestMapping(value = "/createStudent", method = RequestMethod.GET)
    public
    @ResponseBody
    void createStudent(Model model, HttpSession session, @RequestBody String name) {

        HelloMessage greeting = new HelloMessage();
        Student student = new Student();
        student.setName("mahmut");
        student.setSurname("Odabasi");
        student.setUrl("urlgelecek");
        studentService.saveService(student);
        if (student.isCreatedControl()) {
            try {
                greeting = greetingController.greeting();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("sonuc");
        }
    }


    @RequestMapping(value = "/createStudentSave", headers = "Accept=*/*", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public
    @ResponseBody
    String createStudentSave(HttpSession session, @RequestBody String name, @RequestBody String surname) {


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
    public String updateRecord(Model model, HttpSession httpSession) {
        HelloMessage greeting = new HelloMessage();
        int id = 2;
        Student student = studentService.updateStudent(2);
        if (student.isUpdateControl()) {
            try {
                greeting = greetingController.greeting();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("sonuc");
        }
        return "index";

    }


}
