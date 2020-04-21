package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;

@Entity
public class Access
    extends AbstractPersistentObject
{
    protected String value;
    protected String description;
    protected Integer position;

    /**
	 * @return the value
	 */
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(
			String value
			) 
	{
		this.value = value;
	}

	/**
	 * @return the description
	 */
	public String getDescription() 
	{
		return this.description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(
			String description
			)
	{
		this.description = description;
	}

	/**
	 *
	 * @return
	 */
	public Integer getPosition() {
		return position;
	}

	/**
	 *
	 * @param position
	 */
	public void setPosition(Integer position) {
		this.position = position;
	}
}
