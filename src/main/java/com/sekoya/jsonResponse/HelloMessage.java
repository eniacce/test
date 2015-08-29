package com.sekoya.jsonResponse;

import com.sekoya.model.Student;

import java.util.List;

/**
 * Created by sekoya1 on 28.08.2015.
 */
public class HelloMessage {

    private List<Student> name;

    public List<Student> getName() {
        return name;
    }

    public void setName(List<Student> name) {
        this.name = name;
    }
}
