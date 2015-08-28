package com.sekoya.service;

import com.sekoya.model.User;

import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public interface IUserService {

    public List<User> userListService();

    public User getById(String username,String password);
}
