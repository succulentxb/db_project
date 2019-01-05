var curr_equip_id = 0;
$(document).ready(function() {
    get_equips_info();
});

$(document).on('click', '.equip-block-usable', function(event) {
    $('.equip-block-selected').removeClass('equip-block-selected');
    $(event.currentTarget).addClass('equip-block-selected');
    curr_equip_id = $(event.currentTarget).data("equip-id");
    $('#repair-record-area').css('display', 'block');
});

$('#submit').click(function() {
    var reporter_id = $('#reporter-id').val();
    var report_date = (new Date()).format('yyyy-MM-dd');
    if (reporter_id == '') {
        $('#error_info').html('<b>Please enter reporter ID.</b>');
        return;
    }
    $.ajax({
        url: '/equip/add_repair_record',
        type: 'post',
        dataType: 'json',
        data: {
            "reporter_id": reporter_id,
            "equip_id": curr_equip_id,
            "report_date": report_date
        },
        success: function(response) {
            if (response['status'] == 'success') {
                $('#error-info').html('<b>Success record.</b>');
                $('#repair-record-area').css('display', 'none');
                get_equips_info();
            }
        }
    });
});

$('#query').click(function() {
    get_records();
});

function get_equips_info() {
    var url = '/equip/get_equips';
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        success: function(response) {
            add_equips(response['content']);
        }
    });
}

function add_equips(equips) {
    $('#equips-view').html('');
    var equips_len = equips.length;
    var equip_nodes = new Array();
    for (var i = 0; i < equips_len; i++) {
        var node_content = '<div class="col-md-3 equip-block equip-block-'
                        + (equips[i]['equip_status'] ? 'usable' : 'unusable') + '"';
        node_content += 'data-equip-id=' + equips[i]['equip_id'] + '>';
        node_content += '<h3><span class="glyphicon glyphicon-scissors"></span></h3>';
        node_content += '<h4>' + equips[i]['location'] + '</h4>';
        node_content += '<h5>' + equips[i]['equip_item'] + '</h5>';
        node_content += '</div>';
        equip_nodes.push(node_content);
    }
    for (var i = 0; i < Math.floor(equips_len/4); i++) {
        var row_content = '<div class="row">';
        for (var j = 0; j < 4; j++) {
            row_content += equip_nodes[i*4 + j];
        }
        row_content += '</div>';
        $('#equips-view').append(row_content);
    }
    var row_content = '<div class="row">';
    for (var i = Math.floor(equips_len/4)*4; i < equips_len; i++) {
        row_content += equip_nodes[i];
    }
    row_content += '</div>';
    $('#equips-view').append(row_content);
}

// datetime format
Date.prototype.format = function(fmt) { 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
}




function get_records() {
    var month = $('#month-input').val();
    var start_date = month + '-01';
    var end_date = month + '-31';
    $.ajax({
        url: '/equip/get_record',
        type: 'post',
        dataType: 'json',
        data: {
            "start_date": start_date,
            "end_date": end_date
        },
        success: function(response) {
            add_records(response['content']);
        }
    });
}

function add_records(records) {
    $('#record_tbody').html('');
    var records_len = records.length;
    for (var i = 0; i < records_len; i++) {
        var tr = '<tr>';
        tr += '<th>' + records[i]['record_id'] + '</th>';
        tr += '<td>' + records[i]['reporter_id'] + '</td>';
        tr += '<td>' + records[i]['location'] + '</td>';
        tr += '<td>' + records[i]['report_date'] + '</td>';
        tr += '<td>' + (records[i]['complaint_status'] == 1 ? 'Done' : 'Processing') + '</td>';
        tr += '</tr>';
        $('#record_tbody').append(tr);
    }
}