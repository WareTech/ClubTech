function login()
{
    $.post(
        "services/Login.jsp", 
        $("#login_form").serialize(),
        //{username: $("#username").val(), password: $("#password").val()},
        function(data, status){
            if (data == 1){
                document.location = "Home.jsp";
                retur;
            }

            $("#error").popup("open");
            $("#login_form")[0].reset();
    });
}