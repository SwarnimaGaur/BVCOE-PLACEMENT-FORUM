$(document).ready(function () {
    selector_cards = $('.selector_card');
    main_descs = $('.main_desc').hide();

    $('.selector_card').each(function () {

        $(this).click(function () {
            var x = $(this).siblings().first();
            if (x.attr('style') !== "display: none;") {
                x.slideToggle();
            } else {
                $(main_descs).each(function (index) {
                    $(this).slideUp();
                });
                x.slideToggle();
            }
        })
    })
});