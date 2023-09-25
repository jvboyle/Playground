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

// CSRF Protect
$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        if (!/^(HEAD|OPTIONS|TRACE)$/i.test(settings.type) && !this.crossDomain) {
            xhr.setRequestHeader("X-CSRFToken", csrf_token);
        }
    }
});

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
    if( message == undefined ) {
        message = '';
    }

    div = elem;

    html = '<div class="spinner" style="display:none;"><div class="spinner-message" display:none;>' + message;
    html += '</div></div>';
    if( $(div).find('.spinner').length <= 0 ) {
        $(div).prepend(html);
    }
    //$(div).find('.spinner').css({ height: $(window).height(), width: $(window).width() });
    $(div).find('.spinner').show();
    $(div).find('.spinner-message').show();
    return true;
}

function hide_spinner(elem)
{
    div = elem;
    if( $(div).find('.spinner').length > 0 ) {
        $(div).find('.spinner').each(function() {
            $(this).remove();
        });
        $(div).find('.spinner-message').each(function() {
            $(this).remove();
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

function toggle_password(event, elem, password) {
    if( $(elem).siblings('div').text().indexOf('********') >= 0 ) {
        $(elem).siblings('div').text(password);
        $(elem).text('Hide');
    } else {
        $(elem).siblings('div').text('********');
        $(elem).text('Show');
    }

    event.stopPropagation();
}

function password_mask() {
    $('.password_mask').each(function() {
        if( (password = $(this).text()) != '' ) {
            $(this).text('');
            $(this).append('<div class="sidebyside"><div>********</div><a class="btn btn-info btn-xs flex-item" onclick="toggle_password(event, this, \'' + password.replace(/\'/g, '') + '\')">Show</a></div>');
        }
    });
}

function is_valid_ipv4(ip) {
    if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ip)) {
        return true;
    }
    return false;
}

function display_message(status, message) {
    var html = '';

    if( message == undefined ) {
        message = '';
    }

    if(status == 'ERROR') {
        html += '<div class="message-box error-message">';
        html += '<a class="message-close">x</a>';
        html += '<span>ERROR: </span><br>';
    } else if(status == 'OK') {
        html += '<div class="message-box ok-message">';
        html += '<a class="message-close">x</a>';
        html += '<span>OK: </span><br>';
    } else if(status == 'SUCCESS') {
        html += '<div class="message-box ok-message">';
        html += '<a class="message-close">x</a>';
        html += '<span>SUCCESS: </span>';
    } else {
        html += '<div class="message-box ok-message">';
        html += '<a class="message-close">x</a>';
        html += '<span>' + status + ': </span>';
    }
    html += message;
    html += '</div>';

    $(html).prependTo($('.message-wrapper')).trigger('showalert');
    $('.message-close').each(function() {
        $(this).click(function() {
            $(this).parent().remove();
        });
    });
}

function enable_drag_drop() {
    var dropArea1 = document.getElementById("file-drag-drop");

    dropArea1.addEventListener("dragleave", function (evt) {
        var target = evt.target;

        if (target && target === dropArea1) {
            this.className = "drop-area";
        }
        evt.preventDefault();
        evt.stopPropagation();
    }, false);

    dropArea1.addEventListener("dragenter", function (evt) {
        this.className = "over";
        evt.preventDefault();
        evt.stopPropagation();
    }, false);

    dropArea1.addEventListener("dragover", function (evt) {
        evt.preventDefault();
        evt.stopPropagation();
    }, false);

    dropArea1.addEventListener("drop", function (evt) {
        document.getElementById("target-file").files = evt.dataTransfer.files;

        this.className = "drop-area";
        evt.preventDefault();
        evt.stopPropagation();
    }, false);
}
