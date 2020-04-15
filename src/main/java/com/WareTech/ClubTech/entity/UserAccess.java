package com.WareTech.ClubTech.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserAccess
    extends AbstractPersistentObject
{
	@ManyToOne
	@JoinColumn(name="userId")
	protected User user;
	@ManyToOne
	@JoinColumn(name="accessId")
	protected Access access;

	/**
	 * @return
	 */
	public User getUser() 
	{
		return this.user;
	}
	
	/**
	 * @param user
	 */
	public void setUser(
			User user
			) 
	{
		this.user = user;
	}
	
	/**
	 * @return
	 */
	public Access getAccess() 
	{
		return this.access;
	}
	
	/**
	 * @param access
	 */
	public void setAccess(
			Access access
			) 
	{
		this.access = access;
	}
	
}
