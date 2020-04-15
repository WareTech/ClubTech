package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;

@Entity
public class Suscription
    extends AbstractPersistentObject
{
    protected String period;
    protected Float amount;

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
