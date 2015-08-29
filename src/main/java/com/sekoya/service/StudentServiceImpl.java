package com.sekoya.service;

import com.sekoya.dao.IStudentDAO;
import com.sekoya.model.Student;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
public class StudentServiceImpl implements IStudentService {


    @Autowired
    IStudentDAO studentDao;


    public List<Student> studentListService() {
        return studentDao.studentList();
    }

    public void saveService(Student student) {
        student.setCreatedControl(true);
        studentDao.save(student);
    }

    public Student updateStudent(int id) {
        return studentDao.updateStudent(id);
    }

    public int countService() {
        return studentDao.count();
    }


}
