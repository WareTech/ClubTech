package com.WareTech.ClubTech.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WareTech.ClubTech.entity.User;
import com.WareTech.ClubTech.service.SecurityService;
import com.WareTech.ClubTech.web.Utils;

public class SecurityFilter 
	implements javax.servlet.Filter
{
	final static public String REDIRECT_AFTER_LOGIN = "REDIRECT_AFTER_LOGIN";
	
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
		HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

		System.out.println("SecurityFilter:" + httpServletRequest.getRequestURL());

		String url = httpServletRequest.getServletPath();
		System.out.println("Url=" + url);
		User user = (User) Utils.getUser(httpServletRequest, httpServletResponse);

		if (this.checkAuthorization(user, url))
		{
			filterChain.doFilter(
				servletRequest,
				servletResponse
				);
		}
		else
		{
			httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + Utils.URL_UNATHORIZED);
		}
	}

	@Override
	public void init(FilterConfig filterConfig)
		throws ServletException
	{
	}

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
		return SecurityService.getInstance().checkAuthorization(user, url);
	}

}
