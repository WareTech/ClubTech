package com.WareTech.ClubTech.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.WareTech.ClubTech.Database;

public class TransactionFilter 
	implements javax.servlet.Filter
{
	@Override
	public void destroy() 
	{
	}

	@Override
	public void doFilter(
			ServletRequest servletRequest, 
			ServletResponse servletResponse,
			FilterChain filterChain
			)
		throws IOException, ServletException 
	{
		HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
		System.out.println("TransactionFilter:" + httpServletRequest.getRequestURL());
		
		Database.getCurrentSession().beginTransaction();
		try
		{
			filterChain.doFilter(
					servletRequest, 
					servletResponse
					);
			Database.getCurrentSession().getTransaction().commit();
		}
		catch(Throwable throwable)
		{
			throwable.printStackTrace();
			Database.getCurrentSession().getTransaction().rollback();
		}
		finally
		{
			Database.getCurrentSession().close();
		}
	}

	@Override
	public void init(FilterConfig filterConfig)
		throws ServletException 
	{
	}

}
