package com.WareTech.ClubTech;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * 
 * @author augusto.soncini
 *
 */
public class Database 
{
	protected static SessionFactory sessionFactory = null;
	protected static Configuration  configuration  = null;
	protected static Database       database       = new Database();
	
	/**
	 * 
	 */
	protected Database() 
    {
	}
	
	static 
    {
		try 
        {
			configuration = new Configuration();
			configuration.configure();
			sessionFactory = configuration.buildSessionFactory();
		} 
        catch (Exception exception) 
        {
			exception.printStackTrace();
		}
	}

	/**
	 * @return
	 */
	static public Session openSession() 
    {
		return sessionFactory.openSession();
	}

	/**
	 * @return
	 */
	static public Session getCurrentSession() 
    {
    	if (!sessionFactory.getCurrentSession().isOpen())
		{
			sessionFactory.openSession();
		}

		return sessionFactory.getCurrentSession();
	}

	/**
	 * @return
	 */
	static public Database getInstance() 
    {
		return Database.database;
	}

}
