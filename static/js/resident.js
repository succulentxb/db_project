$(document).ready(function() {
    get_residents_info();
});

$('#submit').click(function() {
    var house_id = $('#house-id').val();
    var resident_name = $('#resident-name').val();
    var live_start_date = (new Date()).format('yyyy-MM-dd');
    var gender = $('input[name="gender"]:checked').val();
    if (house_id == '' || resident_name == '') {
        $('#error_info').html('<b>Please enter resident information.</b>');
        return;
    }
    $.ajax({
        url: '/resident/add_resident',
        type: 'post',
        dataType: 'json',
        data: {
            "house_id": house_id,
            "resident_name": resident_name,
            "gender": gender,
            "live_start_date": live_start_date
        },
        success: function(response) {
            if (response['status'] == 'success') {
                $('#error-info').html('<b>Success record.</b>');
                $('#house-id').val('');
                $('#resident-name').val('');
                get_residents_info();
            }
            else {
                $('#error-info').html('<b>' + response['info'] + '</b>');
            }
        }
    });
});

function get_residents_info() {
    var url = '/resident/get_resident';
    $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        success: function(response) {
            add_residents(response['content']);
        }
    });
}

function add_residents(residents) {
    $('#residents-view').html('');
    var residents_len = residents.length;
    var resident_nodes = new Array();
    var community_arr = ['A', 'B', 'C']
    for (var i = 0; i < residents_len; i++) {
        var node_content = '<div class="col-md-3 resident-block"';
        node_content += 'data-resident-id=' + residents[i]['resident_id'] + '>';
        node_content += '<h3><span class="glyphicon glyphicon-user"></span></h3>';
        node_content += '<h4>Name: ' + residents[i]['resident_name'] + '</h4>';
        node_content += '<h4>Gender: ' + residents[i]['gender'] + '</h4>';
        node_content += '<h5>Resident ID: ' + residents[i]['resident_id'] + '</h5>';
        node_content += '<h5>House: ' + residents[i]['house_id'] + '</h5>';
        node_content += '<h5>Community: ' + community_arr[residents[i]['comm_id']-1] + '</h5>';
        node_content += '</div>';
        resident_nodes.push(node_content);
    }
    for (var i = 0; i < Math.floor(residents_len/4); i++) {
        var row_content = '<div class="row">';
        for (var j = 0; j < 4; j++) {
            row_content += resident_nodes[i*4 + j];
        }
        row_content += '</div>';
        $('#residents-view').append(row_content);
    }
    var row_content = '<div class="row">';
    for (var i = Math.floor(residents_len/4)*4; i < residents_len; i++) {
        row_content += resident_nodes[i];
    }
    row_content += '</div>';
    $('#residents-view').append(row_content);
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