package com.sekoya.dao;

import com.sekoya.model.User;

import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public interface IUserDao {
    public List<User> userList();
    public User getByPassword(String username,String password);

}
