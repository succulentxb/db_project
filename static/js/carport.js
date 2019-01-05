var curr_carport_id = 0;

$(document).ready(function() {
    get_carports_info();
});

function get_carports_info() {
    var url = '/carport/get_carports';
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        success: function(response) {
            add_carports(response['content']);
        }
    });
}

function add_carports(carports) {
    $('#carports-view').html('');
    var carports_len = carports.length;
    var carport_nodes = new Array();
    for (var i = 0; i < carports_len; i = i + 1) {
        var node_content = '<div class="col-md-3 carport-block carport-block-' 
                        + (carports[i]["status"] ? 'usable' : 'unusable') + '"';
        node_content += 'data-carport-id=' + carports[i]["carport_id"] + '>';
        node_content += '<h4><span class="glyphicon glyphicon-inbox"></span></h4>';
        //node_content += '<span class="glyphicon glyphicon-inbox"></span>';
        //node_content += '</h4>';
        node_content += '<h4>' + carports[i]["location"] + '</h4>';
        node_content += '</div>';
        carport_nodes.push(node_content);
    }
    for (var i = 0; i < Math.floor(carports_len/4); i = i + 1) {
        var row_content = '<div class="row">';
        for (var j = 0; j < 4; j = j + 1) {
            row_content += carport_nodes[i*4 + j];
        }
        row_content += '</div>';
        $('#carports-view').append(row_content);
    }
    var row_content = '<div class="row">';
    for (var i = Math.floor(carports_len/4)*4; i < carports_len; i++) {
        row_content += carport_nodes[i];
    }
    row_content += '</div>';
    $('#carports-view').append(row_content);
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

$('#submit').click(function() {
    var car_id = $('#car-id').val();
    var start_time = new Date(Date.parse($('#start-time').val()));
    var end_time = new Date(Date.parse($('#end-time').val()));
    console.log(start_time);
    console.log(end_time);
    if (car_id == '') {
        $('#error-info').html('<b>Please enter car ID.</b>');
        return;
    }
    if (start_time >= end_time) {
        $('#error-info').html('<b>Start time should be ealier than end time.</b>');
        return;
    } 
    $.ajax({
        url: '/carport/add_record',
        type: 'post',
        dataType: 'json',
        data: {
            "carport_id": curr_carport_id,
            "car_id": car_id,
            "start_time": start_time.format('yyyy-MM-dd hh:mm:ss'),
            "end_time": end_time.format('yyyy-MM-dd hh:mm:ss')
        },
        success: function(response) {
            if (response['status'] == 'success') {
                $('#error-info').html('<b>Success record.</b>');
                $('#park-record-area').css('display', 'none');
                get_carports_info();
            }
        }
    });
    //console.log(start_time.format('yyyy-MM-dd hh:mm:ss'));
});

$(document).on('click', '.carport-block-usable', function(event) {
    console.log($(event.currentTarget).data("carport-id"));
    $('.carport-block-selected').removeClass('carport-block-selected');
    $(event.currentTarget).addClass('carport-block-selected');
    curr_carport_id = $(event.currentTarget).data("carport-id");
    $('#park-record-area').css('display', 'block');
});