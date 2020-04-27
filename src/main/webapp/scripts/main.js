function loadingShow()
{
	$.mobile.loading("show", {});
}

function loadingHide()
{
	$.mobile.loading("hide", {});
}

function home()
{
	document.location = "Home.jsp";
}

function load(url, container)
{
	loadingShow();
	$(container).load(url, function(){
		$(container).enhanceWithin();
		loadingHide();
	});
}

function callTo(url)
{
	$.get(
		url,
		function(data, status) {
			if (data == 1) {
				loadingHide();
				$("#success").popup("open");
				return;
			}

			loadingHide();
			$("#error").popup("open");
		});
}

function goTo(url)
{
	load(url, "#content");
}

function login()
{
	loadingShow();
	$.post(
		"services/Login.jsp",
		$("#login").serialize(),
		function(data, status)
		{
			if (data == 1) {
				home();
				loadingHide();
				return;
			}

			loadingHide();
			$("#error").popup("open");
		}
	);
}

function logout()
{
	loadingShow();
	$("#content").load("Logout.jsp", function() {
  		home();
		loadingHide();
	});
}

function subscriptionCreateSearchMember()
{
	var filter = $("#subscription-create-member").val()
	if (filter == "")
	{
		$("#error").popup("open");
		return;
	}
	goTo("SubscriptionCreateMember.jsp?" + filter);
}

function paymentCreate()
{
	loadingShow();

	$.post(
		"services/PaymentCreate.jsp",
		$("#payment").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("PaymentView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		});
}

function userSearch()
{
	var filter = $("#user-list").val()
	if (filter == "")
	{
		$("#error").popup("open");
		return;
	}
	goTo("UserSearch.jsp?" + filter);
}

function userUpdate()
{
	loadingShow();

	$.post(
		"services/UserUpdate.jsp",
		$("#info").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("UserView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		});
}

function userCreate()
{
	loadingShow();

	$.post(
		"services/UserCreate.jsp",
		$("#user").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("UserEdit.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		});
}

function validatePassword(password)
{
	if (password == null)
	{
		return -2;
	}

	if (password == "")
	{
		return -3;
	}

	if (password.length < 8)
	{
		return -4;
	}

	return 1;
}

function userPasswordUpdate()
{
	var password1 = $("#user-edit-password1").val();
	var password2 = $("#user-edit-password2").val();

	if (password1 != password2)
	{
		$("#error-wrong-password-1").popup("open");
		return;
	}

	var error = validatePassword(password1);
	if (error < 0)
	{
		$("#error-wrong-password" + error).popup("open");
		return;
	}

	loadingShow();

	$.post(
		"services/UserPasswordUpdate.jsp",
		$("#password").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("UserView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		});
}

function memberSearch()
{
	var filter = $("#member-search-filter").val()
	if (filter == "")
	{
		$("#error").popup("open");
		return;
	}
	goTo("MemberSearch.jsp?" + filter);
}

function memberUpdate()
{
	loadingShow();

	$.post(
		"services/MemberUpdate.jsp",
		$("#member-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("MemberView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}

function memberCreate()
{
	loadingShow();

	$.post(
		"services/MemberCreate.jsp",
		$("#member-create").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("MemberView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}

function accessSearch()
{
	var filter = $("#access-list").val()

	if (filter == "")
	{
		$("#error").popup("open");
		return;
	}
	goTo("AccessSearch.jsp?" + filter);
}

function accessUpdate()
{
	loadingShow();

	$.post(
		"services/AccessUpdate.jsp",
		$("#access-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("AccessView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}

function accessCreate()
{
	loadingShow();

	$.post(
		"services/AccessCreate.jsp",
		$("#access").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("AccessEdit.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		});
}

function activityUpdate()
{
	loadingShow();

	$.post(
		"services/ActivityUpdate.jsp",
		$("#activity-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("ActivityView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}

function activityCreate()
{
	loadingShow();

	$.post(
		"services/ActivityCreate.jsp",
		$("#activity-create").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("ActivityView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}

function subscriptionUpdate()
{
	loadingShow();

	$.post(
		"services/SubscriptionUpdate.jsp",
		$("#subscription-update").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data > 0)
			{
				$("#success").popup("open");
				goTo("SubscriptionView.jsp?" + data);
				return;
			}

			$("#error").popup("open");
		}
	);
}
