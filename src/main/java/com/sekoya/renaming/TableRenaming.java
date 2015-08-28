package com.sekoya.renaming;

import org.hibernate.cfg.DefaultNamingStrategy;
import org.hibernate.internal.util.StringHelper;

import java.util.Date;

/**
 * Created by sekoya1 on 27.08.2015.
 */
public class TableRenaming extends DefaultNamingStrategy {


    public String classToTableName(String className) {
        return StringHelper.unqualify(className.toString().toLowerCase());
    }
    public String columnName(String columnName) {
        return columnName.toLowerCase();
    }
}
