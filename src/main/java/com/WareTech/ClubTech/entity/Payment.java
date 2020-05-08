package com.WareTech.ClubTech.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Payment
    extends AbstractPersistentObject
{
    final static public String DATE_TIME_FORMAT = "yyyyMMddHHmmss";
    final static public DateFormat DATE_TIME_FORMATTER = new SimpleDateFormat(DATE_TIME_FORMAT);

    @ManyToOne
    @JoinColumn(name = "member")
    protected Member member;
    @ManyToOne
    @JoinColumn(name = "subscription")
    protected Subscription subscription;
    protected Integer amount;
    @ManyToOne
    @JoinColumn(name = "user")
    protected User user;
    protected String datetime;

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Subscription getSubscription() {
        return subscription;
    }

    public void setSubscription(Subscription subscription) {
        this.subscription = subscription;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
