function checkUpdateCart(){
    if (jQuery.active < 1){
        updateAddressSelection();
    } else {
        setTimeout(function(){checkUpdateCart()}, 300)
    }
}

$(document).ready(function () {
    $('#order-opc .cart_quantity a').bind('click', function(){
        setTimeout(function(){checkUpdateCart()}, 300)
    })
});

function bindOldVSNewSelector() {
    $('.everypay_cardway_selection input[type="radio"]').unbind('click').bind('click', function (event) {
        var selected = $(this).val();

        if ($('.everypay_selection_wrapper_' + selected).is(':visible')) {
            return;
        }

        $('.everypay_cardway_selection > *').attr('disabled', 'disabled');

        $('[class^="everypay_selection_wrapper_"]:visible').fadeOut(100, function () {
            $('.everypay_selection_wrapper_' + selected).fadeIn(100);
            $('.everypay_cardway_selection > *').removeAttr('disabled');
        });
    });

    $('.everypay_cardway_selection #select_saved_card').trigger('click');

    $('.submit_saved_card').bind('click', function (event) {
        $(this).addClass('opacty').unbind('click').bind('click', function (event) {
            event.preventDefault()
        });
    })
}

function bindEveryPayForm() {
    var elements2disable = $everypayForm.find("button, input:not([type=checkbox]), select");
    $everypayForm.submit(function (event) {
        event.preventDefault();
        try {
            $(elements2disable).prop('disabled', true).addClass('disabled opacty');
        } catch (Exception) {
            $(elements2disable).attr('disabled', true).addClass('disabled opacty');
        }
        $everypayForm.find(".form-error").html('').hide();
        Everypay.createToken($everypayForm, handleTokenResponse);
        return false;
    });
}

function handleTokenResponse(response) {
    var elements2disable = $everypayForm.find("button, input:not([type=checkbox]), select");
   
    if (response.error) {
        $everypayForm.find(".form-error").html(response.error.message).show();
        $(elements2disable).removeAttr('disabled').removeClass('disabled opacty');
    } else {
        $everypayForm.find('.everypay-button').val(MSG_PLEASE_WAIT + '...');  
        var token = response.token;
        $everypayForm.append($('<input type="hidden" name="everypayToken"/>').val(token));
        $everypayForm.get(0).submit();
    }
}

