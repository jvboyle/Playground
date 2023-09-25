// Javascript Library for bluesight
// Jinho Hwang, 05/17/2016

function canvas_download() {
    // only one canvas.
    canvas = $('canvas')[0];
    // here is the most important part because if you dont replace you will get a DOM 18 exception.
    var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
    // save locally.
    window.location.href=image;
}

// Jquery Addition for missing helpers.
$.put = function(url, data, callback, type){
    if ( $.isFunction(data) ){
        type = type || callback,
        callback = data,
        data = {}
    }

    return $.ajax({
        url: url,
        type: 'PUT',
        success: callback,
        data: data,
        contentType: type,
        dataType: type
    });
}

$.delete = function(url, data, callback, type){
    if ( $.isFunction(data) ){
        type = type || callback,
        callback = data,
        data = {}
    }

    return $.ajax({
        url: url,
        type: 'DELETE',
        success: callback,
        data: data,
        contentType: type,
        dataType: type
    });
}

function vget(d, k, c) {
    if( !d ) return c;
    if( k in d ) {
        return d[k];
    }

    return c;
}

function show_spinner(elem, message)
{
    div = elem;
    html = '<div class="spinner" style="display:none;"><div class="spinner-message" display:none;>' + message;
    html += '</div></div>';
    if( $(div).find('.spinner').length <= 0 ) {
        $(div).prepend(html);
    }
    $(div).find('.spinner').css({ height: $(div).height(), width: $(div).width() });
    $(div).find('.spinner').show();
    $(div).find('.spinner-message').show();
    return true;
}

function hide_spinner(elem)
{
    div = elem;
    if( $(div).find('.spinner').length > 0 ) {
        $(div).find('.spinner').each(function() {
            $(this).hide();
        });
        $(div).find('.spinner-message').each(function() {
            $(this).hide();
        })
    }
}

function show_progress(elem, message) {
    html = '<div class="progress-wrap" id="progress-wrap">';
    html += '<div class="p-message">' + message + '</div>';
    html += '<div class="progress">';
    html += '<div id="progress-bar" class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="color: black;">0%';
    html += '</div></div></div>';
    if( $(elem).find('.progress-wrap').length <= 0 ) {
        $(elem).prepend(html);
    }
    $(elem).find('.progress-wrap').css({ height: $(elem).height(), width: $(elem).width() });
    $(elem).find('.progress-wrap').show();
    return true;
}

function hide_progress(elem) {
    $(elem).find('.progress-wrap').fadeOut();
    setTimeout(function () {
        $(elem).remove();
    }, 1000);
}

// Page managements
var onepages = [];
var current_onepage = undefined;
function onepage_start()
{
    $('.onepage').each(function() {
        onepages[onepages.length] = this; // javascript objects
    });

    // show only first one when window refresh.
    maxwidth = window.innerWidth * 2;

    current_onepage = onepages[0];
    for(var i = 1; i < onepages.length; i++) {
        $(onepages[i]).css('left', maxwidth+'px');
    }

    $('.onepage_next').on('click', function() {
        // sanity check first (function name cannot have dash).
        pageobj = $(this).closest('.onepage');
        funcname = 'submit_' + $(pageobj).prop('id').split('-')[1];
        if( funcname in window ) {
            if( window[funcname]() == false ) { // no args.
                return false;
            }
        }

        // confirm to understand.
        /*
        if( ! confirm('This button will save information and initiate migration activities. If not sure, please click "cancel" and check the information. Otherwise click "OK".') ) {
            return false;
        }
        */

        // moving windows.
        spinner_onepage_next(this);

        nextobj = $(pageobj).next();
        funcname = 'before_' + $(nextobj).prop('id').split('-')[1];
        if( funcname in window ) {
            if( window[funcname]() == false ) { // no args.
                return false;
            }
        }
    });

    $('.onepage_previous').on('click', function() {
        onepage_previous(this);
    });
}

function spinner_onepage_next(object)
{
    show_spinner('wrap', 'Processing...');
    setTimeout(function(){
        hide_spinner('wrap');
        onepage_next(object);
    }, 1000);
}

function onepage_next(object)
{
    pageobj = $(object).closest('.onepage');
    orgleft = $(pageobj).offset().left;

    // change color.
    stepid = 'step-' + $(pageobj).prop('id').split('-')[1];
    $('#'+stepid).removeClass('hollow').removeClass('warning');

    stepid = 'step-' + $(pageobj).next().prop('id').split('-')[1];
    $('#'+stepid).removeClass('hollow').addClass('warning');

    maxwidth = window.innerWidth * 2;
    $(pageobj).animate({ left: '-'+maxwidth+'px' }, 500);
    $(pageobj).next().animate({ left: orgleft+'px' }, 500);
}

function onepage_previous(object)
{
    pageobj = $(object).closest('.onepage');
    orgleft = $(pageobj).offset().left;
    maxwidth = window.innerWidth * 2;

    stepid = 'step-' + $(pageobj).prop('id').split('-')[1];
    $('#'+stepid).removeClass('hollow').removeClass('warning');

    stepid = 'step-' + $(pageobj).prev().prop('id').split('-')[1];
    $('#'+stepid).removeClass('hollow').addClass('warning');

    $(pageobj).animate({ left: maxwidth+'px' }, 500);
    $(pageobj).prev().animate({ left: orgleft+'px' }, 500);
}

// TODO: this needs more thoughts.. whether we support the jump... maybe not...
// assume only jump to previous ones.
function onepage_jump(id)
{
    pageobj = $('#'+id);
    orgleft = $(current_onepage).offset().left;
    maxwidth = window.innerWidth * 2;

    temp_current_onepage = current_onepage;

    $(current_onepage).parents('.onepage').each(function() {
        if( $(this) == $(pageobj) ) {
            $(current_onepage).animate({ left: maxwidth+'px' }, 500);
            $(pageobj).animate({ left: orgleft+'px' }, 500);
            current_onepage = $(current_onepage);
        }
    });

    if( temp_current_onepage == current_onepage ) {
        alert('You can not jump to later one');
    }
}

// Mandatory Field (class='mandatory')
function mandatory_highlight() {
    $('.mandatory').each(function() {
        if( $(this).val() == '' ) {
            $(this).css('border-color', 'pink').css('border-width', '3px');
        }

        $(this).on('input', function () {
            if( $(this).val() != '' ) {
                $(this).css('border-color', 'rgb(204, 204, 204)').css('border-width', '1px');
            } else {
                $(this).css('border-color', 'pink').css('border-width', '3px');
            }
        });
    });
}

function mandatory_exclusive(id1, id2) {
    if( $(id1).val() != '' ) {
        $(id2).css('border-color', 'rgb(204, 204, 204)').css('border-width', '1px');
    }

    $(id1).on('change', function() {
        if( $(id1).val() != '' ) {
            $(id2).css('border-color', 'rgb(204, 204, 204)').css('border-width', '1px');
        } else {
            $(id2).css('border-color', 'pink').css('border-width', '3px');
        }
    });

    if( $(id2).val() != '' ) {
        $(id1).css('border-color', 'rgb(204, 204, 204)').css('border-width', '1px');
    }
    $(id2).on('change', function() {
        if( $(id2).val() != '' ) {
            $(id1).css('border-color', 'rgb(204, 204, 204)').css('border-width', '1px');
        } else {
            $(id1).css('border-color', 'pink').css('border-width', '3px');
        }
    });
}

function password_mask() {
    $('.password_mask').each(function() {
        if( (password = $(this).text()) != '' ) {
            $(this).text('');
            $(this).append('<div>******</div><a class="btn btn-mini" onclick="toggle_password(this, \'' + password.replace(/\'/g, '') + '\')">Show Password</a>');
        }
    });
}

// Show server message
function display_message(data) {
    var message = data['message'];
    var status = data['status'];
    var html = '';

    if(status == 'ERROR') {
        html += '<div class="message-box error-message alert alert-dismissable" role="alert">';
        html += '<div class="alert-close-tab"><button class="close-btn" data-dismiss="alert">&times;</button></div>';
        html += '<span>ERROR: </span>';
    } else if(status == 'OK') {
        html += '<div class="message-box ok-message alert alert-dismissable" role="alert">';
        html += '<div class="alert-close-tab"><button class="close-btn" data-dismiss="alert">&times;</button></div>';
        html += '<span>OK: </span>';
    } else if(status == 'SUCCESS') {
        html += '<div class="message-box ok-message alert alert-dismissable" role="alert">';
        html += '<div class="alert-close-tab"><button class="close-btn" data-dismiss="alert">&times;</button></div>';
        html += '<span>SUCCESS: </span>';
    }
    html += message;
    html += '</div>';
    $(html).prependTo($('.message-wrapper')).trigger('showalert');
}

// Make table body vertically scrollable
function cp_table_body_scrollable(height, padding) {
    // if height is undefined, stretch to the bottom.

    if( padding == undefined )
        padding = '0px';

    $('.table').each(function() {
        //num_cols = $('th', this).length;
        //console.log(num_cols);
        $(this).css('margin', '0');

        pos_top = $('tbody', this).position().top;

        outer = $(this).closest('.sidetab-body');
        height = $(outer).outerHeight() - pos_top;

        //<tr style="display:block;">
        //console.log($('thead > tr', this));
        //$('thead > tr', this).css('display', 'block');

        //<tbody style="height:200px;overflow-y:auto;display:block;padding-bottom:100px;">
        $('tbody', this).css('overflow-y', 'auto')
                        .css('height', height)
                        .css('padding-bottom', padding);

        //if( height != undefined ) {
        //    $('tbody', this).css('height', height);
        //}

        // number does not matter much... just put 6 and it spans out
        $('th', this).addClass('span6');
        $('td', this).addClass('span6');
    });
}

// Make table filterable
function cp_table_filterable(selectable)
{
    $('.table').each(function() {
        total_num = $('tbody > tr', this).length;
        //$('<div class="table_filter pull-right"><b class="table_total">' + total_num + '/' + total_num + '</b> | Filter: <input class="table_filter_input" type="text" placeholder="Type to Search"></div><br>').insertBefore(this);
        if(selectable) {
            $('<div class="input-prepend input-append table_filter pull-right"><span class="add-on table_total" style="padding-top:0px;">' + total_num + '/' + total_num + '</span><input class="span2 table_filter_input" type="text" placeholder="Type to Search" style="width:100px;"><span class="add-on table_selected" style="padding-top:0px;">0 selected</span></div>').insertBefore(this);

            $(this).on('click', function() {
                cp_table_selected();
            });
        } else {
            $('<div class="input-prepend table_filter pull-right"><span class="add-on table_total" style="padding-top:0px;">' + total_num + '/' + total_num + '</span><input class="span2 table_filter_input" type="text" placeholder="Type to Search" style="width:120px;"></div>').insertBefore(this);
        }

        $('.table_filter_input').on('input', function() {
            cp_table_filter($(this).val());
        });

    });
}

function cp_table_filter(word)
{
    $('.table').each(function() {
        total_num = $('tbody > tr', this).length;
        shown_num = 0;
        $('tbody > tr', this).each(function() {
            if( $(this).text().toLowerCase().indexOf(word.toLowerCase()) >= 0 ) {
                $(this).show();
                shown_num += 1;
            } else {
                $(this).hide();
            }
        });
        $(this).prevAll('.table_filter').find('span.table_total').html(shown_num + '/' + total_num);
    });
}

function cp_table_selected()
{
    $('.table').each(function() {
        selected_number = $('.row_selectable:checked', this).length;
        $(this).prevAll('.table_filter').find('span.table_selected').html(selected_number + ' selected');
    });
}

// JQUERY AJAX CSRFTOKEN
function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');

function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}
function sameOrigin(url) {
    // test that a given url is a same-origin URL
    // url could be relative or scheme relative or absolute
    var host = document.location.host; // host + port
    var protocol = document.location.protocol;
    var sr_origin = '//' + host;
    var origin = protocol + sr_origin;
    // Allow absolute or scheme relative URLs to same origin
    return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||
        (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||
        // or any other URL that isn't scheme relative or absolute i.e relative.
        !(/^(\/\/|http:|https:).*/.test(url));
}

$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
            // Send the token to same-origin, relative URLs only.
            // Send the token only if the method warrants CSRF protection
            // Using the CSRFToken value acquired earlier
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});

// TODO: called by settime interval?
function discover_status_check(tr, customername)
{
    servername = $(tr).find('.hostname').text();

    // update progress bar.. or put error mark... mouseover..
    $.get('/api/v1/discover?customername=' + customername + '&servername=' + servername, null, function(data) {
        message = data['message'];

        if( data['status'].indexOf('ERROR') >= 0 ) {
            $(tr).find('.bar').css('width', '100%').addClass('bar-danger');
            $(tr).find('.bar').text(message['status']);

            $(tr).find('.bar').tooltip({ trigger: 'hover', title: message['output'], delay: { show: 300 } });
        } else {
            $(tr).find('.bar').css('width', message['progress']+'%');
            $(tr).find('.bar').text(message['status']);

            if( data['status'] != 'COMPLETE' ) {
                setTimeout(function() {
                    discover_status_check(tr, customername);
                }, 5000);
            }
        }
    },'json')
    .fail(function() {
        $(tr).find('.bar').css('width', '100%').addClass('bar-danger');
        $(tr).find('.bar').text('API ERROR');
    });
}

// TODO: let's do group discovery
function discover_server(tr, customername, isgroup)
{
    servername = $(tr).find('.hostname').text();

    if(! isgroup) {
        if(! confirm('Are you sure you want to initiate a new discovery for ' + servername + '?')) {
            return false;
        }
    }

    $(tr).find('.bar').removeClass('bar-danger');

    // call async discovery
    $.post('/api/v1/discover?customername=' + customername, JSON.stringify({'servername': servername }), function(data) {
        if( data['status'] == 'SUCCESS' ) {
            //server_list_table('server_list', data['message']);
            discover_status_check(tr, customername);
        }
    },'json')
    .fail(function() {
        $(element).prev().find('.bar').css('width', '100').addClass('bar-danger');
        $(element).prev().find('.bar').text('API ERROR');
    });

}

