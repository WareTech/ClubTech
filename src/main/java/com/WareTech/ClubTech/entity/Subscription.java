package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;

@Entity
public class Subscription
    extends AbstractPersistentObject
{
    protected String activity;
    protected String period;
    protected Float amount;

    public String getActivity() {
        return activity;
    }
    public void setActivity(String activity) {
        this.activity = activity;
    }
    public String getPeriod() {
        return period;
    }
    public void setPeriod(String period) {
        this.period = period;
    }
    public Float getAmount() {
        return amount;
    }
    public void setAmount(Float amount) {
        this.amount = amount;
    }

}
