package com.WareTech.ClubTech.entity;

import com.WareTech.ClubTech.Context;

import javax.persistence.Entity;

@Entity
public class Player
    extends AbstractPersistentObject
{
    protected String firstname;
    protected String lastname;
    protected String dni;
    protected String birthdate;
    protected String category;
    protected String year;
    protected String status;

    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public String getDni() {
        return dni;
    }
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getBirthdate() {
        return birthdate;
    }
    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getFriendlyBirthdate()
            throws Exception
    {
        if (this.getBirthdate() == null)
        {
            return null;
        }

        return Context.DATE_FORMATER.format(
                Context.DATE_FORMATER_ISO.parse(
                        this.getBirthdate()
                )
        );
    }
}
