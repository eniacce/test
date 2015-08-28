package com.sekoya.service;

import com.sekoya.dao.IStudentDAO;
import com.sekoya.dao.StudentDaoImpl;
import com.sekoya.model.Student;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
public class StudentServiceImpl implements IStudentService {


    @Autowired
    IStudentDAO studentDao;



    @Autowired
    private Scheduler scheduler;


    public List<Student> studentListService() {
        return studentDao.studentList();
    }

    public void saveService(Student student)  {
         studentDao.save(student);
    }

    public Student updateStudent(int id) {
        return studentDao.updateStudent(id);
    }

    public int countService() {
        return studentDao.count();
    }


}
