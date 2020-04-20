package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import javax.persistence.Transient;
import java.util.ArrayList;
import java.util.List;

@Entity
public class User
    extends AbstractPersistentObject
{
    protected String username;
    protected String password;

	/**
	 * @return the username
	 */
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(
			String username
			) 
	{
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() 
	{
		return this.password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(
			String password
			) 
	{
		this.password = password;
	}

}
