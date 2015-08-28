package com.sekoya.dao;

import com.sekoya.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public class UserDaoImpl implements IUserDao {

    @Autowired
    SessionFactory sessionFactory;

    public List<User> userList() {
        Session session = sessionFactory.openSession();
        List<User> list = session.createQuery("from User").list();
        session.close();
        return list;
    }

    public User getByPassword(String username, String password) {
        String hql = "FROM User E WHERE E.password = :password and E.username=:username";
        Session session=sessionFactory.openSession();
        Query query = session.createQuery(hql);
        query.setParameter("password", password).setParameter("username", username);
        User o =(User) query.list().get(0);
        return o;
    }


}