function discover_all_incomplete_server(table_body, customername)
{
    $(table_body).find('tr').each(function() {
        if( $(this).find('.bar').text() != 'COMPLETE' ) {
            servername = $('.hostname', this).text();
            discover_server(this, customername, true);
        }
    });
}

// Only selected info.
function server_list_table(table_id, data) {
    $('#'+table_id).prevAll('.table_filter').remove(); // remove filter.
    $('#'+table_id).empty();

    thead = '';
    tbody = '';

    thead += '<thead><tr>';
    thead += '<th class="span1"><input id="' + table_id + '_all_selected" type="checkbox" value=""></th>';
    //thead += '<th>Hostname</th><th>OS Type</th><th>Public IP</th><th>Private IP</th><th>Username</th><th>Password</th><th>Virtual?</th><th>Platform Type</th><th>Group Info</th>';
    thead += '<th>Hostname</th><th>OS Type</th><th>Public IP</th><th>Private IP</th><th>Username</th><th>Password</th><th>Discovery <a id="trigger_all_discover"><i class="fi-refresh" onmouseover="$(this).tooltip({ trigger: \'hover\', title: \'Trigger discovery for all incomplete servers.\', delay: { show: 300 }});"></i></a></th>';
    thead += '</tr></thead>';

    tbody += '<tbody>';

    // for
    servers = data[''];

    input_customername = '';
    input_servers = [];

    // TODO: should have page numbers at the bottom... if it can be used in one page...
    for(var i = 0; i < data.length; i++) {
        tbody += '<tr>';
        tbody += '<td><input id="' + data[i]['source_hostname'] + '" type="checkbox" class="row_selectable" value=""></td>'; // TODO: get id, instead of hostname
        tbody += '<td class="hostname">' + data[i]['source_hostname'] + '</td>';
        tbody += '<td>' + data[i]['os_type'] + '</td>';
        tbody += '<td>' + data[i]['source_public_ip'] + '</td>';
        tbody += '<td>' + data[i]['source_private_ip'] + '</td>';
        tbody += '<td>' + data[i]['source_username'] + '</td>';
        tbody += '<td class="password_mask">' + data[i]['source_password'] + '</td>';
        tbody += '<td class="discover_status">';
        if( data[i]['discover_status'].indexOf('ERROR') >= 0 ) {
            tbody += '<div class="controls"><div class="input-apend"><div class="span2 progress progress-striped active" style="margin:0px;"><div class="bar bar-danger" style="width:' + '100' + '%;">' + 'INCOMPLETE' + '</div></div><a class="add-on btn btn-mini ind_discover"><i class="fi-refresh"></i></a></div></div>';
        } else {
            tbody += '<div class="controls"><div class="input-apend"><div class="span2 progress progress-striped active" style="margin:0px;"><div class="bar" style="width:' + data[i]['discover_progress'] + '%;">' + data[i]['discover_status'] + '</div></div><a class="add-on btn btn-mini ind_discover"><i class="fi-refresh"></i></a></div></div>';
        }
        tbody += '</td>';
        tbody += '</tr>';

        input_customername = data[i]['customername'];
        if( data[i]['discover_status'] != 'COMPLETE' ) {
            input_servers.push(data[i]['source_hostname']);
        }
    }

//{"source_username":"linustovalds","helper_dns_list":"","target_private_ip":"","helper_private_ip":"","source_private_ip":"11.11.11.11","helper_subnet":"","source_password":"idontknow","target_domain":"","helper_gw":"","target_hostname":"linuxexample","source_public_ip":"198.11.11.11","helper_public_ip":"","source_hostname":"linuxexample","target_password":"","target_public_ip":"","target_username":""},

    tbody += '</tbody>';

    //$('#'+table_id).append('<input id="' + table_id + '_selected" type="text" value="" style="display:none;">');
    $('#'+table_id).append(thead);
    $('#'+table_id).append(tbody);

    $('#'+table_id+'_all_selected').on('click', function() {
        all_flag = $(this).is(':checked');
        $('.row_selectable:visible').each(function() {
            $(this).prop("checked", all_flag);
        });
    });

    $('.ind_discover').click(function() {
        discover_server($(this).closest('tr'), input_customername, false);
    });

    $('#trigger_all_discover').click(function() {
        if( ! confirm('This will trigger discovery processes for all incomplete servers. Do you want to proceed?') ) {
            return false;
        }

        table_body = $('tbody', '#'+table_id);
        discover_all_incomplete_server(table_body, input_customername);
    });

    // update table search number
    cp_table_filter('');
    cp_table_body_scrollable();
    cp_table_filterable();
    password_mask();
}

function server_details_table(server) {
    server_table = '<table class="table table-stripe">';
    server_table += '<tbody>';
    server_table += '<tr><td>Source Hostname</td><td>' + server['source_hostname'] + '</td></td>';
    server_table += '<tr><td>Source Public IP</td><td>' + server['source_public_ip'] + '</td></td>';
    server_table += '<tr><td>Source Private IP</td><td>' + server['source_private_ip'] + '</td></td>';
    server_table += '<tr><td>Source Username</td><td>' + server['source_username'] + '</td></td>';
    if( server['source_password'] ) {
        server_table += '<tr><td>Source Password</td><td><div>******</div><a class="btn btn-mini" onclick="toggle_password(this, \'' + server['source_password'].replace(/\'/g, '') + '\')">Show Password</a></td></td>';
    }
    server_table += '<tr><td>Target Hostname</td><td>' + server['target_hostname'] + '</td></td>';
    server_table += '<tr><td>Target Domain Name</td><td>' + server['target_domain'] + '</td></td>';
    server_table += '<tr><td>Target Public IP</td><td>' + server['target_public_ip'] + '</td></td>';
    server_table += '<tr><td>Target Private IP</td><td>' + server['target_private_ip'] + '</td></td>';
    server_table += '<tr><td>Target Username</td><td>' + server['target_username'] + '</td></td>';
    if( server['target_password'] ) {
        server_table += '<tr><td>Target Password</td><td><div>******</div><a class="btn btn-mini" onclick="toggle_password(this, \'' + server['target_password'].replace(/\'/g, '') + '\')">Show Password</a></td></td>';
    }

    server_table += '</tbody>';
    server_table += '</table>';

    return server_table;
}

// RENDER TREE
function json_to_tree(branches) {
    var ul = document.createElement("ul");
    var is_exists = false;

    for(var key in branches) {
        var key_text = key + ': ' + branches[key];
        if( Array.isArray(branches[key]) || typeof branches[key] == 'object' ) {
            key_text = key;
        }
        var li = document.createElement("li");
        var link = document.createElement("a");
        var text = document.createTextNode(key_text);

        link.appendChild(text);
        li.appendChild(link);

        if( Array.isArray(branches[key]) ) {
            var branch_array = branches[key];
            var array_length = branch_array.length;
            for(var i = 0; i < array_length; i++) {
                var temp_array = {};
                temp_array[String(i)] = branch_array[i];
                if( added_ul = json_to_tree(temp_array) ) {
                    li.appendChild(added_ul);
                }
            }
        } else if( typeof branches[key] == 'object' ) {
            if( added_ul = json_to_tree(branches[key]) ) {
                li.appendChild(added_ul);
            }
        }
        ul.appendChild(li);
        is_exists = true;
    }

    return is_exists? ul: undefined;
}

function renderTree(id, root_name, json_data) {
    document.getElementById(id).innerHTML = null;
    var treeEl = document.getElementById(id);
    var treeObj = json_data;
    if( typeof json_data != 'object' ) {
        treeObj = JSON.parse(json_data);
    }
    if( root_name ) {
        var treeObj_temp = {};
        treeObj_temp[root_name] = treeObj;
        treeObj = treeObj_temp;
    }

    treeEl.appendChild(json_to_tree(treeObj));

    $( '.tree li' ).each( function() {
        if( $( this ).children( 'ul' ).length > 0 ) {
            $( this ).addClass( 'parent' );
        }
    });

    $( '.tree li.parent > a' ).click( function( ) {
        $( this ).parent().toggleClass( 'active' );
        $( this ).parent().children( 'ul' ).slideToggle( 'fast' );
    });

    $('ul:first', '#'+id).css('margin-left', '0px');
    expandTreeFirst();
}

function expandTreeFirst() {
    $( '.tree li a' ).first().click();
}

function expandTree() {
    $( '.tree li' ).each( function() {
        $( this ).addClass( 'active' );
        $( this ).children( 'ul' ).slideDown( 'fast' );
    });
}

function extractTree() {
    $( '.tree li' ).each( function() {
        $( this ).removeClass( 'active' );
        $( this ).children( 'ul' ).slideUp( 'fast' );
    });
}

function toggleTree() {
    $( '.tree li' ).each( function() {
        $( this ).toggleClass( 'active' );
        $( this ).children( 'ul' ).slideToggle( 'fast' );
    });
}

// TODO: Make this all dynamic using APIs
// Put # in front of os_platform_id and softwares_id
// Example - json_data: "{\"platform\": {\"memory_mb\": \"4096\", \"biosversion\": \"Phoenix Technologies LTD 6.00, 9/30/2014\", \"cpucount\": \"2\", \"vendor\": \"VMware, Inc.\", \"name\": \"VMware Virtual Platform\", \"cpuspeed\": \"2533\", \"serial\": \"VMware-42 17 83 e2 dc 84 8c ed-fe 35 60 0c 46 f6 b2 0a\", \"disks\": [{\"subtype\": \"mount\", \"type\": \"file\", \"name\": \"unknown\", \"alias\": \"/A\"}, {\"subtype\": \"mount\", \"type\": \"file\", \"name\": \"unknown\", \"alias\": \"/D\"}], \"uuid\": \"421783e2dc848cedfe35600c46f6b20a\"}, \"svg_path\": \"/media//userdata/ibm/aldm/victim2008R2/gal/vis/perserver/victimsql2008r2/level0/victimsql2008r2.svg\", \"hostname\": \"victimsql2008r2\", \"os\": {\"distribution\": \"Microsoft Windows Server 2008 R2 Standard  \", \"version\": \"6.1.7601\", \"name\": \"Windows\", \"os_fixpack\": \"6.1.7601 Service Pack 1 Build 7601\"}, \"networks\": [{\"MAC\": \"00:50:56:97:01:34\", \"name\": \"Local Area Connection 8\", \"ip\": \"9.2.36.140\", \"mask\": \"255.255.255.128\", \"gateway\": \"9.2.36.130\", \"network\": \"9.2.36.128\"}], \"softwares\": [{\"services\": [{\"nports\": \"MSSQLSERVER\", \"objects\": [{\"used\": \"95.83\", \"type\": \"database\", \"name\": \"model\", \"size\": \"1152000\"}, {\"used\": \"96.26\", \"type\": \"database\", \"name\": \"TestDB\", \"size\": \"3208000\"}, {\"used\": \"88.97\", \"type\": \"database\", \"name\": \"ReportServer\", \"size\": \"3336000\"}, {\"used\": \"90.55\", \"type\": \"database\", \"name\": \"AnotherTestDB\", \"size\": \"1608000\"}, {\"used\": \"88.95\", \"type\": \"database\", \"name\": \"tempdb\", \"size\": \"1376000\"}, {\"used\": \"92.69\", \"type\": \"database\", \"name\": \"master\", \"size\": \"6568000\"}, {\"used\": \"95.00\", \"type\": \"database\", \"name\": \"msdb\", \"size\": \"11512000\"}, {\"used\": \"91.95\", \"type\": \"database\", \"name\": \"ReportServerTempDB\", \"size\": \"1392000\"}], \"protocol\": \"msq\", \"name\": \"MSSQLSERVER\", \"ports\": \"1433\"}], \"version\": \"10.50.1600.1\", \"vendor\": \"Microsoft\", \"name\": \"Microsoft SQL Server 2008 R2 (RTM)\", \"directory\": \"C:\\\\Program Files\\\\Microsoft SQL Server\\\\MSSQL10_50.MSSQLSERVER\\\\MSSQL\", \"class\": \"DBMS\", \"subclass\": \"MSQ\"}]}"

function renderBuildInput(os_platform_id, softwares_id, add_softwares_id, json_data, build_info) {

    // Options: OS and Platform, Software, Additional Software
    $('#'+os_platform_id).empty();
    $('#'+softwares_id).empty();
    $('#'+add_softwares_id).empty();

    /*
     * Get Discovered Data
     */
    cores_count = parseInt(json_data['platform']['cpucount']);
    ram_size = parseInt(json_data['platform']['memory_mb']/1024)|0;
    disks = json_data['platform']['disks'];
    total_disk_size = 0;
    for(var i = 0; i < disks.length; i++) {
        total_disk_size += parseInt(disks[i]['size'])/(1024*1024*1024);
    }
    total_disk_size = total_disk_size|0;

    /*
     * OPERATING SYSTEM AND PLATFORM
     */
    os_platform = '<div>';

    os_platform += '<tr><th><label>OS</label></th><td><select id="os_selected">';

    // need to get from build_info
    // TODO: make this dynamic to retrieve the appropriate operating systems.
    os_platform += '<option value="WIN_2008-STD-SP2_64">WIN_2008-STD-SP2_64</option>';
    os_platform += '<option value="WIN_2012-STD_64">WIN_2012-STD_64</option>';

    os_platform += '</select></td></tr>';

    os_platform += '<tr><th><label>Cores</label></th><td><select id="cores_selected">';
    cores = [1, 2, 4, 8, 12, 16]; // TODO need to be dynamic
    cores_pick = 0;
    for(var i = 0; i < cores.length; i++) {
        os_platform += '<option value="' + cores[i] + '">' + cores[i] + '</option>';
        if( cores_pick == 0 && cores[i] >= cores_count ) {
            cores_pick = cores[i];
        }
    }
    os_platform += '</select></td></tr>';

    os_platform += '<tr><th><label>RAM</label></th><td><select id="ram_selected">';
    rams = [1, 2, 4, 6, 8, 12, 16, 32, 48]; // TODO need to be dynamic
    ram_pick = 0;
    for(var i = 0; i < rams.length; i++) {
        os_platform += '<option value="' + rams[i] + '">' + rams[i] + ' GB</option>';
        if( ram_pick == 0 && rams[i] >= ram_size ) {
            ram_pick = rams[i];
        }
    }
    os_platform += '</select></td></tr>';

    os_platform += '<tr><th><label>Disk</label></th><td><select id="disk_selected">';
    disks = [25, 50]; // TODO need to be dynamic
    disk_pick = 0;
    for(var i = 0; i < disks.length; i++) {
        os_platform += '<option value="' + disks[i] + '">' + disks[i] + ' GB</option>';
        if( disk_pick == 0 && disks[i] >= total_disk_size ) {
            disk_pick = disks[i];
        }
    }
    os_platform += '</select></td></tr>';

    os_platform += '</div>';

    $('#'+os_platform_id).append(os_platform);

    /*
     * SET DISCOVERED DATA
     */
    $('#cores_selected').val(cores_pick);
    $('#ram_selected').val(ram_pick);
    $('#disk_selected').val(disk_pick);

    // TODO: change this dynamically
    /*
     * SOFTWARES AND DATA MIGRATION
     */
    sw = '<div>';

    sw += '<label>Choose Application:</label>';
    sw += '<div class="input-append">';
    sw += '<select id="sw_selected" class="form-control">';

    sw += '<option value="Microsoft SQL Server 2008 R2 (RTM)">Microsoft SQL Server 2008 R2 (RTM)</option>';

    sw += '</select>';
    sw += '<a id="sw_add" class="btn btn-inverse">+</a>';
    sw += '</div>';

    sw += '</div>';

    $('#'+softwares_id).append(sw);

    $('#sw_add').click(function() {
        add_application(softwares_id, json_data);
    });

    /*
     * ADD CHEF ROLES AND RECIPES
     */
    chef_info = build_info['chef_info'];

    add_sw = '<div>';

    add_sw += '<label>Choose Additional Roles:</label>';
    add_sw += '<div class="input-append">';
    add_sw += '<select id="add_role_selected" class="form-control">';

    role_list = chef_info['role_list'];
    for(var i = 0; i < role_list.length; i++) {
        add_sw += '<option value="role[' + role_list[i] + ']">' + role_list[i] + '</option>';
    }

    add_sw += '</select>';
    add_sw += '<a id="add_role_add" class="btn btn-inverse">+</a>';
    add_sw += '</div>';

    add_sw += '<label>Choose Additional Recipes:</label>';
    add_sw += '<div class="input-append">';
    add_sw += '<select id="add_recipe_selected" class="form-control">';

    recipe_list = chef_info['recipe_list'];
    for (var k in recipe_list) {
        for(var j = 0; j < recipe_list[k].length; j++) {
            add_sw += '<option value="recipe[' + recipe_list[k][j] + ']">' + recipe_list[k][j] + '</option>';
        }
    }

    add_sw += '</select>';
    add_sw += '<a id="add_recipe_add" class="btn btn-inverse">+</a>';
    add_sw += '</div>';

    add_sw += '</div>';

    $('#'+add_softwares_id).append(add_sw);
    $('#add_role_add').click(function() {
        add_add_role(add_softwares_id, json_data);
    });
    $('#add_recipe_add').click(function() {
        add_add_recipe(add_softwares_id, json_data);
    });

    /*
     * BUILD SHEET MANAGEMENT (LEFT-RIGHT MOVEMENT)
     */
    sunit = 50;
    $('#img-left-arrow').css('left',  $('#Build_Modal').css('left'));
    $('#img-left-arrow').css('top', $('#Build_Modal').height()/2);
    $('#img-left-arrow').show();
    $('#img-left-arrow').click(function() {
        pos = $('#Build_Modal_Body').scrollLeft();
        $("#Build_Modal_Body").animate({scrollLeft: pos - 400}, 200);
    });

    $('#img-right-arrow').css('left', $('#Build_Modal').position().left + $('#Build_Modal').width() - $('#img-right-arrow').width());
    //$('#img-right-arrow').css('left', $('#Build_Modal').position().left + $('#Build_Modal').width());
    $('#img-right-arrow').css('top', $('#Build_Modal').height()/2);
    $('#img-right-arrow').show();
    $('#img-right-arrow').click(function() {
        pos = $('#Build_Modal_Body').scrollLeft();
        $("#Build_Modal_Body").animate({scrollLeft: pos + 400}, 200);
    });
}

function move_source_to_target() {
    $(".target-table").each(function() {
        if( $("tr", this).length >= 2 ) { // hide drag here
            $("tr", this).each(function() {
                if( $(this).text().indexOf('Drag Here') >= 0 ) {
                    $(this).hide();
                }
            });
        }
    });

    $(".source-table").each(function() {
        if( $("tr", this).length <= 2 ) { // show drag here
            $("tr", this).each(function() {
                if( $(this).text().indexOf('Drag Here') >= 0 ) {
                    $(this).show();
                }
            });
        }
    });
}

function move_target_to_source() {
    $(".source-table").each(function() {
        if( $("tr", this).length >= 2 ) { // hide drag here
            $("tr", this).each(function() {
                if( $(this).text().indexOf('Drag Here') >= 0 ) {
                    $(this).hide();
                }
            });
        }
    });

    $(".target-table").each(function() {
        if( $("tr", this).length <= 2 ) { // show drag here
            $("tr", this).each(function() {
                if( $(this).text().indexOf('Drag Here') >= 0 ) {
                    $(this).show();
                }
            });
        }
    });
}

// TODO: this may need branching out different applications
function add_application(softwares_id, json_data) {
    add_software = '<div class="software_entry">';
    add_software += '<a class="close" onclick="$(this).parent().remove();">&times;</a>';

    upgrade = '<hr style="display:block;margin-top:5px;margin-bottom:5px;border-style:inset;border-width:1px;">';
    upgrade += '<label>Upgrade (for OS compatible)?</label>';
    upgrade += '<div>';
    upgrade += '<select class="form-control sw_upgrade_selected">';

    // TODO: This is an example for upgrade..
    upgrade += '<option value="Microsoft SQL Server 2008 R2 (RTM)">Microsoft SQL Server 2008 R2 (RTM)</option>';
    upgrade += '<option value="Microsoft SQL Server 2012">Microsoft SQL Server 2012</option>';

    upgrade += '</select>';
    upgrade += '</div>';

    data = '<label>Choose Data to Migrate:</label>';
    data += '<div class="row-fluid">';

    sw_selected = $('#sw_selected').val();

    // TODO: maybe some sanity checks.
    softwares = json_data['softwares'];
    data_objects = undefined;
    for(var i = 0; i < softwares.length; i++) {
        if( softwares[i]['name'] == sw_selected ) {
            instances = softwares[i]['services'];
            for(var j = 0; j < instances.length; j++) {
                data_objects = instances[j]['objects'];
            }
        }
    }

    //console.log(data_objects);

    data += '<table class="span6 table-custom" style="height:140px;"><tbody class="connectedSortable source-table">';
    for(var i = 0; i < data_objects.length; i++) {
        data += '<tr class="movable_tr"><td>' + data_objects[i]['name'] + ' (' + data_objects[i]['type'] + ')</td></tr>';
    }
    data += '<tr style="display:none;"><td>Drag Here</td></tr>';
    data += '</tbody>';
    data += '</div>';

    // make the same number of empty cells
    data += '<table class="span6 table-custom" style="height:140px;"><tbody class="connectedSortable target-table"><tr><td>Drag Here</td></tr></tbody></div>';
    data += '</div>';

    //sw += '<script>$(function() { $( "#sortable1, #sortable2" ).sortable({ connectWith: ".connectedSortable" }).disableSelection(); });</script>';

    // Some scripts
    scripts = '<script>';
    scripts += '$(function() { $( ".source-table, .target-table" ).sortable({ connectWith: ".connectedSortable" }); });';

    // Moving from source to target
    scripts += '$(".source-table").mouseup(function() { move_source_to_target(); });';
    scripts += '$(".target-table").mouseup(function() { move_target_to_source(); });';

    scripts += '</script>';

    add_software += upgrade + data + scripts + '</div>';

    $('#'+softwares_id).append(add_software);
}

function add_add_role(add_softwares_id, json_data) {
    add_software = '<div class="add_software_entry">';
    add_software += '<a class="close" onclick="$(this).parent().remove();">&times;</a>';
    add_software += '<hr style="display:block;margin-top:5px;margin-bottom:5px;border-style:inset;border-width:1px;">';
    add_software += '<p class="add_software_input">' + $('#add_role_selected').val() + '</p>';
    add_software += '</div>';

    $('#'+add_softwares_id).append(add_software);
}

function add_add_recipe(add_softwares_id, json_data) {
    add_software = '<div class="add_software_entry">';
    add_software += '<a class="close" onclick="$(this).parent().remove();">&times;</a>';
    add_software += '<hr style="display:block;margin-top:5px;margin-bottom:5px;border-style:inset;border-width:1px;">';
    add_software += '<p class="add_software_input">' + $('#add_recipe_selected').val() + '</p>';
    add_software += '</div>';

    $('#'+add_softwares_id).append(add_software);
}

// UTILITIES

function toggle_password(elem, password) {
    if( $(elem).siblings('div').text().indexOf('******') >= 0 ) {
        $(elem).siblings('div').text(password);
        $(elem).text('Hide Password');
    } else {
        $(elem).siblings('div').text('******');
        $(elem).text('Show Password');
    }
}


function isJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function is_valid_ipv4(ip) {
    if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ip)) {
        return true;
    }
    return false;
}

