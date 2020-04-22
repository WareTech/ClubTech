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
	var username = $("#username").val();
	var password = $("#password").val();

	loadingShow();
	$.post(
		"services/Login.jsp",
		{username:username, password:password},
		function(data, status) {
			if (data == 1) {
				home();
				loadingHide();
				return;
			}

			loadingHide();
			$("#error").popup("open");
		});
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

function userListSearch()
{
	var filter = $("#user-list").val()
	if (filter == "")
	{
		$("#error").popup("open");
		return;
	}
	goTo("UserList.jsp?" + filter);
}

function userEditSave()
{
	var userId = $("#user-edit-id").val();
	var username = $("#user-edit-username").val();
	var password1 = $("#user-edit-password1").val();
	var password2 = $("#user-edit-password2").val();

	if (password1 != password2)
	{
		$("#error").popup("open");
		return;
	}

	loadingShow();
	$.post(
		"services/UserUpdate.jsp",
		{userId:userId, username:username, password:password1},
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

function userAccessSave()
{
	var userId = $("#user-edit-id").val();
	var accessList = [];
	$('#access input:checked').each(function() {
		accessList.push(this.value)
	});

	$.post(
		"services/UserAccessUpdate.jsp",
		{userId:userId, accessList:accessList},
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
