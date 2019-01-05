$('#login').click(function () {
    var account = $('#account').val();
    var password = $('#password').val();

    var url = 'http://localhost:9000/login';

    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: {
            "account": account,
            "password": password,
        },
        success: function (response) {
            console.log(response);
            if (response.status == 'success') {
                console.log(window.location)
                window.location = '/manager';
            }
            else {
                $('#error').html('<b>wrong account or password</b>');
            }
        }
    });
});