function is_valid_ipv4s(ip_list) {
    ips = ip_list.split(',');
    for(i = 0; i < ips.length; i++) {
        if( ! is_valid_ipv4(ips[i]) ) {
            return false;
        }
    }
    return true;
}

// vis.js util (from http://visjs.org/examples/network/exampleUtil.js)
function loadJSON(path, success, error) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        success(JSON.parse(xhr.responseText));
      }
      else {
        error(xhr);
      }
    }
  };
  xhr.open('GET', path, true);
  xhr.send();
}

apps = ['PlantsByWebSphere'];
function getScaleFreeNetwork(nodeCount) {
  var nodes = [];
  var edges = [];
  var connectionCount = [];

  // randomly create some nodes and edges
  for (var i = 0; i < nodeCount; i++) {
    nodes.push({
      id: i,
      label: apps[(i % apps.length)],
      color: {background: 'skyblue'},
      ctype: 'app'
    });

    connectionCount[i] = 0;

    // create edges in a scale-free-network way
    if (i == 1) {
      var from = i;
      var to = 0;
      edges.push({
        from: from,
        to: to,
        label: ''
      });
      connectionCount[from]++;
      connectionCount[to]++;
    }
    else if (i > 1) {
      var conn = edges.length * 2;
      var rand = Math.floor(Math.random() * conn);
      var cum = 0;
      var j = 0;
      while (j < connectionCount.length && cum < rand) {
        cum += connectionCount[j];
        j++;
      }


      var from = i;
      var to = j;
      edges.push({
        from: from,
        to: to,
        label: ''
      });
      connectionCount[from]++;
      connectionCount[to]++;
    }
  }

  return {nodes:nodes, edges:edges};
}

var randomSeed = 764; // Math.round(Math.random()*1000);
function seededRandom() {
  var x = Math.sin(randomSeed++) * 10000;
  return x - Math.floor(x);
}

function getScaleFreeNetworkSeeded(nodeCount) {
  var nodes = [];
  var edges = [];
  var connectionCount = [];
  randomSeed = 764;

  // randomly create some nodes and edges
  for (var i = 0; i < nodeCount; i++) {
    nodes.push({
      id: i,
      label: String(i)
    });

    connectionCount[i] = 0;

    // create edges in a scale-free-network way
    if (i == 1) {
      var from = i;
      var to = 0;
      edges.push({
        from: from,
        to: to,
        label: ''
      });
      connectionCount[from]++;
      connectionCount[to]++;
    }
    else if (i > 1) {
      var conn = edges.length * 2;
      var rand = Math.floor(seededRandom() * conn);
      var cum = 0;
      var j = 0;
      while (j < connectionCount.length && cum < rand) {
        cum += connectionCount[j];
        j++;
      }


      var from = i;
      var to = j;
      edges.push({
        from: from,
        to: to,
        label: ''
      });
      connectionCount[from]++;
      connectionCount[to]++;
    }
  }

  return {nodes:nodes, edges:edges};
}

// ----------- Discovery Data Processing (ALDM)

var network;
var nodesDataset;
var edgesDataset;
var allNodes;
var allEdges;
var allRanks;

var ctypes = ['server', 'os', 'mw', 'instance', 'app'];

function getidx(list, item) {
    for(var i = 0; i < list.length; i++) {
        if(list[i] == item) {
            return i;
        }
    }
}

function graph_initialize(gdata) {
    // clean up.
    for(var i=0; i < gdata['nodes'].length; i++) {
        if( gdata['nodes'][i]['hidden'] == 0 ) {
            gdata['nodes'][i]['hidden'] = false;
        } else {
            gdata['nodes'][i]['hidden'] = true;
        }
    }

    for(var i=0; i < gdata['edges'].length; i++) {
        if( gdata['edges'][i]['hidden'] == 0 ) {
            gdata['edges'][i]['hidden'] = false;
        } else {
            gdata['edges'][i]['hidden'] = true;
        }

        if( gdata['edges'][i]['dashes'] == 1 ) {
            gdata['edges'][i]['dashes'] = true;
        }
    }

    nodesDataset = new vis.DataSet(gdata['nodes']);
    edgesDataset = new vis.DataSet(gdata['edges']);
    // ranksDataset = new vis.DataSet(gdata['ranks']);
    allNodes = nodesDataset.get({returnType:"Object"});
    allEdges = edgesDataset.get({returnType:"Object"});
    allRanks = gdata['ranks'];
}

function is_filter_on(ctype) {
    return !$('#graph_filter_' + ctype).hasClass('hollow');
}

