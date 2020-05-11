package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Parameter
    extends AbstractPersistentObject
{
    final static public String PERIOD = "PERIOD";
    final static public String PERIOD_YEARLY = "Anual";
    final static public String PAYMENT_TYPE = "PAYMENT_TYPE";
    final static public String DISCOUNT = "DISCOUNT";
    final static public String ACTIVITY = "ACTIVITY";
    final static public String STATUS = "STATUS";

    protected String value;
    protected String description;
    @ManyToOne
    @JoinColumn(name="parent")
    protected Parameter parent;
    protected Integer position;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Parameter getParent() {
        return parent;
    }

    public void setParent(Parameter parent) {
        this.parent = parent;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }
}
