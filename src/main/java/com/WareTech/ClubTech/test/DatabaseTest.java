package com.WareTech.ClubTech.test;

import com.WareTech.ClubTech.Database;
import com.WareTech.ClubTech.entity.User;

public class DatabaseTest 
{
	static public void main(String[] args)
		throws Exception
	{
		try
		{
			Database.getCurrentSession().beginTransaction();
			test();
			Database.getCurrentSession().getTransaction().commit();
//			Database.getCurrentSession().getTransaction().rollback();
		}
		catch(Throwable throwable)
		{
			throwable.printStackTrace();
			Database.getCurrentSession().getTransaction().rollback();
			System.exit(-1);
		}
		finally
		{
			Database.getCurrentSession().close();
		}

		System.exit(0);
	}
	
	static public void test()
		throws Exception
	{
		for (int index = 1; index < 2; index++)
		{
			User user = new User();
			user.setUsername("Username" + index);
			user.setPassword("Password" + index);
			Database.getCurrentSession().save(user);
		}
		
//		for (int index = 1; index < 10; index++)
//		{
//			Access access  = new Access();
//			access.setValue("Value" + index);
//			access.setDescription("Description" + index);
//			Database.getCurrentSession().save(access);
//		}
//
//		List<User> userList = Database.getCurrentSession().createQuery("FROM User").list();
//		List<Access> accessList = Database.getCurrentSession().createQuery("FROM Access").list();
//		for(User user : userList)
//		{
//			for(Access access : accessList)
//			{
//				UserAccess userAccess = new UserAccess();
//				userAccess.setUser(user);
//				userAccess.setAccess(access);
//				Database.getCurrentSession().save(userAccess);
//			}
//		}
//
//		for (int index = 1; index < 10; index++)
//		{
//			Alert alert  = new Alert();
//			alert.setDescription("Description" + index);
//			Database.getCurrentSession().save(alert);
//		}
//
//		List<Alert> alertList = Database.getCurrentSession().createQuery("FROM Alert").list();
//		for(User user : userList)
//		{
//			for(Alert alert : alertList)
//			{
//				AlertUser alertUser = new AlertUser();
//				alertUser.setUser(user);
//				alertUser.setAlert(alert);
//				alertUser.setDate(new Time(System.currentTimeMillis()));
//				Database.getCurrentSession().save(alertUser);
//			}
//		}
//
//		for (int index = 1; index < 10; index++)
//		{
//			Configuration configuration = new Configuration();
//			configuration.setKey("Key" + index);
//			configuration.setValue("Value" + index);
//			Database.getCurrentSession().save(configuration);
//		}
		
	}
}
