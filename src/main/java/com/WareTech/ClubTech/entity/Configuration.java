package com.WareTech.ClubTech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Configuration
    extends AbstractPersistentObject
{
	@Column(name="key_")
    protected String key;
    protected String value;

	/**
	 * @return the key
	 */
	public String getKey() 
	{
		return this.key;
	}

	/**
	 * @param key the key to set
	 */
	public void setKey(
			String key
			)
	{
		this.key = key;
	}

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

}
