package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.entity.User;

public interface SecurityService
{
	/**
	 * @param user
	 * @param access
	 * @return
	 */
	public boolean checkAuthorization(User user, String url);

	/**
	 *
	 * @param username
	 * @param password
	 * @return
	 */
	public User login(String username, String password);
}