function graph_upstream_nodes(nodeId, updateNodes, updateEdges) {
    var ctid = getidx(ctypes, allNodes[nodeId].ctype);
    for(var m in ctypes) {
        var ctype = ctypes[m];
        if( is_filter_on(ctype) ) {
            var pnodeId = allNodes[nodeId][ctype+'id'];
            if( pnodeId ) {
                allNodes[pnodeId].hidden = false;
                updateNodes.push(allNodes[pnodeId]);

                var pedgeIds = network.getConnectedEdges(pnodeId);
                for(var p in pedgeIds) {
                    var pedgeId = pedgeIds[p];

                    var sideNodes = network.getConnectedNodes(pedgeId);
                    if( !allNodes[sideNodes[0]].hidden && !allNodes[sideNodes[1]].hidden ) {
                        allEdges[pedgeId].hidden = false;
                        updateEdges.push(allEdges[pedgeId]);
                    }
                }
            }
        }
    }
}

// only local, so watch out ctype
function graph_downstream_nodes(nodeId, updateNodes, updateEdges) {
    //getidx(list, item);
    var edgeIds = network.getConnectedEdges(nodeId);
    for(var i in edgeIds) {
        var edgeId = edgeIds[i];
        var cnodeIds = network.getConnectedNodes(edgeId);
        for(var j in cnodeIds) {
            cnodeId = cnodeIds[j];
            if( getidx(ctypes, allNodes[nodeId].ctype) < getidx(ctypes, allNodes[cnodeId].ctype) ) { // only downstream.
                if( is_filter_on(allNodes[cnodeId].ctype) ) { // only turned on.
                    allNodes[cnodeId].hidden = false;
                    updateNodes.push(allNodes[cnodeId]);

                    var sideNodes = network.getConnectedNodes(edgeId);
                    if( !allNodes[sideNodes[0]].hidden && !allNodes[sideNodes[1]].hidden ) {
                        allEdges[edgeId].hidden = false;
                        updateEdges.push(allEdges[edgeId]);
                    }
                }
                graph_downstream_nodes(cnodeId, updateNodes, updateEdges); // traverse.
            }
        }
    }
}

function graph_filter_by_name(keywords) {
    var updateNodes = [];
    var updateEdges = [];
    var targetNodes = [];

    if( keywords == '' ) {
        for(var i in ctypes) {
            var ctype = ctypes[i];
            graph_redraw(ctype, is_filter_on(ctype), 'internal');
        }
        return;
    }

    var nodename_list = keywords.split(',');

    for(var nid in nodename_list) {
        var nodename = nodename_list[nid];
        //console.log(nodename);

        // find targted nodes, hide other nodes.
        for(var i in allNodes) {
            var nodeId = allNodes[i].id;

            if(allNodes[nodeId].label.toLowerCase().indexOf(nodename.toLowerCase()) < 0) {
                allNodes[nodeId].hidden = true;
                updateNodes.push(allNodes[nodeId]);

                var edgeIds = network.getConnectedEdges(nodeId);
                for(var j in edgeIds) {
                    var edgeId = edgeIds[j];
                    allEdges[edgeId].hidden = true;
                    updateEdges.push(allEdges[edgeId]);
                }
            } else {
                allNodes[nodeId].hidden = false;
                updateNodes.push(allNodes[nodeId]);
                targetNodes.push(allNodes[nodeId]);
            }
        }

        // show dependent nodes.
        for(var i in targetNodes) {
            var nodeId = targetNodes[i].id;

            //console.log(targetNodes[i].label);

            // remote connectivity (one-level local and remote)
            var edgeIds = network.getConnectedEdges(nodeId);

            //console.log(edgeIds);

            for(var j in edgeIds) {
                var edgeId = edgeIds[j];

                //console.log(edgeId);

                // NOTE: not sure why this happens.
                if( !edgeId ) continue;

                //console.log(allEdges[edgeId].label);

                // remote.
                if( allEdges[edgeId].label == 'remote' ) {
                    var sideNodes = network.getConnectedNodes(edgeId);
                    var rightNode = (sideNodes[0] == nodeId)? sideNodes[1]:sideNodes[0];
                    allNodes[rightNode].hidden = false;

                    if( !allNodes[sideNodes[0]].hidden && !allNodes[sideNodes[1]].hidden ) {
                        allEdges[edgeId].hidden = false;
                        updateEdges.push(allEdges[edgeId]);
                    }

                    // remote upstream & downstream.
                    graph_upstream_nodes(rightNode, updateNodes, updateEdges);
                    graph_downstream_nodes(rightNode, updateNodes, updateEdges);
                }

                // local upstream & downstream.
                graph_upstream_nodes(nodeId, updateNodes, updateEdges);
                graph_downstream_nodes(nodeId, updateNodes, updateEdges);
            }
        }
    }

    nodesDataset.update(updateNodes);
    edgesDataset.update(updateEdges);

    network.fit();
}

function graph_filter_by_param(selector) {
    var show_candidateNodes = [];
    var hide_candidateNodes = [];
    var updateNodes = [];
    var updateEdges = [];

    if(!selector) {
        selector = '.slider-custom';
    }

    for(var i in allNodes) {
        var node = allNodes[i];
        var server = allNodes[node.serverid];
        var node_show = true;

//console.log(JSON.stringify(node));

        // do not touch if not on.
        if( !is_filter_on(node['ctype']) ) continue;
        if( network.findNode(node['id'])[0] != node['id'] ) continue;

        var usage = server['usage'];
        if( isEmptyObject(usage) ) continue;

        $(selector).each(function() {
            var param = $(this).attr('id');
            var value = ($(this)[0]['value'] != '')? $(this)[0]['value']:Infinity;

            if(usage[param] >= value) {
                node_show = false;
            }
        });

        if(node_show) {
            show_candidateNodes.push(node);
        } else {
            hide_candidateNodes.push(node);
        }
    }

    for(var i in show_candidateNodes) {
        var node = show_candidateNodes[i];
        if( node.hidden == true ) { // just turn on if hidden.
            node.hidden = false;
            updateNodes.push(node);
        }
    }

    for(var i in updateNodes) {
        var node = updateNodes[i];
        var edgeIds = network.getConnectedEdges(node.id);
        for(var j in edgeIds) {
            var edgeId = edgeIds[j];
            var cnodeIds = network.getConnectedNodes(edgeId);
            for(var j in cnodeIds) {
                var cnodeId = cnodeIds[j];
                var cnode = allNodes[cnodeId];

                if(cnode == node) continue;

                // only when other node is shown.
                if(cnode.hidden == false && network.findNode(cnodeId)[0] == cnodeId) {
                    allEdges[edgeId].hidden = false;
                    updateEdges.push(allEdges[edgeId]);
                }
            }
        }
    }

    for(var i in hide_candidateNodes) {
        var node = hide_candidateNodes[i];
        var nodeId = node.id;

        if( node.hidden == false ) { // just turn off if not hidden.
            node.hidden = true;
            updateNodes.push(node);

            var edgeIds = network.getConnectedEdges(nodeId);
            for(var j in edgeIds) {
                var edgeId = edgeIds[j];
                allEdges[edgeId].hidden = true;
                updateEdges.push(allEdges[edgeId]);
            }
        }
    }

    nodesDataset.update(updateNodes);
    edgesDataset.update(updateEdges);

    network.fit();
}

function graph_filter_by_id(id) {
    var updateNodes = [];
    var updateEdges = [];
    var targetNodes = [];

    id = parseInt(id);

    if( id == -1 ) {
        for(var i in ctypes) {
            var ctype = ctypes[i];
            graph_redraw(ctype, is_filter_on(ctype), 'internal');
        }
        return;
    }

    // find targted node, hide other nodes.
    for(var i in allNodes) {
        var nodeId = allNodes[i].id;

        if(nodeId != id) {
            allNodes[nodeId].hidden = true;
            updateNodes.push(allNodes[nodeId]);

            var edgeIds = network.getConnectedEdges(nodeId);
            for(var j in edgeIds) {
                var edgeId = edgeIds[j];
                allEdges[edgeId].hidden = true;
                updateEdges.push(allEdges[edgeId]);
            }
        } else {
            allNodes[nodeId].hidden = false;
            updateNodes.push(allNodes[nodeId]);
            targetNodes.push(allNodes[nodeId]);
        }
    }

    // show dependent nodes.
    // remote connectivity (one-level local and remote)
    var edgeIds = network.getConnectedEdges(id);

    for(var j in edgeIds) {
        var edgeId = edgeIds[j];

        // NOTE: not sure why this happens.
        if( !edgeId ) continue;

        // remote.
        if( allEdges[edgeId].label == 'remote' ) {
            var sideNodes = network.getConnectedNodes(edgeId);
            var rightNode = (sideNodes[0] == id)? sideNodes[1]:sideNodes[0];
            allNodes[rightNode].hidden = false;

            if( !allNodes[sideNodes[0]].hidden && !allNodes[sideNodes[1]].hidden ) {
                allEdges[edgeId].hidden = false;
                updateEdges.push(allEdges[edgeId]);
            }

            // remote upstream & downstrem.
            graph_upstream_nodes(rightNode, updateNodes, updateEdges);
            graph_downstream_nodes(rightNode, updateNodes, updateEdges);
        }

        // local upstream & downstream.
        graph_upstream_nodes(id, updateNodes, updateEdges);
        graph_downstream_nodes(id, updateNodes, updateEdges);
    }

    nodesDataset.update(updateNodes);
    edgesDataset.update(updateEdges);

    network.fit();
}

var cluster_nodes = [];
var cuts = [];
function cluster_graph(cluster_ids, stat) {
    for (var c = 0; c < ctypes.length; c++) {
        if (!is_filter_on(ctypes[c])) { 
            graph_redraw(ctypes[c], true, 'internal');
        }
    }

    var options = {};
    var scale = network.getScale();
    var pos_x = (-90 / scale) * cluster_ids.length / 2;
    var pos_y = -400 / scale;
    var length = 0;
    for (var i = 0; i < cluster_ids.length; i++) {
        options = {
            joinCondition: function(nodeOptions) {
                return cluster_ids[i].indexOf(nodeOptions['serverid']) >= 0;
            },
            processProperties: function(clusterOptions, childNodes) {
                var data = {};
                for (var j = 0; j < ctypes.length; j++) {
                    data[ctypes[j]] = 0;
                    data[ctypes[j] + '_list'] = [];
                }

                for (var j = 0; j < childNodes.length; j++) {
                    var child = childNodes[j];
                    for (var k = 0; k < ctypes.length; k++) {
                        if (child['ctype'] == ctypes[k]) {
                            data[ctypes[k]] += 1;
                            data[ctypes[k] + '_list'].push(child['label']);
                            break;
                        }
                    }
                }

                var node_label = 'Average ' + stat + ': ' + Math.round(cluster_ids[i][0]);
                node_label += '\nNumber of Applications: ' + data['app'];
                node_label += '\nNumber of Servers: ' + data['server'];
                node_label += '\n\nClick for details\nDouble-click to expand';

                data['stat'] = stat;
                data['avg'] = Math.round(cluster_ids[i][0]);
                data['id'] = 'cluster:' + i;
                data['x'] = pos_x;
                data['y'] = pos_y;
                cluster_nodes.push(data);

                clusterOptions.label = node_label;
                clusterOptions.id = 'cluster:' + i;

                return clusterOptions;
            },
            clusterNodeProperties: {
                borderWidth: 3,
                shape: 'box',
                color: 'rgba(142, 142, 142, 0.7)',
                physics: false,
                fixed: false,
                font: {
                    color: 'white',
                    size: 30
                },
                x: pos_x,
                y: pos_y
            },
            clusterEdgeProperties: {
                hidden: true,
                physics: false
            }
        };
        network.clustering.cluster(options);
        if (i == 0) {
            var box = network.getBoundingBox('cluster:' + i);
            length = box['right'] - box['left'];
        }
        pos_x = pos_x + length + (10 / scale);
    }

    network.fit();
}

function recluster(cluster_ids, stat) {
    for (var c = 0; c < ctypes.length; c++) {
        if (!is_filter_on(ctypes[c])) { 
            graph_redraw(ctypes[c], true, 'internal');
        }
    }

    var options = {};
    var scale = network.getScale();
    for (var i = 0; i < cluster_ids.length; i++) {
        var id = 'cluster:' + i;
        if (network.isCluster(id)) {
            network.moveNode(id, cluster_nodes[i]['x'], cluster_nodes[i]['y']);
        } else {
            options = {
                joinCondition: function(nodeOptions) {
                    return cluster_ids[i].indexOf(nodeOptions['serverid']) >= 0;
                },
                processProperties: function(clusterOptions, childNodes) {
                    var node_label = 'Average ' + stat + ': ' + Math.round(cluster_ids[i][0]);
                    node_label += '\nNumber of Applications: ' + cluster_nodes[i]['app'];
                    node_label += '\nNumber of Servers: ' + cluster_nodes[i]['server'];
                    node_label += '\n\nClick for details\nDouble-click to expand';

                    clusterOptions.label = node_label;
                    clusterOptions.id = 'cluster:' + i;

                    return clusterOptions;
                },
                clusterNodeProperties: {
                    borderWidth: 3,
                    shape: 'box',
                    shapeProperties: {
                        borderRadius: 10
                    },
                    color: 'rgba(142, 142, 142, 0.7)',
                    physics: false,
                    fixed: false,
                    font: {
                        color: 'white',
                        size: 30
                    },
                    x: cluster_nodes[i]['x'],
                    y: cluster_nodes[i]['y']
                },
                clusterEdgeProperties: {
                    hidden: true,
                    physics: false
                }
            };
            network.clustering.cluster(options);
        }
    }

    network.fit();
    network.stopSimulation();
}

function uncluster() {
    var options = {
            nodes: {
                shape: 'box',
                borderWidth: 1,
                shadow:true,
                color: {background:'white', border:'white'}
            },
            edges: {
                width: 2,
                shadow: true,
                color: {color:'black', opacity:1.0},
                font: {align: 'top'},
                smooth: {type:'continuous'}
            },
            layout: {
                improvedLayout: false
            },
            physics: {
                enabled: false,
                stabilization: {
                    enabled: false
                }
            }
    };
    // network.setOptions(options);

    // var data = {
    //     nodes: nodesDataset,
    //     edges: edgesDataset
    // };
    // network.setData(data);

    for (var i = 0; i < cluster_nodes.length; i++) {
        if (network.isCluster(cluster_nodes[i]['id'])) {
            network.openCluster(cluster_nodes[i]['id']);
        }
    }

    var ids = nodesDataset.getIds();
    for (var i in ids) {
        var id = ids[i];
        var node = nodesDataset.get(id);
        var x = node['x'];
        var y = node['y'];
        network.moveNode(id, x, y);
    }

    cluster_nodes = [];
    cuts = [];

    for(var i in ctypes) {
        var ctype = ctypes[i];
        graph_redraw(ctype, is_filter_on(ctype), 'internal');
        console.log(is_filter_on(ctype));
    }

    network.fit();
}

