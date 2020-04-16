function goTo(url)
{
	$("#content").load(url, function(){
		$("#content").enhanceWithin();
	});
}

function home()
{
	document.location = "Home.jsp";
}

function logout()
{
	$("#content").load("Logout.jsp", function() {
  		home();
	});
}

function login()
{
	document.location = "Login.jsp";
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

