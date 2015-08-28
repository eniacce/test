package com.sekoya.scheduled.task;

import com.sekoya.dao.IStudentDAO;
import com.sekoya.service.IStudentService;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;

/**
 * Created by sekoya1 on 28.08.2015.
 */
public class Timeless implements JobListener {

    @Autowired
    IStudentService studentService;


    public void printCurrentTime() {
        int count = studentService.countService();
        System.out.println(count);
        // printing current system time
        System.out
                .println("Current Time : " + Calendar.getInstance().getTime());
        int count1=studentService.countService();
        if(count!=count1){
            System.out.println("dbDegisti");
        }
    }

    public String getName() {
        return null;
    }

    public void jobToBeExecuted(JobExecutionContext jobExecutionContext) {
        String s = jobExecutionContext.getJobInstance().toString();
        System.out.println(s);

    }

    public void jobExecutionVetoed(JobExecutionContext jobExecutionContext) {

    }

    public void jobWasExecuted(JobExecutionContext jobExecutionContext, JobExecutionException e) {

    }
}
