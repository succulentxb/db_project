$('#query').click(function() {
    get_compl_records();
});

$('#submit').click(function() {
    var complainer_id = $('#complainer-id').val();
    var complaint_type = $('#complaint-type').val();
    var complaint_date = (new Date()).format('yyyy-MM-dd');
    var content = $('#complaint-content').val();
    if (complainer_id == '' || complaint_type == '' || content == '') {
        $('#error_info').html('<b>Please enter resident information.</b>');
        return;
    }
    $.ajax({
        url: '/complaint/add_record',
        type: 'post',
        dataType: 'json',
        data: {
            "complainer_id": complainer_id,
            "complaint_date": complaint_date,
            "complaint_type": complaint_type,
            "content": content
        },
        success: function(response) {
            if (response['status'] == 'success') {
                $('#error-info').html('<b>Success record.</b>');
                $('#complainer-id').val('');
                $('#complaint-type').val('');
                $('#complaint-content').val('');
                get_compl_records();
            }
            else {
                $('#error-info').html('<b>' + response['info'] + '</b>');
            }
        }
    });
});

function get_compl_records() {
    var month = $('#month-input').val();
    var start_date = month + '-01';
    var end_date = month + '-31';
    $.ajax({
        url: '/complaint/get_compl_record',
        type: 'post',
        dataType: 'json',
        data: {
            "start_date": start_date,
            "end_date": end_date
        },
        success: function(response) {
            add_compl_records(response['content']);
        }
    });
}

function add_compl_records(compl_records) {
    $('#complaint_tbody').html('');
    var compl_records_len = compl_records.length;
    for (var i = 0; i < compl_records_len; i++) {
        var compl_tr = '<tr>';
        compl_tr += '<th>' + compl_records[i]['record_id'] + '</th>';
        compl_tr += '<td>' + compl_records[i]['complainer_id'] + '</td>';
        compl_tr += '<td>' + compl_records[i]['complaint_type'] + '</td>';
        compl_tr += '<td>' + compl_records[i]['content'] + '</td>';
        compl_tr += '<td>' + (compl_records[i]['complaint_status'] == 1 ? 'Done' : 'Processing') + '</td>';
        compl_tr += '<td>' + (compl_records[i]['result'] == null ? '' : compl_records[i]['result']) + '</td>';
        compl_tr += '</tr>';
        $('#complaint_tbody').append(compl_tr);
    }
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