function contains(list, element) {
    for (var i in list) {
        if (list[i] == element) return true;
    }
    return false;
}

// TODO efficient way? too much time.
function is_unique(edges, node1, node2) {
    var unique = true;
    for(var l in edges) { // no duplicates
        if( (edges[l]['from'] == node1 && edges[l]['to'] == node2) ||
            (edges[l]['from'] == node2 && edges[l]['to'] == node1) ) {
            unique = false;
            break;
        }
    }
    return unique;
}

// NOTE: obsolete. this is handled in the server now.
function graph_data_generate(gdata) {
    var nid = 1;
    var nodes = [];
    var edges = [];

    //console.log({}.test());
    //console.log(['a', 'b'].contains('a'));

    // local edges under each server
    // server
    for(var h in gdata['hosts']) {
        var server = gdata['hosts'][h];
        var serverid = nid++;

        var assocs = [];
        for(var q in server['associations']) {
            assocs.push(server['associations'][q]['refid']);
        }
        nodes.push({id:serverid, serverid:serverid, label: vget(server, 'hostname', 'unknown').trim(), color: {background: '#2199e8'}, font: {color: 'white'}, ctype: 'server', cid: vget(server, 'ids', ''), refids: assocs.join(), hidden: true});

        // os
        var os = server['os'];
        var osid = nid++;
        var os_distribution = vget(os, 'distribution');
        if( os_distribution ) { // no need to add os.
            if( os_distribution == 'unknown' ) {
                os_distribution = vget(os, 'name', 'UNKNOWN');
            }
            nodes.push({id:osid, serverid: serverid, label: os_distribution.trim(), color: {background: '#3adb76'}, font: {color: 'white'}, ctype: 'os', cid: undefined, hidden: true});
            edges.push({from: serverid, to: osid, label: '', hidden: true, ctype: 'os-server' });
        }

        // Warning: if objects do not exist under 'instance', just put as 'app' (no need mw and instance)

        // mw
        for(var i in server['softwares']) {
            var mw = server['softwares'][i];
            var mw_exist = false;
            if( mw['services'] ) {
                if( mw['services'][0] ) {
                    if( mw['services'][0]['objects'] ) {
                        mw_exist = true;
                    }
                }
            }

            if( mw_exist ) {
                var mwid = nid++;

                var assocs = [];
                for(var q in mw['associations']) {
                    assocs.push(mw['associations'][q]['refid']);
                }

                nodes.push({id:mwid, serverid: serverid, osid: osid, servername: server['hostname'], label: vget(mw, 'name', 'UNKNOWN').trim(), color: {background: '#5bc0de'}, font: {color: 'white'}, ctype: 'mw', cid: mw['id'], refids: assocs.join(), hidden: true});
                edges.push({from: osid, to: mwid, label: '', hidden: true, ctype: 'server-mw' }); // local conns.

                // instance
                for(var j in mw['services']) {
                    var instance = mw['services'][j];
                    var instanceid = nid++;

                    var assocs = [];
                    for(var q in instance['associations']) {
                        assocs.push(instance['associations'][q]['refid']);
                    }

                    nodes.push({id: instanceid, serverid: serverid, osid: osid, servername: server['hostname'], color: {background: '#ffae00'}, font: {color: 'white'}, mwid: mwid, mwname: mw['name'], label: vget(instance, 'name', 'UNKNOWN').trim(), ctype: 'instance', cid: instance['id'], refids: assocs.join(), hidden: true});
                    edges.push({from: mwid, to: instanceid, label: '', ctype: 'mw-instance', hidden: true}); // local conns.

                    // app
                    for(var k in instance['objects']) {
                        var obj = instance['objects'][k];
                        var objid = nid++;

                        var assocs = [];
                        for(var q in obj['associations']) {
                            assocs.push(obj['associations'][q]['refid']);
                        }

                        nodes.push({id: objid, serverid: serverid, osid: osid, instanceid: instanceid, mwid: mwid, servername: server['hostname'], mwname: mw['name'], instancename: instance['name'], label: vget(obj, 'alias', 'UNKNOWN').trim(), color: {background: '#ec5840'}, font: {color: 'white'}, ctype: 'app', cid: obj['id'], refids: assocs.join(), hidden: false});
                        edges.push({from: instanceid, to: objid, label: '', ctype: 'instance-app', hidden: true}); // local conns.
                    }
                }
            } else { // mw_exist == false
                // we ignore instance because objects do not exist.
                var obj = mw;
                var objid = nid++;

                var assocs = [];
                for(var q in obj['associations']) {
                    assocs.push(obj['associations'][q]['refid']);
                }

                nodes.push({id: objid, serverid: serverid, osid: osid, servername: server['hostname'], osname: os_distribution.trim(), label: vget(obj, 'name', 'UNKNOWN').trim(), color: {background: '#ec5840'}, font: {color: 'white'}, ctype: 'app', cid: obj['id'], refids: assocs.join(), hidden: false});
                edges.push({from: osid, to: objid, label: '', ctype: 'os-app', hidden: true}); // local conns.
            }
        }
    }

    //console.log(JSON.stringify(edges, null, 4));
    //console.log(JSON.stringify(nodes, null, 4));

    // Remote (Assocation Edges) - iterate one more time to see edge: { 'refid', 'cid' }
    // Propagate the link to upper layers (server-server, mw-mw, instance-instance, app-app), but do not show at the beginning
    for(var i in nodes) {
        if( nodes[i]['refids'] ) {
            var refids = nodes[i]['refids'].split(',');

            for( var j in refids ) {
                for( var k in nodes ) {

                    //console.log('before: ' + nodes[i]['label'] + ' / ' + nodes[k]['label']);

                    if( nodes[i] == nodes[k] )
                        continue;

                    //console.log('after: ' + nodes[i]['label'] + ' / ' + nodes[k]['label']);

                    // allow only same types connections, e.g., server-server, mw-mw, instance-instance, app-app
                    if( nodes[i]['ctype'] != nodes[k]['ctype'])
                        continue;

                    // TODO: check here to hide edges...
                    if( contains(vget(nodes[k], 'cid', '').split(','), refids[j]) ) {
                        if( is_unique(edges, nodes[i]['id'], nodes[k]['id']) ) {
                            var mode = 'remote';

                            // check 'serverid' to decide 'local' or 'remote' and 'dash' or 'solid'
                            if( nodes[i]['serverid'] == nodes[k]['serverid'] ) {
                                mode = 'local';
                            }

                            if( mode == 'remote' ) {
                                var hidden = true;
                                if( is_filter_on(nodes[i]['ctype']) && is_filter_on(nodes[k]['ctype']) ) {
                                    var hidden = false;
                                }
                                edges.push({from: nodes[i]['id'], to: nodes[k]['id'], label: 'remote', ctype: nodes[i]['ctype'] + '-' + nodes[k]['ctype'], dashes:true, hidden: hidden});

                                // upstream
                                ctid = getidx(ctypes, nodes[i]['ctype']);
                                for(var m = ctid; m >= 0; m--) {
                                    if( is_unique(edges, nodes[i]['id'], nodes[k]['id']) ) { // this is lots of iterations.
                                        edges.push({from: nodes[i][ctypes[m]+'id'], to: nodes[k][ctypes[m]+'id'], label: 'remote', ctype: ctypes[m] + '-' + ctypes[m], dashes:true, hidden: true});
                                    }
                                }
                            } else {
                                edges.push({from: nodes[i]['id'], to: nodes[k]['id'], label: 'local', ctype: nodes[i]['ctype'] + '-' + nodes[k]['ctype'], hidden: false});
                            }
                        }
                    }
                }
            }
        }
    }

    var graph_data = { nodes: nodes, edges: edges, };
    graph_initialize(graph_data);

    return graph_data;
}

function getnode(nodeid) {
    for(var i in allNodes) {
        if(allNodes[i]['id'] == nodeid) {
            return allNodes[i];
        }
    }
    return null;
}

function getedge(edgeid) {
    for(var i in allEdges) {
        if(allEdges[i]['id'] == edgeid) {
            return allEdges[i];
        }
    }
    return null;
}

function get_network_data(net_data) {
    var output = {};
    var data = [], keys = [], items = {};
    var num_item = Infinity;

    for(var inf in net_data) {
        var points = net_data[inf].split(',')
        if(points.length <= 1) continue;

        keys.push(inf);
        items[inf] = points;
        if( num_item > items[inf].length )  num_item = items[inf].length;
    }
    if(num_item == Infinity) num_item = 0;

    var xitem = 1, max_value = 0;
    for(var i=0; i < num_item; i++) {
        var each = { 'xitem': xitem };
        for(var j in keys) {
            var key = keys[j];
            each[key] = items[key][i];
            if(max_value < parseInt(items[key][i])) {
                max_value = parseInt(items[key][i]);
            }
        }
        data.push(each);
        xitem ++;
    }

    output['data'] = data;
    output['max_value'] = max_value;

    console.log(output);

    return output;
}

