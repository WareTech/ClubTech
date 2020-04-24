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

function userEditSave()
{
	var password1 = $("#user-edit-password1").val();
	var password2 = $("#user-edit-password2").val();
	if (password1 != password2)
	{
		$("#error-wrong-password").popup("open");
		return;
	}

	loadingShow();

	$.post(
		"services/UserUpdate.jsp",
		$("#user-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data == 1)
			{
				$("#success").popup("open");
				return;
			}

			$("#error").popup("open");
		}
	);
}

function userAccessSave()
{
	loadingShow();

	var userId = $("#user-edit-id").val();
	var accessList = [];

	$('#access input:checked').each(
		function() {
			accessList.push(this.value)
		});

	$.post(
		"services/UserAccessUpdate.jsp",
		{userId:userId, accessList:accessList},
		function(data, status)
		{
			loadingHide();

			if (data == 1)
			{
				$("#success").popup("open");
				goTo("UserView.jsp?" + userId);
				return;
			}

			$("#error").popup("open");
		});
}

function memberSearchFilter()
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

	var memberId = $("#member-id").val();

	$.post(
		"services/MemberUpdate.jsp",
		$("#member-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data == 1)
			{
				goTo("MemberView.jsp?" + memberId);
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

function accessEditUpdate()
{
	loadingShow();

	var accessId = $("#accessId").val();

	$.post(
		"services/AccessEditUpdate.jsp",
		$("#access-edit").serialize(),
		function(data, status)
		{
			loadingHide();

			if (data == 1)
			{
				$("#success").popup("open");
				goTo("AccessView.jsp?" + accessId);
				return;
			}

			$("#error").popup("open");
		}
	);
}
