package com.WareTech.ClubTech.entity;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Payment
    extends AbstractPersistentObject
{
    protected Long playerId;
    protected Long subscriptionId;
    protected Double amount;
    protected Date date;

    public Long getPlayerId() {
        return playerId;
    }
    public void setPlayerId(Long playerId) {
        this.playerId = playerId;
    }
    public Long getSubscriptionId() {
        return subscriptionId;
    }
    public void setSubscriptionId(Long subscriptionId) {
        this.subscriptionId = subscriptionId;
    }
    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
}
