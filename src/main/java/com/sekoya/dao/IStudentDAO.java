package com.sekoya.dao;

import com.sekoya.model.Student;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
public interface IStudentDAO {

    public List<Student> studentList();
    public void save(Student student);
    public Student updateStudent(int id);

    public int count();


}
