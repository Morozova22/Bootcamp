$(document).ready(function(){
    $('.product__preview a').click(function(e){
        $('.product__big img').hide().attr('src', $(this).attr('href')).fadeIn(1000);
        e.preventDefault();

    })
})