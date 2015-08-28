package com.sekoya.model;

import org.springframework.context.annotation.Scope;

import javax.persistence.*;

/**
 * Created by sekoya1 on 27.08.2015.
 */
@Scope("session")
@Entity
@Table
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private  int id;


    @Column
    private String username;
    @Column
    private String password;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
