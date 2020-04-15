package com.WareTech.ClubTech.entity;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Payment
    extends AbstractPersistentObject
{
    protected Long playerId;
    protected Long suscriptionId;
    protected Double amount;
    protected Date date;

    public Long getPlayerId() {
        return playerId;
    }
    public void setPlayerId(Long playerId) {
        this.playerId = playerId;
    }
    public Long getSuscriptionId() {
        return suscriptionId;
    }
    public void setSuscriptionId(Long suscriptionId) {
        this.suscriptionId = suscriptionId;
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
