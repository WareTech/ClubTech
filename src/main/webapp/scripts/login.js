function login()
{
    $.post(
        "services/Login.jsp", 
        $("#login_form").serialize(),
        function(data, status){
            if (data == 1){
                document.location = "Home.jsp";
                return;
            }

            $("#error").popup("open");
            $("#login_form")[0].reset();
    });
}