package com.WareTech.ClubTech.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class StartupServlet 
	extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException
	{
		System.out.println("StartupServlet...");
	}
	
	

}
