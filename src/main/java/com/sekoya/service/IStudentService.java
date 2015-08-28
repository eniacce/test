package com.sekoya.service;

import com.sekoya.model.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
public interface IStudentService {

    public List<Student> studentListService();

    public void saveService(Student student);
    public Student updateStudent(int id);

    public int countService();
}
