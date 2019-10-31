

const settingUpPages = function () {
    $('.calendar-body').hide();
    $('.show-calendar').on('click', function () {
        $('.calendar-body').slideDown('slow');
    })
};

$(document).ready(settingUpPages);