// NOTE: for now, just show details of each server.
// it can be a specific to each ctype.
function show_node_details(node_json) {
    $('.server-details').empty();

    $.get('/host?hostname='+node_json['servername'], null, function(data) {
        if( data['status'].indexOf('OK') >= 0 ) {
//console.log(JSON.stringify(data['message']));
            var server = data['message'];

//console.log(JSON.stringify(server, null, 4));

            // TODO: details show formatting.
            var html = '<div class="questionnaire-div"><button class="questionnaire-btn btn btn-primary btn-sm">Transform</button></div>'
            html += '<h3>Node Info: ' + server['hostname'] + '</h3>';
            html += '<h4 class="align-left">' + server['softwares'].length + ' Applications (Middlewares)</h4>';
            // each application table.
            var app_html = '';
            for(var i in server['softwares']) {
                var app = server['softwares'][i];

                app_html += '<p class="align-left" style="padding-top:5px;margin:0px;"># ' + app['name'] + '</p>';
                app_html += '<table class="table-summary"><tbody>';
                app_html += '<tr><td>' + 'Name'  + '</td><td>' + app['name'] + '</td></tr>';
                app_html += '<tr><td>' + 'Version'  + '</td><td>' + app['version'] + '</td></tr>';
                app_html += '<tr><td>' + 'Vendor'  + '</td><td>' + app['vendor'] + '</td></tr>';
                app_html += '<tr><td>' + 'Directory'  + '</td><td>' + app['directory'] + '</td></tr>';

                app_html += '<tr><td>' + 'Number of Services'  + '</td><td>' + app['services'].length + '</td></tr>';

                app_html += '<tr><td>Services</td><td><ul class="noindent">';
                for(var j in app['services']) {
                    var service = app['services'][j];
                    app_html += '<li>' + service['name'] + '</li>';
                    app_html += '<ul class="noindent">';
                    for(var k in service['objects']) {
                        var obj = service['objects'][k];
                        app_html += '<li>' + obj['alias'] + ' (' + obj['type'] + ')' + '</li>';
                    }
                    app_html += '</ul>';
                }
                app_html += '</ul></td></tr>';


                app_html += '</tbody></table>';
            }
            html += app_html;

            $('.server-details').append(html); html = '';

            $('.server-details').append('<hr><h4 class="align-left">Server Information</h4>');

            var platform = server['platform'];
            html += '<p class="align-left" style="padding-top:5px;margin:0px;"># Platform </p>';
            html += '<table class="table-summary"><tbody>';
            html += '<tr><td>' + 'Name'  + '</td><td>' + platform['name'] + '</td></tr>';
            html += '<tr><td>' + 'Vendor'  + '</td><td>' + platform['vendor'] + '</td></tr>';
            html += '<tr><td>' + 'BIOS'  + '</td><td>' + platform['biosversion'] + '</td></tr>';
            html += '<tr><td>' + 'CPU'  + '</td><td>' + platform['cpucount'] + ' (' + platform['cpuspeed'] + 'Hz) </td></tr>';
            html += '<tr><td>' + 'Memory (MB)'  + '</td><td>' + platform['memory_mb'] + '</td></tr>';
            html += '<tr><td>' + 'Disk (GB)'  + '</td><td>' + platform['disk_total_gb'] + ' (' + platform['disks'].length + ' disks)</td></tr>';
            html += '<tr><td>Disk</td><td><ul class="noindent">';
            for(var i in platform['disks']) {
                var disk = platform['disks'][i];
                html += '<li>' + disk['alias'] + '</li>';
                html += '<ul class="noindent">';
                for(var key in disk) {
                    if(key == 'alias') continue;
                    html += '<li>' + key + ': ' + disk[key] + '</li>';
                }
                html += '</ul>';
            }
            html += '</ul></td></tr>';

            html += '<tr><td>' + 'Serial'  + '</td><td>' + platform['serial'] + '</td></tr>';
            html += '<tr><td>' + 'UUID'  + '</td><td>' + platform['uuid'] + '</td></tr>';
            html += '</tbody></table>';
            $('.server-details').append(html); html = '';

            var os = server['os'];
            html += '<p class="align-left" style="padding-top:5px;margin:0px;"># Operating System </p>';
            html += '<table class="table-summary"><tbody>';
            html += '<tr><td>' + 'Name'  + '</td><td>' + os['name'] + '</td></tr>';
            html += '<tr><td>' + 'Distribution'  + '</td><td>' + os['distribution'] + '</td></tr>';
            html += '<tr><td>' + 'Version'  + '</td><td>' + os['version'] + '</td></tr>';
            html += '<tr><td>' + 'OS Fix Pack'  + '</td><td>' + os['os_fixpack'] + '</td></tr>';
            html += '</tbody></table>';
            $('.server-details').append(html); html = '';

            var network = server['networks'];
            if( network ) {
                html += '<p class="align-left" style="padding-top:5px;margin:0px;"># Networks </p>';
                html += '<table class="table-summary"><tbody>';
                html += '<tr><td>' + 'Number of Interfaces'  + '</td><td>' + network['interfaces'].length + '</td></tr>';

                html += '<tr><td>Interfaces</td><td><ul class="noindent">';
                for(var i in network['interfaces']) {
                    var inf = network['interfaces'][i];
                    html += '<li>' + inf['name'] + '</li>';
                    html += '<ul class="noindent">';
                    for(var key in inf) {
                        if(key == 'name') continue;
                        html += '<li>' + key + ': ' + inf[key] + '</li>';
                    }
                    html += '</ul>';
                }
                html += '</ul></td></tr>';
                html += '</tbody></table>';
                $('.server-details').append(html); html = '';
            }

            $('.server-details').append('<hr><h4 class="align-left">HW Resource Usage</h4>');

            var stats = server['usage']['stats'];
            html += '<p class="align-left" style="padding-top:5px;margin:0px;"># Statistics </p>';
            html += '<table class="table-summary"><thead><tr><th>Type</th><th>Average</th><th>Standard Deviation</th><th>Minimum</th><th>Maximum</th></tr></thead><tbody>';
            html += '<tr><td>CPU (%)</td><td>' + stats['cpu_usage_avg'] + '</td><td>' + stats['cpu_usage_std'] + '</td><td>' + stats['cpu_usage_min'] + '</td><td>' + stats['cpu_usage_max'] + '</td></tr>';
            html += '<tr><td>Memory (%)</td><td>' + stats['memory_usage_avg'] + '</td><td>' + stats['memory_usage_std'] + '</td><td>' + stats['memory_usage_min'] + '</td><td>' + stats['memory_usage_max'] + '</td></tr>';
            html += '<tr><td>Disk (%)</td><td>' + stats['disk_usage_avg'] + '</td><td>' + stats['disk_usage_std'] + '</td><td>' + stats['disk_usage_min'] + '</td><td>' + stats['disk_usage_max'] + '</td></tr>';
            html += '<tr><td>Disk Read (KB)</td><td>' + stats['disk_read_kb_avg'] + '</td><td>' + stats['disk_read_kb_std'] + '</td><td>' + stats['disk_read_kb_min'] + '</td><td>' + stats['disk_read_kb_max'] + '</td></tr>';
            html += '<tr><td>Disk Write (KB)</td><td>' + stats['disk_write_kb_avg'] + '</td><td>' + stats['disk_write_kb_std'] + '</td><td>' + stats['disk_write_kb_min'] + '</td><td>' + stats['disk_write_kb_max'] + '</td></tr>';
            html += '<tr><td>Network In (KB)</td><td>' + stats['network_in_kb_avg'] + '</td><td>' + stats['network_in_kb_std'] + '</td><td>' + stats['network_in_kb_min'] + '</td><td>' + stats['network_in_kb_max'] + '</td></tr>';
            html += '<tr><td>Network Out (KB)</td><td>' + stats['network_out_kb_avg'] + '</td><td>' + stats['network_out_kb_std'] + '</td><td>' + stats['network_out_kb_min'] + '</td><td>' + stats['network_out_kb_max'] + '</td></tr>';

            html += '</tbody></table>';
            $('.server-details').append(html); html = '';

            $('.server-details').append('<p class="align-left" style="padding-top:5px;margin:0px;"># Usage Graphs </p>');
            var raws = server['usage']['raws'];
            var data = raws['cpu_usage_raw'].split(',');
            $('.server-details').append('CPU Usage <div id="cpu_usage_raw"></div>');
            lineGraph('#cpu_usage_raw', data, 100, 1, 'Time', 'Percent (%)');

            var data = raws['memory_usage_raw'].split(',');
            $('.server-details').append('Memory Usage <div id="memory_usage_raw"></div>');
            lineGraph('#memory_usage_raw', data, 100, 1, 'Time', 'Percent (%)');

            var data = raws['disk_read_kb_raw'].split(',');
            $('.server-details').append('Disk Read <div id="disk_read_kb_raw"></div>');
            lineGraph('#disk_read_kb_raw', data, Math.max.apply(Math, data), 1, 'Time', 'KBytes');

            var data = raws['disk_write_kb_raw'].split(',');
            $('.server-details').append('Disk Write <div id="disk_write_kb_raw"></div>');
            lineGraph('#disk_write_kb_raw', data, Math.max.apply(Math, data), 1, 'Time', 'KBytes');

            var net_data = get_network_data(raws['network_in_kb']);
            $('.server-details').append('Network In <div id="network_in_kb_raw"></div>');
            multipleLineGraph('#network_in_kb_raw', net_data['data'], net_data['max_value'], 1, 'Time', 'KBytes');

            var net_data = get_network_data(raws['network_out_kb']);
            $('.server-details').append('Network Out <div id="network_out_kb_raw"></div>');
            multipleLineGraph('#network_out_kb_raw', net_data['data'], net_data['max_value'], 1, 'Time', 'KBytes');

            $('.server-details').append('<hr><h4 class="align-left">Geographical Map</h4>');

            if('geo_data' in server) {
                var mapData = server['geo_data'];
                draw_geomap('geomap-details', mapData);
            } else {
                draw_geomap('geomap-details', []);
            }
            $('#geomap-details').find('a').remove(); // remove link

            //$('.server-details').append(html);
            $('.sidetab-details').css('right', '1%');
        } else {
            alert('Failed to retrieve host data, please try again later: ' + data['message']);
        }
    },'json')
    .fail(function(data) {
        alert('Failed to retrieve host data, please try again later');
    });
}

// TODO: add more info to edges.
function show_edge_details(edge_json) {
    // TBD
    //$('.sidetab-details').empty();
    //$('.sidetab-details').text(JSON.stringify(edge_json));
    //$('.sidetab-details').css('right', '1%');

    /*
    $.get('/host?hostname='+edge_json['servername'], null, function(data) {
        if( data['status'].indexOf('OK') >= 0 ) {
            //var usage = data['message']['usage'];

            $('.sidetab-details').text(data['message']);
            //$('.sidetab-details').append(html);
            $('.sidetab-details').css('right', '1%');
        } else {
            alert('Failed to retrieve host data, try again later: ' + data['message']);
        }
    },'json')
    .fail(function(data) {
        alert('Failed to retrieve host data, try again later');
    });
    */
}

var ctype_names = ['Server', 'Operating System', 'Middleware', 'Instance', 'Application'];
function show_cluster_details(data) {
    $('.cluster-details').empty();

    var html = '<h3>Cluster Info: ' + data['stat'] + ': ' + data['avg'] + '</h3><hr>';
    html += '<table class="table table-hover table-bordered"><thead><th>Cluster Contents</th></thead>';
    html += '<tbody>';

    for (var i = (ctypes.length - 1); i >= 0; i--) {
        var ctype = ctypes[i];
        html += '<tr onclick="$(this).next().toggle();">';
        html += '<td>' + data[ctype] + ' ' + ctype_names[i] + 's</td>';
        html += '</tr>';
        
        html += '<tr style="display:none;background-color:#C1F3FE;"><td>';
        var list = data[ctype + '_list'];
        for (var j = 0; j < list.length; j++) {
            html += '<p>' + list[j] + '</p>';
        }
        html += '</td></tr>';
    }

    //html += '<h4 class="align-left">' + data['server'] + ' Servers, ';
    //html += data['os'] + ' Operating Systems, ';
    //html += data['mw'] + ' Middlewares, ';
    //html += data['instance'] + ' Instances, ';
    //html += data['app'] + ' Applications</h4>';

    html += '</tbody></table>'; 

    $('.cluster-details').append(html);

    $('.sidetab-cluster').css('right', '1%');
}

// TODO: Automatically combine general questions with application specific questions
function generate_questionnaire(application) {
    $.get('/questionnaire?application=general', null, function(data) {
        if( data['status'].indexOf('OK') >= 0 ) {
            var questions = data['message'];
            $.get('/questionnaire?application=' + application, null, function(app_data) {
                if( app_data['status'].indexOf('OK') >= 0 ) {
                    var app_questions = app_data['message'];
                    var sub = questions['sections'][0]['subsections'];
                    for( i in app_questions['sections'][0]['subsections'] ) {
                        sub.push(app_questions['sections'][0]['subsections'][i]);
                    }
                    show_questionnaire(questions);
                } else {
                    alert('Failed to retrieve questionnaire data, please try again later: ' + data['message']);
                }
            }, 'json')
            .fail(function(app_data) {
                alert('Failed to retrieve application questionnaire data, please try again later.');
            });
        } else {
            alert('Failed to retrieve questionnaire data, please try again later: ' + data['message']);
        }
    }, 'json')
    .fail(function(data) {
        alert('Failed to retrieve general questionnaire data, please try again later.');
    });
}

function show_questionnaire(questions) {
    $('.sidetab-questionnaire').empty();

    // create html form with json
    var html = '<div class="close-tab"><button class="close-btn" id="close-questionnaire">&times;</button></div>';
    html += '<form class="section_container" id="form" action="questionnaire" method="post"><div class="sections">';
    var section_num = 1;
    for(var i in questions['sections']) {
        var section = questions['sections'][i];

        var subsection_num = 1;
        for(var j in section['subsections']) {
            var subsection = section['subsections'][j];
            html += '<div class="section">';
            html += '<h2>Section ' + section_num + ': ' + section['title'] + '</h2>';
            html += '<div class="subsection">';
            if('title' in subsection) {
                html += '<h3>' + subsection_num + ') ' + subsection['title'] + '</h3>';
            }
            if('description' in subsection) {
                html += '<label class="description">' + subsection['description'] + '</label><br>';
            }

            for(var k in subsection['questions']) {
                var question = subsection['questions'][k];
                html += '<div class="question">';
                html += '<label>' + question['question'] + '</label><br>';

                if('description' in question) {
                    html += '<label class="description">' + question['description'] + '</label><br>';
                }

                if('type' in question) {
                    if(question['type'] == 'radio') {
                        for(var l in question['options']){
                            var opt = question['options'][l]
                            html += '<input type="radio" value="' + opt + '" name="' + question['question'] + '" required> ' + opt + '<br>';
                        }
                    } else if (question['type'] == 'textarea') {
                        html += '<textarea>' + question['answer'] + '</textarea>';
                    } else if (question['type'] == 'number') {
                        html += '<input type="number" min="0" value="' + question['answer'] + '" name="' + question['question'] + '" required>';
                    } else {
                        html += '<input type="' + question['type'] + '" value="' + question['answer'] + '" name="' + question['question'] + '" required>';
                    }
                } else {
                    html += '<div class="subquestion"><ul>';
                    for(var l in question['subquestions']) {
                        var subquestion = question['subquestions'][l];

                        html += '<li>' + subquestion['subquestion'] + '<br>';

                        if('description' in subquestion) {
                            html += '<label class="description">' + subquestion['description'] + '</label><br>';
                        }
                        if (subquestion['type'] == 'number') {
                            html += '<input type="number" min="0" value="' + subquestion['answer'] + '" name="' + subquestion['subquestion'] + '" required>';
                        } else {
                            html += '<input type="' + subquestion['type'] + '" value="' + subquestion['answer'] + '" name="' + subquestion['subquestion'] + '" required>';
                        }
                        html += '</li><br>'; // subquestion
                    }
                    html += '</ul></div>'; //subquestion
                }

                if('comments' in question) {
                    html += '<label>Comments</label><br>';
                    html += '<textarea value="' + question['comments'] + '"/>';
                }

                html += '</div><br>'; // question
            }

            html += '<div class=form_nav>';
            if(section_num == 1 && subsection_num == 1) {
                html += '<a class="next btn btn-primary btn-sm">Next&raquo;</a>';
            } else if (section_num == (Object.getOwnPropertyNames(questions['sections']).length - 1) &&
                        subsection_num == (Object.getOwnPropertyNames(section['subsections']).length - 1)) {
                html += '<a class="previous btn btn-primary btn-sm">&laquo;Previous</a> <input type="submit" class="btn btn-primary btn-sm" value="Submit Questionnaire">';
            } else {
                html += '<a class="previous btn btn-primary btn-sm">&laquo;Previous</a> <a class="next btn btn-primary btn-sm">Next&raquo;</a>';
            }
            html += '</div></div></div>'; // form_nav, subsection, section
            subsection_num ++;
        }

        section_num ++;
    }
    html += '</div></form>'; // sections, section_container

    $('.sidetab-questionnaire').empty().append(html);
    $('.sidetab-questionnaire').css('right', '10%');
}

