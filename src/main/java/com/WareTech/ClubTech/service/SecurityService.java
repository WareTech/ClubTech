package com.WareTech.ClubTech.service;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.Access;
import com.WareTech.ClubTech.entity.User;
import com.WareTech.ClubTech.entity.UserAccess;

import java.util.Base64;

/**
 *
 */
public class SecurityService
{
	/**
	 *
	 * @param user
	 * @param url
	 * @return
	 */
	public boolean checkAuthorization(
		User user,
		String url
		)
	{
		System.out.println(String.format("SecurityService#checkAuthorization user=%s url=%s", user, url));

		if (url == null || "".equals(url))
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

	/**
	 *
	 * @param username
	 * @param password
	 * @return
	 */
	public User login(String username, String password)
	{
		try
		{
			password = Base64.getEncoder().encodeToString(password.getBytes());
			User user = (User) Database.getCurrentSession()
					.createQuery("FROM User WHERE username = :username AND password = :password")
					.setParameter("username", username)
					.setParameter("password", password)
					.uniqueResult();

			if (user == null)
			{
				return null;
			}

			String token = new StringBuffer()
					.append(user.getId())
					.append(":")
					.append(System.currentTimeMillis())
					.toString();
			token = Base64.getEncoder().encodeToString(token.getBytes());
			user.setToken(token);
			Database.getCurrentSession().update(user);

			return user;
		}
		catch(Exception exception)
		{
			return null;
		}
	}
}
