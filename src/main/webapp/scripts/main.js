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

function goTo(url)
{
	load(url, "#content");
}

function login()
{
	loadingShow();
	$.post(
		"services/Login.jsp",
		$("#login_form").serialize(),
		function(data, status){
			if (data == 1){
				home();
				loadingHide();
				return;
			}

			loadingHide();
			$("#error").popup("open");
			$("#login_form")[0].reset();
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
