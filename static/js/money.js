$('#query').click(function() {
    get_money();
});

function get_money() {
    var month = $('#month-input').val();
    var start_date = month + '-01';
    var end_date = month + '-31';
    $.ajax({
        url: '/money/get_money',
        type: 'post',
        dataType: 'json',
        data: {
            "start_date": start_date,
            "end_date": end_date
        },
        success: function(response) {
            add_money(response['content']);
        }
    });
}

function add_money(moneys) {
    $('#money_tbody').html('');
    var money_tr = '<tr class="in-tr"><th>House Porperty<th><td>' + moneys['house_property_fee'] + '</td></tr>';
    $('#money_tbody').append(money_tr);
    money_tr = '<tr class="in-tr"><th>Carport Property<th><td>' + moneys['carport_property_fee'] + '</td></tr>';
    $('#money_tbody').append(money_tr);
    money_tr = '<tr class="in-tr"><th>Sold Carport<th><td>' + moneys['sold_carport_fee'] + '</td></tr>';
    $('#money_tbody').append(money_tr);
    money_tr = '<tr class="in-tr"><th>Rental Carport<th><td>' + moneys['rental_fee'] + '</td></tr>';
    $('#money_tbody').append(money_tr);
    money_tr = '<tr class="out-tr"><th>Parking<th><td>' + moneys['park_fee'] + '</td></tr>';
    $('#money_tbody').append(money_tr);
    var total = moneys['house_property_fee'] + moneys['carport_property_fee'] + moneys['sold_carport_fee']
                + moneys['rental_fee'] + moneys['park_fee'] - moneys['repair_fee'];
    money_tr = '<tr class="total-tr"><th>Total<th><td>' + total + '</td></tr>';
    $('#money_tbody').append(money_tr);
}
