package com.WareTech.ClubTech.entity;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Note
    extends AbstractPersistentObject
{
    protected Long playerId;
    protected Date date;
    protected String text;

    public Long getPlayerId() {
        return playerId;
    }
    public void setPlayerId(Long playerId) {
        this.playerId = playerId;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
}
