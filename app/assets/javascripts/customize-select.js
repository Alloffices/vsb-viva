
$select = $('.customize-select');
$(document).ready(function () {

    $(document).on('click','.current-selection',function(e){

        var target = $(e.target).closest('.customize-select');

        if(target.hasClass('open'))
            target.removeClass('open');
        else
        {
            if($select.hasClass('open'))
                $select.removeClass('open');
            target.addClass('open');

        }
    });

    $(document).on('click','.option-selection',function(e){

        var target = $(e.target).closest('.customize-select');

        var value = $(this).data('val');
        var children = $(this).children();
        
        if(children.length > 0) {
            
           while(children.length > 0) {

               var child = $(children[0]);
               var html = child.html();
               children = child.children();
           } 
        }
        else 
            var html = $(this).html();

        target.find('input[type="hidden"]').val(value);
        target.find('.current-selection').html(html);
        target.find('.select-wrapper').removeClass('input-error');

        target.removeClass('open');
        target.find('input[type="hidden"]').trigger('change');
        
    });

});

$(document).keyup(function(e) {
    if (e.keyCode === 27 && $select.hasClass('open'))
       $select.removeClass('open');  // esc
});

$(document).click(function(e) {
    var target  = $(e.target);
    if (target.parents('.customize-select').length == 0 && $select.hasClass('open'))
        $select.removeClass('open');  // esc
});