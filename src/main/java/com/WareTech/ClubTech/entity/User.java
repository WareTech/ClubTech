package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import java.util.ArrayList;
import java.util.List;

@Entity
public class User
    extends AbstractPersistentObject
{
    protected String username;
    protected String password;

	protected List<String> accessList = new ArrayList<>();

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

	/**
	 *
	 * @return
	 */
	public List<String> getAccessList()
	{
		return accessList;
	}

	/**
	 *
	 * @param accessList
	 */
	public void setAccessList(List<String> accessList)
	{
		this.accessList = accessList;
	}
}
