function profile()
{
	$("#content").load("Profile.jsp");
}

function settings()
{
	$("#content").load("Settings.jsp");
}

function logout()
{
	$("#content").load("Logout.jsp", function() {
  		document.location = "Home.jsp";
	});
}

function login()
{
	document.location = "Login.jsp";
}

function suscriptionCreateTicket()
{
	$("#content").load("SuscriptionCreateTicket.jsp", function(){
		$("#content").enhanceWithin();
	});
}

function suscriptionCreateConfirm()
{
	$("#content").load("SuscriptionCreateConfirm.jsp", function(){
		$("#content").enhanceWithin();
	});
}
function suscriptionCreateSelectPeriod()
{
	$("#content").load("SuscriptionCreatePeriod.jsp", function(){
		$("#content").enhanceWithin();
	});
}

function suscriptionCreateSearchMember()
{
	$("#suscripton-create-member-list-panel").fadeIn();
}

function suscriptionCreatePeriodChanged()
{
	var amount = $("#suscripton-create-period option:selected").attr("amount");
	$("#suscripton-create-period-amount").text(amount);
	$("#suscripton-create-period-amount").show();
}

function suscriptionPeriodAmountsLoad()
{
	$.get("services/GetSuscriptionPeriodAmounts.jsp", function(data, status){
		var data = eval(data);
		console.log(data[0].id);
  	});
}

function suscriptionPeriodsLoad()
{
	$.get("services/GetSuscriptionPeriods.jsp", function(data, status){
		var data = eval(data);
		$("#suscripton-create-period").empty();
 		$.each(data, function(index) {
 			$("#suscripton-create-period").append("<option value='" + data[index].id +"' amount='" + data[index].amount +"'>" + data[index].description + "</option>");
		});
  	});
}

function suscriptionPay()
{
	$("#content").load("SuscriptionCreateMember.jsp", function(){
		//suscriptionPeriodsLoad();
		$("#content").enhanceWithin();
	});
}

function suscriptionSearch()
{
	$("#content").load("SuscriptionSearch.jsp", function(){
		$("#content").enhanceWithin();
	});
}

function memberCreate()
{
	$("#content").load("MemberCreate.jsp", function(){
		$("#content").enhanceWithin();
	});
}

