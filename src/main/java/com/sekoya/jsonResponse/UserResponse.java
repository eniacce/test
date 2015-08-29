package com.sekoya.jsonResponse;

import com.sekoya.model.User;

import java.util.List;

/**
 * Created by sekoya1 on 28.08.2015.
 */
public class UserResponse {

    private String status;

    private List<User> data;


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<User> getData() {
        return data;
    }

    public void setData(List<User> data) {
        this.data = data;
    }
}
