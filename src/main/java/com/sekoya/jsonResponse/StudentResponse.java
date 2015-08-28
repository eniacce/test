package com.sekoya.jsonResponse;

import com.sekoya.model.Student;

import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public class StudentResponse {

    public String status;


    public List<Student> data;

    public StudentResponse() {
    }

    public StudentResponse(List<Student> data, String status) {
        this.data = data;
        this.status = status;
    }

    public List<Student> getData() {
        return data;
    }

    public void setData(List<Student> data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
