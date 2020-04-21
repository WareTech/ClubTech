package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Member
    extends AbstractPersistentObject
{
    protected String firstname;
    protected String lastname;
    protected String dni;
    protected String birthday;
    protected String phone;
    protected String address;
    protected String email;
    protected String father;
    protected String mother;
    @ManyToOne
    @JoinColumn(name="paymentType")
    protected Parameter paymentType;
    @ManyToOne
    @JoinColumn(name="discount")
    protected Parameter discount;
    @ManyToOne
    @JoinColumn(name="activity")
    protected Parameter activity;
    @ManyToOne
    @JoinColumn(name="status")
    protected Parameter status;
    protected String note;

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
    public String getBirthday() {
        return birthday;
    }
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public String getMother() {
        return mother;
    }

    public void setMother(String mother) {
        this.mother = mother;
    }

    public Parameter getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Parameter paymentType) {
        this.paymentType = paymentType;
    }

    public Parameter getDiscount() {
        return discount;
    }

    public void setDiscount(Parameter discount) {
        this.discount = discount;
    }

    public Parameter getActivity() {
        return activity;
    }

    public void setActivity(Parameter activity) {
        this.activity = activity;
    }

    public Parameter getStatus() {
        return status;
    }

    public void setStatus(Parameter status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
