package com.sekoya.dao;

import com.sekoya.hibernateListener.DbListener;
import com.sekoya.model.Student;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.event.spi.PreUpdateEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sekoya1 on 26.08.2015.
 */
public class StudentDaoImpl implements IStudentDAO{


    @Autowired
    SessionFactory sessionFactory;

    @Autowired
    DbListener dbListener;
    private boolean durum=false;



    @Transactional
    @Scheduled(fixedDelay =30000)
    public List<Student> studentList() {


        Session session1 = sessionFactory.openSession();

        List<Student> list = session1.createQuery("from Student").list();
        session1.close();
        return list;
    }


    @Transactional
    public void save(Student student) {
        Session session = sessionFactory.openSession();
        session.save(student);
        session.close();
        studentList();


    }

    @Transactional
    public Student updateStudent(int id) {
        Session session = sessionFactory.openSession();
        Student student1 = ((Student) session.get(Student.class, id));
        durum=true;
        student1.setUpdateControl(durum);
        session.close();
        return student1;
    }
    @Transactional

    public int count() {
        Session session = sessionFactory.openSession();
        String hql = "select count(*) from Student student";
        Query query = session.createQuery(hql);

        int i = ((Number) query.uniqueResult()).intValue();
        if(i==0){
            session.close();
            return 0;
        }
        else
        {
            session.close();
            System.out.println(i);
            return i;
        }


    }


}
