$(document).ready(function() {
    get_houses_info();
});

$('#query').click(function() {
    get_bills();
});

function get_houses_info() {
    var url = '/house/get_empty_house';
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        success: function(response) {
            add_houses(response['content']);
        }
    });
}

function add_houses(houses) {
    $('#houses-view').html('');
    var houses_len = houses.length;
    var house_nodes = new Array();
    var community_arr = ['A', 'B', 'C']
    for (var i = 0; i < houses_len; i++) {
        var node_content = '<div class="col-md-3 house-block"';
        node_content += 'data-carport-id=' + houses[i]["carport_id"] + '>';
        node_content += '<h2><span class="glyphicon glyphicon-tower"></span></h2>';
        node_content += '<h3>' + houses[i]['room_code'] + '</h3>';
        node_content += '<h4>House ID: ' + houses[i]['house_id'] + '</h4>';
        node_content += '<h4>Building: ' + houses[i]['building_id'] + '</h4>';
        node_content += '<h4>Community: ' + community_arr[houses[i]['room_number']-1] + '</h4>';
        node_content += '<h5>Room Number: ' + houses[i]['room_number'] + '</h5>';
        node_content += '<h5>Area: ' + houses[i]['area'] + '</h5>';
        node_content += '</div>';
        house_nodes.push(node_content);
    }
    for (var i = 0; i < Math.floor(houses_len/4); i = i + 1) {
        var row_content = '<div class="row">';
        for (var j = 0; j < 4; j = j + 1) {
            row_content += house_nodes[i*4 + j];
        }
        row_content += '</div>';
        $('#houses-view').append(row_content);
    }
    var row_content = '<div class="row">';
    for (var i = Math.floor(houses_len/4)*4; i < houses_len; i++) {
        row_content += house_nodes[i];
    }
    row_content += '</div>';
    $('#houses-view').append(row_content);
}

function get_bills() {
    var month = $('#month-input').val();
    var start_date = month + '-01';
    var end_date = month + '-31';
    $.ajax({
        url: '/house/get_bill',
        type: 'post',
        dataType: 'json',
        data: {
            "start_date": start_date,
            "end_date": end_date
        },
        success: function(response) {
            add_bills(response['content']);
        }
    });
}

function add_bills(bills) {
    $('#bill_tbody').html('');
    var bills_len = bills.length;
    var bills_nodes = new Array();
    for (var i = 0; i < bills_len; i++) {
        var bill_tr = '<tr>';
        bill_tr += '<th>' + bills[i]['bill_id'] + '</th>';
        bill_tr += '<td>' + bills[i]['house_id'] + '</td>';
        bill_tr += '<td>' + bills[i]['bill_amount'] + '</td>';
        bill_tr += '<td>' + (bills[i]['bill_status'] == 1 ? 'Paid' : 'Unpaid') + '</td>';
        bill_tr += '</tr>';
        $('#bill_tbody').append(bill_tr);
    }
}