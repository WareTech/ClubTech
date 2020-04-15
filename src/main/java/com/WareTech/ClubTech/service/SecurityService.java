package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Access;
import com.WareTech.ClubTech.entity.User;
import com.WareTech.ClubTech.entity.UserAccess;

public class SecurityService 
{
	static protected SecurityService securityService = new SecurityService();
	
	/**
	 * @return
	 */
	static public SecurityService getInstance()
	{
		return SecurityService.securityService;
	}
	
	/**
	 * @param user
	 * @param access
	 * @return
	 */
	public boolean checkAuthorization(
			User user,
			String url
			) 
	{
		if (user == null)
		{
			user = (User) Database.getCurrentSession().get(User.class, 616l);
		}

		System.out.println(String.format("SecurityService#checkAuthorization user=%s url=%s", user, url));

		if (url == null || "".equals(url))
		{
			return true;
		}
			
		if (url.startsWith("_"))
		{
			return true;
		}
			
		Access access = (Access) Database.getCurrentSession()
				.createQuery("FROM Access WHERE value = :value")
				.setParameter("value", url)
				.uniqueResult();

		if (access == null)
		{
			return true;
		}

		if (user == null)
		{
			return false;
		}

		UserAccess userAccess = (UserAccess) Database.getCurrentSession()
				.createQuery("FROM UserAccess WHERE user = :user AND access = :access")
				.setParameter("user", user)
				.setParameter("access", access)
				.uniqueResult();

		return userAccess != null;
	}
	
}