function graph_draw(input, id) {
    var container = document.getElementById(id);
    var data = {
        nodes: nodesDataset,
        edges: edgesDataset
    };

    // some performance options: smooth, improvedLayout
    var options = {
            nodes: {
                shape: 'box',
                borderWidth: 1,
                shadow:true,
                color: {background:'white', border:'white'}
            },
            edges: {
                width: 2,
                shadow: true,
                color: {color:'black', opacity:1.0},
                font: {align: 'top'},
                smooth: {type:'continuous'}
            },
            layout: {
                improvedLayout: false
            },
            physics: {
                stabilization: {
                    iterations: 800,
                    updateInterval: 5
                }
            }
    };
    network = new vis.Network(container, data, options);

    var time_double_click = 0;
    network.on("click", function (params) {
        $('.sidetab-details').css('right', '-50%'); // hide
        $('.sidetab-cluster').css('right', '-50%'); // hide

        // when node is clicked, edge is also clicked.
        // so, concatenate ifs to avoid this situation.
        if( params['nodes'].length > 0 ) {
            if (network.isCluster(params['nodes'][0])) {
                var t0 = new Date();
                setTimeout(function() {
                    if (t0 - time_double_click > 300) {
                        var selected_cluster = cluster_nodes[params['nodes'][0].split(':')[1]];
                        show_cluster_details(selected_cluster);
                    }
                }, 300);
            } else {
                //console.log(params);
                //console.log('node id: ' + params['nodes'][0]);
                show_node_details(getnode(params['nodes'][0]));                
            }
        } else if( params['edges'].length > 0 ) {
            // console.log('edge id: ' + params['edges'][0]);
            show_edge_details(getedge(params['edges'][0]));
        } else { // background is clicked.
        }
        //params.event = "[original event]";
        //document.getElementById('eventSpan').innerHTML = '<h2>Click event:</h2>' + JSON.stringify(params, null, 4);
    });

    $(document).on("click", "#close-questionnaire", function() {
        $('.sidetab-questionnaire').css('right', '-100%');
    });

    $(document).on("click", ".questionnaire-btn", function() {
        $('.sidetab-details').css('right', '-100%');
        generate_questionnaire('websphere');
    })

    network.on("doubleClick", function (params) {
        $('.cluster-details').css('right', '-50%');
        if (params['nodes'].length > 0) {
            if (network.isCluster(params['nodes'][0])) {
                time_double_click = new Date();

                var id = params['nodes'][0];

                var selected_nodes = network.getNodesInCluster(id);

                var release_positions = {
                    releaseFunction: function(clusterPosition, containedNodesPositions) {
                        var new_positions = {};
                        for (var id in containedNodesPositions) {
                            if (containedNodesPositions.hasOwnProperty(id)) {
                                var node = nodesDataset.get(id);
                                new_positions[id] = {x: node['x'], y: node['y']};
                            }
                        }
                        return new_positions;
                    }
                };

                network.openCluster(id, release_positions);

                var updateEdges = [];
                for (var i = 0; i < selected_nodes.length; i++) {
                    var selected_node = getnode(selected_nodes[i]);
                    if (selected_node['ctype'] == 'server') {
                        var edges = network.getConnectedEdges(selected_node['id']);
                        for (var j = 0; j < edges.length; j++) {
                            var e = getedge(edges[j]);
                            if (!e || (cuts.indexOf(e['edge-id']) >= 0)) {
                                updateEdges.push({id: edges[j], hidden: true, physics: false});
                            }
                        }
                    }
                }

                edgesDataset.update(updateEdges);

                for (var c in ctypes) {
                    if (ctypes[c] == 'server') {
                        graph_redraw(ctypes[c], false, 'internal');
                    }
                    graph_redraw(ctypes[c], is_filter_on(ctypes[c]), 'internal');
                }

                network.fit();
            }
        }
    });

    network.on("stabilizationProgress", function (params) {
        var width = params.iterations/params.total * 100;
        var percent = Math.round(width);
        $('.progress-bar').text(percent + '%').width(width + '%').attr('aria-valuenow', percent);
    });
    
    network.on("stabilizationIterationsDone", function (params) {
        network.storePositions();
        $('.progress-bar').text('100%').width('100%').attr('aria-valuenow', 100);

        setTimeout(function() {
            hide_progress($('#progress-wrap'))
            setTimeout(function() {
                network.stopSimulation();
            }, 10000);
        }, 500);
    });

    // Right click menu
    // network.on("oncontext", function(params) {
    //     params['event'].preventDefault();
    //     // getNodeAt(params['pointer']['DOM']);
    //     // if( params['nodes'].length > 0 ) {
    //     $('.click-menu').finish().toggle().css({ top: params['pointer']['DOM']['y'] + "px", left: params['pointer']['DOM']['x'] + "px" });
    //     // }
    // });

    // $('.click-menu li').click(function() {
    //     show_questionnaire();
    //     $('.click-menu').hide();
    // })

    // $(document).on("mousedown", function(e) {
    //     if (!$(e.target).parents(".click-menu").length > 0) {
    //         $('.click-menu').hide();
    //     }
    // })

    /* to be used.
    network.on("doubleClick", function (params) {
        nodeid = params['nodes'][0]-1;
        node = allNodes[nodeid];
        display_name = ''

        if( node.hasOwnProperty("servername") ) {
            display_name += node['servername'] + ' > ';
        }

        if( node.hasOwnProperty("mwname") ) {
            display_name += node['mwname'] + ' > ';
        }

        if( node.hasOwnProperty("instancename") ) {
            display_name += node['instancename'] + ' > ';
        }

        display_name += node['label'];

        if( $('#selected_applications').text().indexOf(display_name) < 0 ) {
            $('#selected_applications').append('<li>' + display_name + ' <a onclick="$(this).parent().remove();">x</a></li>');
            $('#selected_applications').scrollTop($('#selected_applications')[0].scrollHeight - $('#selected_applications').height());
        }


        params.event = "[original event]";
        document.getElementById('eventSpan').innerHTML = '<h2>doubleClick event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("oncontext", function (params) {
        params.event = "[original event]";
        document.getElementById('eventSpan').innerHTML = '<h2>oncontext (right click) event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("dragStart", function (params) {
        params.event = "[original event]";
        document.getElementById('eventSpan').innerHTML = '<h2>dragStart event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("dragging", function (params) {
        params.event = "[original event]";
        document.getElementById('eventSpan').innerHTML = '<h2>dragging event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("dragEnd", function (params) {
        params.event = "[original event]";
        document.getElementById('eventSpan').innerHTML = '<h2>dragEnd event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("zoom", function (params) {
        //console.log(JSON.stringify(params)); // {"direction":"+","scale":0.9683072088949066}
        document.getElementById('eventSpan').innerHTML = '<h2>zoom event:</h2>' + JSON.stringify(params, null, 4);
    });
    network.on("showPopup", function (params) {
        document.getElementById('eventSpan').innerHTML = '<h2>showPopup event: </h2>' + JSON.stringify(params, null, 4);
    });
    network.on("hidePopup", function () {
        console.log('hidePopup Event');
    });
    network.on("select", function (params) {
        console.log('select Event:', params);
    });
    network.on("selectNode", function (params) {
        console.log('selectNode Event:', params);
    });
    network.on("selectEdge", function (params) {
        console.log('selectEdge Event:', params);
    });
    network.on("deselectNode", function (params) {
        console.log('deselectNode Event:', params);
    });
    network.on("deselectEdge", function (params) {
        console.log('deselectEdge Event:', params);
    });
    network.on("hoverNode", function (params) {
        console.log('hoverNode Event:', params);
    });
    network.on("hoverEdge", function (params) {
        console.log('hoverEdge Event:', params);
    });
    network.on("blurNode", function (params) {
        console.log('blurNode Event:', params);
    });
    network.on("blurEdge", function (params) {
        console.log('blurEdge Event:', params);
    });
    */

    return network;
}

// refer to global variables.
function graph_redraw(ctype, onoff, scope) {
    var updateNodes = [];
    var updateEdges = [];

    if(scope == undefined) {
        scope = 'internal';
    }

    // table reset.
    filter_table_by_ctype()

    if (scope == 'internal') {
        if ($('#graph_filter_text').val()) {
            graph_filter_by_name($('#graph_filter_text').val());
            return;
        } else if ($('#graph_filter_id').val() != -1) {
            graph_filter_by_id($('#graph_filter_id').val());
            return;
        } else if ($('#graph_filter_app').val()) {
            graph_filter_by_name($('#graph_filter_app').val());
            return;
        }
    }

    // nodes
    for(var nodeId in allNodes) {
        if (network.findNode(nodeId)[0] == nodeId) { // check if in cluster
            if(scope == 'internal') {
                if(allNodes[nodeId].ctype == ctype && allNodes[nodeId].scope == scope) {
                    allNodes[nodeId].hidden = !onoff;
                    updateNodes.push(allNodes[nodeId]);
                } else if(allNodes[nodeId].hidden == false &&
                          allNodes[nodeId].scope != scope &&
                          !is_filter_on('external')) { // external and show, force hide.
                    allNodes[nodeId].hidden = true;
                    updateNodes.push(allNodes[nodeId]);
                }
            } else {
                if(allNodes[nodeId].scope == scope) {
                    allNodes[nodeId].hidden = !onoff;
                    updateNodes.push(allNodes[nodeId]);
                }
            }
        }
    }

    // edges
    for(var i in updateNodes) {
        var nodeId = updateNodes[i].id;
        var edgeIds = network.getConnectedEdges(nodeId);
        for( j in edgeIds ) {
            var edgeId = edgeIds[j];
            var cnodes = network.getConnectedNodes(edgeId);
            if(allNodes[cnodes[0]].hidden == false && allNodes[cnodes[1]].hidden == false) {
                if (network.findNode(cnodes[0])[0] == cnodes[0] && network.findNode(cnodes[1])[0] == cnodes[1]) {
                    allEdges[edgeId].hidden = false;
                }
            } else {
                allEdges[edgeId].hidden = true;
            }

            updateEdges.push(allEdges[edgeId]);
        }
    }

    nodesDataset.update(updateNodes);
    edgesDataset.update(updateEdges);

    // overide with filter parameters.
    graph_filter_by_param();

    network.fit();
}

function isEmptyObject(obj) {
    for (var name in obj) {
        return false;
    }
    return true;
}

// New element list table with allNodes
function table_application_list(id) { // data = aldm data
    var tbody = '<tbody>';

    for(var i in allNodes) {
        var node = allNodes[i];
        var nodeId = allNodes[i].id;

        if(node.scope.indexOf('external') >= 0) continue;
        if(tbody.indexOf(node.label) >= 0) continue; // unique

        // Only unique names?
        if(node.ctype.indexOf('server') >= 0) {
            tbody += '<tr class="table_filter server" style="background-color: #2199e8;color: white;"><td>' + node.label + '</td></tr>';
        } else if(node.ctype.indexOf('os') >= 0) {
            tbody += '<tr class="table_filter os" style="background-color: #3adb76;color: white;"><td>' + node.label + '</td></tr>';
        } else if(node.ctype.indexOf('mw') >= 0) {
            tbody += '<tr class="table_filter mw" style="background-color: #5bc0de;color: white;"><td>' + node.label + '</td></tr>';
        } else if(node.ctype.indexOf('instance') >= 0) {
            tbody += '<tr class="table_filter instance" style="background-color: #ffae00;color: white;"><td>' + node.label + '</td></tr>';
        } else if(node.ctype.indexOf('app') >= 0) {
            tbody += '<tr class="table_filter app" style="background-color: #ec5840;color: white;"><td>' + node.label + '</td></tr>';
        }
    }

    tbody += '</tbody>';
    $('#'+id).append(tbody);

    $('.table_filter').each(function() {
        $(this).on('click', function() {
            if( $(this).find('td').hasClass('selected') ) {    // deselect chosen application
                $('#graph_filter_app').val('').trigger('input');
                $('.selected').toggleClass('selected');
            } else {                                // change selected application
                $('.selected').toggleClass('selected');
                $('#graph_filter_app').val($(this).text().trim()).trigger('input');
                $(this).find('td').toggleClass('selected');
            }
            $('#graph_filter_text').val('');
            $('#graph_filter_id').val('-1');
        });
    });

    // $('.table_filter').each(function() {
    //     $(this).on('click', function() {
    //         $('#graph_filter_text').val($(this).text().trim()).trigger('input');
    //     });
    // });
}

// Populate rankings table with applications/middlewares
function table_rankings(id, sort) {
    $('#'+id).empty();

    var tbody = '<tbody>';

    if(sort != 'none') {
        // Sort the applications/middlewares in allNodes
        var sorted_apps = [];
        for(var i in allNodes) {
            var node = allNodes[i];
            if(node.scope.indexOf('external') >= 0) continue;
            if(node.ctype.indexOf('app') >= 0 || node.ctype.indexOf('mw') >= 0) {
                var servername = node.servername;
                var j = allRanks[servername][sort][0];
                if(typeof sorted_apps[j] == 'undefined') {
                    sorted_apps[j] = [];
                }
                sorted_apps[j].push([node.label, node.servername, node.ctype, allRanks[servername][sort][1], node.id]);
            }
        }

        // Fill in the applications
        for(var i in sorted_apps) {
            for(var j in sorted_apps[i]) {
                var app = sorted_apps[i][j];
                if(app[2] == 'app') {
                    tbody += '<tr class="app" style="background-color: #ec5840;color: white;">';
                    tbody += '<td>' + app[3] + '</td>';
                    tbody += '<td class="table_rank_filter" value="' + app[4] + '">' + app[0] + '</td>';
                    tbody += '<td>' + app[1] + '</td></tr>';
                } else if(app[2] == 'mw') {
                    tbody += '<tr class="mw" style="background-color: #5bc0de;color: white;">';
                    tbody += '<td>' + app[3] + '</td>';
                    tbody += '<td class="table_rank_filter" value="' + app[4] + '">' + app[0] + '</td>';
                    tbody += '<td>' + app[1] + '</td></tr>';
                }
            }
        }
    } else {
        for(var i in allNodes) {
            var node = allNodes[i];

            if(node.scope.indexOf('external') >= 0) continue;
            if(node.ctype.indexOf('app') >= 0) {
                tbody += '<tr class="app" style="background-color: #ec5840;color: white;">';
                tbody += '<td class="table_rank_filter" value="' + node.id + '">' + node.label + '</td>';
                tbody += '<td>' + node.servername + '</td></tr>';
            } else if(node.ctype.indexOf('mw') >= 0) {
                tbody += '<tr class="mw" style="background-color: #5bc0de;color: white;">';
                tbody += '<td class="table_rank_filter" value="' + node.id + '">' + node.label + '</td>';
                tbody += '<td>' + node.servername + '</td></tr>';
            }
        }
    }

    tbody += '</tbody>';
    $('#'+id).append(tbody);

    $('.table_rank_filter').each(function() {
        $(this).on('click', function() {
            if( $(this).hasClass('selected') ) {    // deselect chosen application
                $('#graph_filter_id').val('-1').trigger('input');
                $('.selected').toggleClass('selected');
            } else {                                // change selected application
                $('.selected').toggleClass('selected');
                $('#graph_filter_id').val($(this).attr('value')).trigger('input');
                $(this).toggleClass('selected');
            }
            $('#graph_filter_text').val('');
            $('#graph_filter_app').val('');
        });
    });

    // make it scrollable
    cp_table_body_scrollable();

    // table reset.
    filter_table_by_ctype();
}

function removeSelected(elem) {
    $(elem).each(function() {
        $(this).removeClass('selected');
    });
}

