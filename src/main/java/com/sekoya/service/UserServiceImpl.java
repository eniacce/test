package com.sekoya.service;

import com.sekoya.dao.IUserDao;
import com.sekoya.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;

    public List<User> userListService() {
        return userDao.userList();
    }

    public User getById(String username, String password) {
        return userDao.getByPassword(username,password);
    }
}
