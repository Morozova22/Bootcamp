$(document).ready(function () {
    $('.minus').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        if (count == 1) {
            $('.min').css('background-color', '#dcdcdc')
        } else {
            $('.min').css('background-color', 'blue')
        }
        $input.val(count);
        $input.change();
        return false;
    });
    $('.plus').click(function () {
        var $input = $(this).parent().find('input');
        $input.val(parseInt($input.val()) + 1);
        if ($input == 1) {
            $('.min').css('background-color', '#dcdcdc')
        } else {
            $('.min').css('background-color', 'blue')
        }
        $input.change();
        return false;
    });
    $('#shop').on('click', function () {
        var $quantity = $('#count').val();
        simplePopup({
            'pop-title': 'Ифнормация',
            'pop-body': 'В корзину добавлено ' + $quantity + ' товаров',
            'btn-text': 'Ок',
            'auto-wrap': 50,
        });
    });

})

