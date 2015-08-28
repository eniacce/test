package com.sekoya.hibernateListener;

import com.sekoya.dao.IStudentDAO;
import com.sekoya.model.Student;
import org.hibernate.EmptyInterceptor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.engine.internal.SessionEventListenerManagerImpl;
import org.hibernate.event.spi.PreInsertEvent;
import org.hibernate.event.spi.PreInsertEventListener;
import org.hibernate.event.spi.PreUpdateEvent;
import org.hibernate.event.spi.PreUpdateEventListener;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public class DbListener extends EmptyInterceptor {

    @Override
    public String onPrepareStatement(String sql)
    {
        String prepedStatement = super.onPrepareStatement(sql);

        prepedStatement = prepedStatement.replaceAll("public.", "jugtr.");
        System.out.println("Sonuc"+"================================");
        return prepedStatement;
    }@Override
     public void afterTransactionCompletion(Transaction tx) {

        System.out.println("After transaction;;;;;-------------------------");
    }

    @Override
    public boolean onSave(
            Object entity,
            Serializable id,
            Object[] state,
            String[] propertyNames,
            Type[] types) {
        System.out.println("OnSave");
        return false;
    }



}
