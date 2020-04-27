package com.WareTech.ClubTech;

import com.WareTech.ClubTech.service.SecurityService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Context
{
    final static public String DATE_TIME_FORMAT = "dd/MM/yyyy HH:mm 'hs.'";
    final static public DateFormat DATE_TIME_FORMATER = new SimpleDateFormat(DATE_TIME_FORMAT);

    final static public String DATE_FORMAT_ISO = "yyyyMMdd";
    final static public DateFormat DATE_FORMATER_ISO = new SimpleDateFormat(DATE_FORMAT_ISO);

    final static public String DATE_FORMAT = "dd/MM/yyyy";
    final static public DateFormat DATE_FORMATER = new SimpleDateFormat(DATE_FORMAT);

    final static public String[] MONTH = new String[]{"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
    private Context(){}

    static protected String APPLICATION_NAME = "ClubTech";
    static public String getApplicationName()
    {
        return APPLICATION_NAME;
    }

    static protected SecurityService SECURITY_SERVICE = new SecurityService();
    static public SecurityService getSecurityService()
    {
        return SECURITY_SERVICE;
    }
}