/* this uses sysconfig. complicated. so change to allNodes above.
function table_application_list(data, id) { // data = aldm data
    var tbody = '<tbody>';

    //tbody += '<tr><td>App1</td></tr>';

    for(var h in data['hosts']) {
        var server = data['hosts'][h];

        if( vget(server, 'hostname') ) {
            tbody += '<tr class="table_filter server" style="background-color: #2199e8; color: white;"><td>' + vget(server, 'hostname', 'UNKNOWN') + '</td></tr>';
        }

        var os = server['os'];
        if( vget(os, 'distribution') && vget(os, 'distribution') != 'unknown' ) {
            tbody += '<tr class="table_filter os" style="background-color: #3adb76;color: white;"><td>' + vget(os, 'distribution', 'UNKNOWN') + '</td></tr>';
        } else if( vget(os, 'name') && vget(os, 'name') != 'unknown' ) {
            tbody += '<tr class="table_filter os" style="background-color: #3adb76;color: white;"><td>' + vget(os, 'name', 'UNKNOWN') + '</td></tr>';
        }

        // mw
        for(var i in server['softwares']) {
            var mw = server['softwares'][i];
            var mw_exist = false;
            if( mw['services'] ) {
                if( mw['services'][0] ) {
                    if( mw['services'][0]['objects'] ) {
                        mw_exist = true;
                    }
                }
            }

            if( mw_exist ) {
                if( vget(mw, 'name') ) {
                    tbody += '<tr class="table_filter mw" style="background-color: #5bc0de;color: white;"><td>' + vget(mw, 'name', 'UNKNOWN') + '</td></tr>';
                }

                // instance
                for(var j in mw['services']) {
                    var instance = mw['services'][j];

                    if( vget(instance, 'name') ) {
                        tbody += '<tr class="table_filter instance" style="background-color: #ffae00;color: white;"><td>' + vget(instance, 'name', 'UNKNOWN') + '</td></tr>';
                    }

                    // app
                    for(var k in instance['objects']) {
                        var obj = instance['objects'][k];

                        if( vget(obj, 'alias') ) {
                            tbody += '<tr class="table_filter app" style="background-color: #ec5840;color: white;"><td>' + vget(obj, 'alias', 'UNKNOWN') + '</td></tr>';
                        }
                    }
                }
            } else { // mw_exist == false
                // we ignore instance because objects do not exist.
                obj = mw;
                if( vget(obj, 'name') ) { // app
                    tbody += '<tr class="table_filter app" style="background-color: #ec5840;color: white;"><td>' + vget(obj, 'name', 'UNKNOWN') + '</td></tr>';
                }
            }
        }
    }

    tbody += '</tbody>';
    $('#'+id).append(tbody);

    $('.table_filter').each(function() {
        $(this).on('click', function() {
            $('#graph_filter_text').val($(this).text().trim()).trigger('input');
        });
    });

    // make it scrollable
    cp_table_body_scrollable();

    // table reset.
    filter_table_by_ctype()
}
*/

// TODO: further improve by integrating with usage filters.
function filter_table_by_ctype() {
    for(var i in ctypes) {
        var ctype = ctypes[i];
        if( !$('#graph_filter_' + ctype).hasClass('hollow') ) {
            $('#application_list').find('.'+ctype).show();
        } else {
            $('#application_list').find('.'+ctype).hide();
        }
    }
}
// ----------- Discovery Data Processing

// ----------- Migration Analysis
function create_migration_analysis(tid, data) {
    //$(tid).append(JSON.stringify(data));
    var html = '<h3>Migration Analysis</h3><hr>';
    html += '<p>The following table shows the classification of migration analysis. <b>Some servers may belong to multiple patterns</b>. Click on each row to see details.</p>';
    html += '<table class="table table-hover table-bordered"><thead><th>Migration Pattern</th><th>Physical Hosts</th><th>Virtual Hosts</th><th>Total Hosts</th><th>Percentage</th></thead>';
    html += '<tbody>';

    var patterns = data['patterns'];
    var targets = data['targets'];
    var pattern_order = data['pattern_order'];
    var results = data['results'];
    for(var i = 0; i < pattern_order.length; i++) {
        var key = pattern_order[i];
        html += '<tr onclick="$(this).next().toggle();">';
        html += '<td>' + key + '</td>';
        html += '<td>' + results[key]['physical'] + '</td>';
        html += '<td>' + results[key]['virtualized'] + '</td>';
        html += '<td>' + results[key]['total'] + '</td>';
        html += '<td>' + results[key]['total_pct'] + '%</td>';
        html += '</tr>';

        var host_patterns = results[key]['patterns'];
        html += '<tr style="display:none;background-color:#C1F3FE;"><td colspan="5">';
        html += '<p>Description: ' + patterns[key] + '</p>';
        html += '<p>Potential Targets: ' + targets[key] + '</p>';
        html += '<p>The following servers are candidates for this migration pattern: </p>';
        if( Object.keys(host_patterns).length > 0 ) {
            html += '<ol style="padding-left:15px;margin:0;">';
            for(var host in host_patterns) {
                html += '<li>' + host + ': ' + host_patterns[host] + '</li>';
            }
            html += '</ol>';
        } else {
            html += 'None';
        }
        html += '</td></tr>';
    }

    html += '<tr><td>Total</td>';
    html += '<td>' + results['total']['physical'] + '</td>';
    html += '<td>' + results['total']['virtualized'] + '</td>';
    html += '<td>' + results['total']['total'] + '</td>';
    html += '<td>Not 100% due to duplicates.</td>';
    html += '</tbody></table>';

    $(tid).append(html);
}

// ----------- Migration Analysis

// ----------- Geo Distribution
function draw_geomap(geoid, geodata) {
    var minBulletSize = 3;
    var maxBulletSize = 70;
    var min = Infinity;
    var max = -Infinity;

    // get min and max values
    for (var i = 0; i < geodata.length; i++) {
        var value = geodata[i].value;
        if (value < min) {
            min = value;
        }
        if (value > max) {
            max = value;
        }
    }

    AmCharts.theme = AmCharts.themes.dark;
    window.map = new AmCharts.AmMap();

    window.map.addTitle("Geographical Connection Distribution (Mouseover Circles)", 14);
    //window.map.addTitle("source: Gapminder", 11);
    window.map.areasSettings = {
        unlistedAreasColor: "#000000",
        unlistedAreasAlpha: 0.1
    };
    window.map.imagesSettings.balloonText = "<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>";

    var dataProvider = {
        mapVar: AmCharts.maps.worldLow,
        images: []
    }

    // create circle for each country

    // it's better to use circle square to show difference between values, not a radius
    var maxSquare = maxBulletSize * maxBulletSize * 2 * Math.PI;
    var minSquare = minBulletSize * minBulletSize * 2 * Math.PI;

    // create circle for each country
    for (var i = 0; i < geodata.length; i++) {
        var dataItem = geodata[i];
        var value = dataItem.value;
        // calculate size of a bubble
        var square = (value - min) / (max - min) * (maxSquare - minSquare) + minSquare;
        if (square < minSquare) {
            square = minSquare;
        }
        var size = Math.sqrt(square / (Math.PI * 2));

        dataProvider.images.push({
            type: "circle",
            width: size,
            height: size,
            color: dataItem.color,
            longitude: dataItem.longitude,
            latitude: dataItem.latitude,
            title: dataItem.country_name + ':' + dataItem.city,
            value: value
        });
    }

    // the following code uses circle radius to show the difference (absolute number)
    /*
    for (var i = 0; i < geodata.length; i++) {
        var dataItem = geodata[i];
        var value = dataItem.value;
        // calculate size of a bubble
        var size = (value - min) / (max - min) * (maxBulletSize - minBulletSize) + minBulletSize;
        if (size < minBulletSize) {
            size = minBulletSize;
        }
        var id = dataItem.code;

        dataProvider.images.push({
            type: "circle",
            width: size,
            height: size,
            color: dataItem.color,
            longitude: dataItem.longitude,
            latitude: dataItem.latitude,
            title: dataItem.country_name + ':' + dataItem.city,
            value: value
        });
    }*/

    window.map.dataProvider = dataProvider;
    window.map.export = {
        enabled: true
    }
    window.map.projection = "eckert6";
    window.map.write(geoid);
}

// ----------- Geo Distribution

// ----------- D3
/*
 * Line Graph
 * Input:
 *    id: tag id
 *    data: [1, 2, 3, 4]
 *    y_max: max value, otherwise 100
 *    dividen: y value normalization
 */
function lineGraph(id, data, y_max, dividen, x_axis_title, y_axis_title) {
    // define dimensions of graph
    var m = [10, 80, 40, 80]; // top, right, bottom, left
    var w = 520 - m[1] - m[3]; // width
        h = 200 - m[0] - m[2]; // height

    // default value
    if ( dividen == 0 ) {
        dividen = 1;
    }

    if ( y_max == 0 ) {
        y_max = 100;
    } else {
        y_max /= dividen;
    }

    // create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)
    //var data = [3, 6, 2, 7, 5, 2, 0, 3, 8, 9, 2, 5, 9, 3, 6, 3, 6, 2, 7, 5, 2, 1, 3, 8, 9, 2, 5, 9, 2, 7];

    // X scale will fit all values from data[] within pixels 0-w
    var x = d3.scale.linear().domain([0, data.length]).range([0, w]);
    // Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
    var y = d3.scale.linear().domain([0, y_max]).range([h, 0]);
    // automatically determining max range can work something like this
    // var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);

    // create a line function that can convert data[] into x and y points
    var line = d3.svg.line()
        // assign the X function to plot our line as we wish
        .x(function(d,i) {
            // verbose logging to show what's actually being done
            //console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
            // return the X coordinate where we want to plot this datapoint
            return x(i);
        })
        .y(function(d) {
            // verbose logging to show what's actually being done
            //console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
            // return the Y coordinate where we want to plot this datapoint
            return y(d / dividen);
        })

    // Add an SVG element with the desired dimensions and margin.
    var graph = d3.select(id).append("svg:svg")
            .attr("width", w + m[1] + m[3])
            .attr("height", h + m[0] + m[2])
        .append("svg:g")
            .attr("transform", "translate(" + m[3] + "," + m[0] + ")");

    // create yAxis
    //var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
    var xAxis = d3.svg.axis().scale(x).orient("bottom");
    // Add the x-axis.
    graph.append("svg:g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + h + ")")
            .call(xAxis)
        .append("text")
            .attr("transform", "translate(-10, 0)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(x_axis_title);

    // create left yAxis
    //var yAxisLeft = d3.svg.axis().scale(y).ticks(5).orient("left");
    var yAxisLeft = d3.svg.axis().scale(y).orient("left");
    // Add the y-axis to the left
    graph.append("svg:g")
            .attr("class", "y axis")
            .attr("transform", "translate(-15,0)")
            .call(yAxisLeft)
        .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".51em")
            .style("text-anchor", "end")
            .text(y_axis_title);

    graph.append("path")
        .datum(data)
        .attr("class", "line")
        .attr("d", line(data));
}

/*
 * Multiple Line Graph
 * Input:
 *    id: tag id
 *    data = [{'xitem': 1, 'y': 100, 'z': 11}, {'xitem': 2, 'y': 20, 'z': 22}, {'xitem': 3, 'y': 5, 'z': 22}, {'xitem': 4, 'y': 15, 'z': 33}];
 *    y_max: max value, otherwise 100
 *    dividen: y value normalization
 */
function multipleLineGraph(id, data, y_max, dividen, x_axis_title, y_axis_title) {
    var margin = {top: 10, right: 80, bottom: 40, left: 80},
        width = 520 - margin.left - margin.right,
        height = 200 - margin.top - margin.bottom;

    // default value
    if ( dividen == 0 ) {
        dividen = 1;
    }

    if ( y_max == 0 ) {
        y_max = 100;
    } else {
        y_max /= dividen;
    }

    var parseDate = d3.time.format("%Y%m%d").parse;

    //var x = d3.time.scale().range([0, width]);
    var x = d3.scale.linear().domain([0, data.length]).range([0, width]);
    //var y = d3.scale.linear().range([height, 0]);
    var y = d3.scale.linear().domain([0, y_max]).range([height, 0]);

    var color = d3.scale.category10();

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left");

    var line = d3.svg.line()
        .interpolate("basis")
        .x(function(d) { return x(d.xitem); })
        .y(function(d) { return y(d.yitem); });

    var svg = d3.select(id).append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    color.domain(d3.keys(data[0]).filter(function(key) { return key !== "xitem"; }));

    data.forEach(function(d) { // no need.
        //d.xitem = parseDate(d.date);
    });

    var cities = color.domain().map(function(name) {
        return {
            name: name,
            values: data.map(function(d) {
                return {xitem: d.xitem, yitem: d[name]};
            })
        };
    });

    /*
    x.domain(d3.extent(data, function(d) { return d.xitem; }));
    y.domain([
        d3.min(cities, function(c) { return d3.min(c.values, function(v) { return v.yitem; }); }),
        d3.max(cities, function(c) { return d3.max(c.values, function(v) { return v.yitem; }); })
    ]);
    */

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + (height+5) + ")")
        .call(xAxis)
        .append("text")
            .attr("transform", "translate(-10, 0)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text(x_axis_title);

    svg.append("g")
        .attr("class", "y axis")
        .attr("transform", "translate(-15,0)")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".51em")
        .style("text-anchor", "end")
        .text(y_axis_title)

    var city = svg.selectAll(".city")
        .data(cities)
        .enter().append("g")
        .attr("class", "city");

    city.append("path")
        .attr("class", "line")
        .attr("d", function(d) { return line(d.values); })
        .style("stroke", function(d) { return color(d.name); });

    //this shows the legend right of the last point.
    //.attr("transform", function(d) { return "translate(" + x(d.value.xitem) + "," + y(d.value.yitem) + ")"; })
    var legend_y = -10;
    city.append("text")
        .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
        .attr("transform", function(d) { legend_y += 15; return "translate(10," + legend_y + ")"; })
        .style("stroke", function(d) { return color(d.name); })
        .attr("x", 3)
        .attr("dy", ".35em")
        .text(function(d) { return d.name; });
}
// ----------- D3
