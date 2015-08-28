package com.sekoya.aops;

import com.sekoya.model.Student;
import com.sekoya.service.IStudentService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
@Aspect
public class InsertListener {

    @Autowired
    IStudentService studentService;


    @Before("execution(* com.sekoya.dao.StudentDaoImpl.studentList(..))")
    public void logBeforeV1(JoinPoint joinPoint)
    {

        System.out.println("dao : " + joinPoint.getSignature().getName());

    }



    @Before("execution(* com.sekoya.service.IStudentService.studentListService(..))")
    public void logBeforeV2(JoinPoint joinPoint)
    {
        System.out.println("service : " + joinPoint.getSignature().getName());
    }



    @After("execution(* com.sekoya.service.IStudentService.studentListService(..))")
    public void logAfterV2(JoinPoint joinPoint)
    {

        System.out.println("After Service: " + joinPoint.getSignature().getName());
    }

    @After("execution(* com.sekoya.dao.IStudentDAO.studentList(..))")
    public void logAfterV21(JoinPoint joinPoint)
    {

        System.out.println("After dao: " + joinPoint.getSignature().getName());
    }
}
