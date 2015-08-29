package com.sekoya.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by sekoya1 on 26.08.2015.
 */
@Entity
@Table
public class Student implements Serializable  {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ID")
    private int id;

    @Column(name="NAME")
    private String name;

    @Column(name="SURNAME")
    private String surname;
    @Column(name="URL")
    private String url;




    @Transient
    private boolean updateControl;

    @Transient
    private boolean createdControl;


    public boolean isCreatedControl() {
        return createdControl;
    }

    public void setCreatedControl(boolean createdControl) {
        this.createdControl = createdControl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isUpdateControl() {
        return updateControl;
    }

    public void setUpdateControl(boolean updateControl) {
        this.updateControl = updateControl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
}
