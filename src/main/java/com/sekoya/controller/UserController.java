package com.sekoya.controller;

import com.sekoya.model.User;
import com.sekoya.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
@Controller
@RequestMapping("/")
public class UserController {


    @Autowired
    IUserService userService;




    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public String userList(Model model,HttpSession session){
        List<User> users = userService.userListService();


        model.addAttribute("userList",users);



        return "userList";

    }


    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(Model model,HttpSession session){
        String pass="e10adc3949ba59abbe56e057f20f883e";
        String username="aygun";
        User user = userService.getById(username,pass);
        session.setAttribute("curUser",user);





        return "userList";

    }



}
