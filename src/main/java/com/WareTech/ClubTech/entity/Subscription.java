package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Subscription
    extends AbstractPersistentObject
{
    @ManyToOne
    @JoinColumn(name="activity")
    protected Parameter activity;
    @ManyToOne
    @JoinColumn(name="period")
    protected Parameter period;
    protected Integer amount;

    public Parameter getActivity() {
        return activity;
    }
    public void setActivity(Parameter activity) {
        this.activity = activity;
    }
    public Parameter getPeriod() {
        return period;
    }
    public void setPeriod(Parameter period) {
        this.period = period;
    }
    public Integer getAmount() {
        return amount;
    }
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

}
