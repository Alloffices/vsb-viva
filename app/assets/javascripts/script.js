
$initTop = 0;
$(document).ready(function() {

    $('.location-map').removeClass("florida-map");
    $('.location-map').removeClass("texas-map");

    $('.section').on('mouseenter','.hover-map',function(e){

        $('.location-map').removeClass("florida-map");
        $('.location-map').removeClass("texas-map");

        var map = $(this).data('location')+"-map";
        $('.location-map').addClass(map);
    });

    $('.section').on('mouseleave','.hover-map',function(e){

        $('.location-map').removeClass("florida-map");
        $('.location-map').removeClass("texas-map");

        if($('.hover-map.selected').length) {

            var map = $('.hover-map.selected').data('location')+"-map";
            $('.location-map').addClass(map);
        }
    });

    // $('.section').on('click','.hover-map',function(e){
    //
    //     var location = $(this).data('location');
    //
    //     if(location == 'texas') {
    //
    //         $('.hover-map.selected').removeClass('selected');
    //         $(this).addClass('selected');
    //
    //         $('.regions').fadeOut('fast');
    //
    //         $.ajax({
    //             type: "POST",
    //             url: 'includes/get_counties.php',
    //             data: {location: location, CsrfToken: $('meta[name="csrf-token"]').attr('content')},
    //             success: function(result) {
    //
    //                 $('.regions').html('');
    //                 $.each(result, function(pos, item){
    //
    //                     var pCounty = $('<p class="county"><a href="location/"'+item+' aria-label="Click here to find the centers nearest you in '+item+' county.">'+item+'</p>');
    //                     $('.regions').append(pCounty);
    //                 });
    //
    //                 $('.regions').fadeIn('slow');
    //             }
    //         });
    //     }
    // });

    // setTimeout(function(e){
    //
    //     // if($('#search-results').length) {
    //     //
    //     //     $('html, body').animate({
    //     //         scrollTop: $('#search-results').offset().top
    //     //     }, 'slow');
    //     // }
    //
    //     //$(window).trigger('resize');
    // },100);

    $('.section').on("click",'.nearest-locations',function(e){

        var address =  $('input[name="address"]').val().replace(/\s+/g, '+');
        if($('input[name="transportation"]').length && $('input[name="transportation"]').is(':checked'))
            address +='?filters=transportation';
        if($('.physicians').length  || $('#search_by_physician').is(':checked'))
            var searchLocation = composeUrl('physicians',address);
        else
            var searchLocation = composeUrl('our-locations',address);
        window.location.href = searchLocation;
        return false;
    });

    $('.section').on("click",'input[name="search_by"]',function (e) {

        var inputAddress = $(this).closest('form').find('input[name="address"]');
        var buttonSearch = $(this).closest('form').find('.nearest-locations');

        if($('#search_by_physician').is(':checked')) {

            inputAddress.attr('placeholder',inputAddress.data('placeholder-physicians'));
            buttonSearch.text(buttonSearch.data('text-physicians'));
        } else {

            inputAddress.attr('placeholder',inputAddress.data('placeholder-locations'));
            buttonSearch.html(buttonSearch.data('text-locations'));
        }
    });

    $('.current-locations').on("click",function(e){

        if (navigator.geolocation) {

            if($(this).hasClass('modal-locations'))
                navigator.geolocation.getCurrentPosition(initMapFromMyPositionFromHome);
            else
                navigator.geolocation.getCurrentPosition(initMapFromMyPositionFromHome);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    });

    $('.default-center').on("click",function (e) {

        var searchLocation = composeUrl('includes/set_default_center.php','');
        var currentCenter = $(this).data('center');

        $.ajax({
            type: "POST",
            url: searchLocation,
            data: {current_center: currentCenter,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
            success: function(result) {

                var data = $.parseJSON(result);
                if(data !== undefined) {
                   window.location.reload();
                }
            }
        });

        return false;
    });

    $('.default-physician').on("click", function(e){

        var fromSearch = $(this).data('from-search');

        if(fromSearch) {

            if($('.modal-centers').hasClass('on')) {

                $('.close-modal').trigger('click');
            }
            else {

                $('.modal-centers').addClass('on');
                $('.modal-centers .modal-body').slideDown('fast');
                $("body").addClass("lock-dt");
            }
            return false;
        }
        else {


            var currentPhysician = $(this).data('physician');
            var currentCenter = $(this).data('center');
            saveDefaultPhysician(currentPhysician,currentCenter);
            return false;
        }
    });

    $('.modal').on("click",'.default-physician-from-modal',function (e) {

        $('#physician-centers').removeClass('input-error');

        var defaultPhysician = $('input[name="default_physician"]').val();
        var defaultCenter = $('input[name="default_center"]').val();

        if(defaultCenter != -1) {

            saveDefaultPhysician(defaultPhysician,defaultCenter);
        } else {

            $('#physician-centers').addClass('input-error');
        }

        return false;
    });

    $('.not-my-location').on("click",function (e) {

        var searchLocation = composeUrl('includes/unset_default_center.php','');

        $.ajax({
            type: "POST",
            url: searchLocation,
            data: {CsrfToken: $('meta[name="csrf-token"]').attr('content')},
            success: function(result) {

                var data = $.parseJSON(result);
                if(data !== undefined) {
                    window.location.reload();
                }
            }
        });

        return false;
    });

    $('.not-my-physician').on("click",function (e) {

        var searchLocation = composeUrl('includes/unset_default_physician.php','');

        $.ajax({
            type: "POST",
            url: searchLocation,
            data: {CsrfToken: $('meta[name="csrf-token"]').attr('content')},
            success: function(result) {

                var data = $.parseJSON(result);
                if(data !== undefined) {
                    window.location.reload();
                }
            }
        });

        return false;
    });

    $('#mobile-nav').on('click',function(e){

        e.preventDefault();

        if(!$('.nav').hasClass('nav-open')) {

            if($('.new-block').length > 0 && $('.new-block').css('display') == 'block') {

                $('.new-block').slideUp(400,function (e) {

                    $('.nav').addClass('nav-open');
                    setTimeout(function(e){$('.fa-menu').hasClass('fa-minus') ? $('.fa-menu').removeClass('fa-minus') : $('.fa-menu').addClass('fa-minus')},500);
                    $("html").addClass("lock");
                    $("body").addClass("lock");

                });
            }
            else {

                $('.nav').addClass('nav-open');
                setTimeout(function(e){$('.fa-menu').hasClass('fa-minus') ? $('.fa-menu').removeClass('fa-minus') : $('.fa-menu').addClass('fa-minus')},500);
                $("html").addClass("lock");
                $("body").addClass("lock");
            }
        }
        else {

            if($('.new-block').length > 0 && $('.new-block').css('display') == 'none') {

                $('.new-block').slideDown(400,function (e) {

                    $('.nav').removeClass('nav-open');
                    setTimeout(function(e){$('.fa-menu').hasClass('fa-minus') ? $('.fa-menu').removeClass('fa-minus') : $('.fa-menu').addClass('fa-minus')},500);
                    $("html").removeClass("lock");
                    $("body").removeClass("lock");
                });
            }
            else {

                $('.nav').removeClass('nav-open');
                setTimeout(function(e){$('.fa-menu').hasClass('fa-minus') ? $('.fa-menu').removeClass('fa-minus') : $('.fa-menu').addClass('fa-minus')},500);
                $("html").removeClass("lock");
                $("body").removeClass("lock");
            }
        }

        return false;
    });

    $('.slides').on("click","a",function (e) {

        if($(window).width() < 800){

            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

    $('#gallery-slider').on("click",".fa-fullscreen",function (e) {

        e.preventDefault();

        var url = $(this).data('url');
        var alt = $(this).data('alt');
        $('.modal-zoom').find('img').attr('src',url);
        $('.modal-zoom').find('img').attr('alt',alt);
        $('.modal-zoom').addClass('on');
        $("html").addClass("lock-dt");
        $("body").addClass("lock-dt");

        $('.zoom-close').focus();

        return false;
    });

    $('.modal-zoom').on("click",".zoom-close",function (e) {

        $('.modal-zoom').removeClass('on');
        if($("#video").length)
            $("#video").attr("src", "");
        $("body").removeClass("lock-dt");
        $("html").removeClass("lock-dt");

        if($('.fa-fullscreen').length > 0 )
            $('.fa-fullscreen').focus();
        else if($('.play_video').length > 0)
            $('.play_video').focus();

        return false;
    });

    $('.play_video').on("click", function (e) {

        e.preventDefault();
        $vid = $(this).data("video");
        $youtubeLink = $(this).data("youtube");

        if($youtubeLink.length > 0)
            $("#video").attr("src", $youtubeLink);
        else
            $("#video").attr("src", "https://player.vimeo.com/video/"+$vid+"?autoplay=1");

        $('.modal-zoom').addClass('on');
        $("html").addClass("lock-dt");
        $("body").addClass("lock-dt");

        $('.zoom-close').focus();

        return false;
    });

    $('.choose-location').on("click", function (e){

        if($('.modal-location').hasClass('on')) {

            $('.close-modal').trigger('click');
        }
        else {

            $('.modal-location').addClass('on');
            $('.modal-location .modal-body').slideDown('fast');
            $("body").addClass("lock-dt");
        }
    });

    $('.request-appointment').on('click',function (e) {

        e.preventDefault();

        if($('.modal-contact').hasClass('on')) {

            $('.close-modal').trigger('click');

        }
        else {

            initContactModal(this);
            $('.modal-appointment').addClass('on');
            $('.modal-appointment .modal-body').slideDown('fast');
            $("body").addClass("lock-dt");
        }

        e.stopPropagation();
        return false;
    });

    $('.modal').on("click", ".close-modal", function (e) {

        $('.modal .modal-body').slideUp('fast', function (e) {

            setTimeout(function (e) {

                $('.modal').removeClass('on');
                $("body").removeClass("lock-dt");
                $("html").removeClass("lock-dt");

            }, 200);
        });
    });

    $('.modal').on("click", function (e) {

        if($(e.target).closest('.modal-body').length == 0 && !$(e.target).hasClass('modal-body')) {

            $('.close-modal').trigger('click');

        }

    });

    $('.modal').on("click", ".submit-appointment", function(e){

        $('.input-error').removeClass('input-error');
        var modal =  $(this).closest('.modal-body');

        $.each(modal.find('.required-input'), function (pos, item){

            if($(item).val().length == 0){

                if($(item).attr('name') == 'g_response'){
                   $('.g-recaptcha').addClass('input-error');
                } else
                    $(item).addClass('input-error');
            }
        });

        modal.find('.message').removeClass('error');
        modal.find('.message').removeClass('success');
        modal.find('.message').html('');

        if($('.input-error').length)
        {
            return false;
        }
        else {

            var urlContact = composeUrl('includes','');
            var name = modal.find('input[name="name"]').val();
            var email = modal.find('input[name="email"]').val();
            var phone = modal.find('input[name="phone"]').val();

            var county = modal.find('input[name="modal_county"]').val();
            var location = modal.find('input[name="modal_location_county"]').val();
            var physician = modal.find('input[name="modal_physician"]').val();

            var date = modal.find('input[name="modal_date"]').val();
            var time = modal.find('input[name="modal_date_time"]').val();

            var notes = modal.find('textarea[name="modal_notes"]').val();
            var message = modal.find('textarea[name="modal_message"]').val();
            var contacted =  modal.find('input[name="modal_contacted_via"]:checked').val();

            var action = modal.find('h2').html();
            var recaptcha = modal.find('input[name="g_response"]').val();

            $.ajax({
                type: "POST",
                url: urlContact,
                data: {"g-recaptcha-response": recaptcha,name: name, email:email,phone:phone,county:county,current_center:location,physician:physician,
                    date: date,time: time,notes:notes,message:message,action:action,contacted:contacted,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
                success: function(result) {

                    $('input[name="g_response"]').val('');
                    grecaptcha.reset(widgetId1);

                    var data = $.parseJSON(result);
                    if(data.error.length > 0) {

                        modal.find('.message').addClass('error');
                        modal.find('.message').html(data.error);
                    }
                    else {

                        modal.find('input, textarea').val('');
                        modal.find('.message').addClass('success');
                        modal.find('.message').html(data.success);
                        modal.find('input[name="modal_contacted_via"]').prop('checked', false);
                    }

                    $('.modal').animate({
                        scrollTop: $('.modal-body').offset().top   }, 'slow');
                }
            });
        }
    });

    $('.modal').on("change","input[name='modal_county']", function(e){

        cleanModal(1);
        var selectedValue = $(this).val();
        var searchLocation = composeUrl('includes','');

        $.ajax({
            type: "POST",
            url: searchLocation,
            data: {county: selectedValue,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
            success: function(result) {

                var data = $.parseJSON(result);
                $('#modal_location_county').css('display','none');
                $('#modal_location_county input[type="hidden"]').val('-1');
                $('#modal_location_county .current-selection').text($('#modal_location_county .current-selection').data('default'));
                $('#location_county').find('ul').html("");
                if(data !== undefined) {
                    $.each(data, function(pos, item){

                        var li = $('<li class="option-selection" data-val="'+item.name+' Care Center"><span>'+item.name+' Care Center</span></li>');
                        $('#modal_location_county').find('ul').append(li);
                    });
                }

                $('#modal_location_county').slideDown('fast');
            }
        });
    });

    $('.modal').on("change","input[name='modal_location_county']", function(e){

        var action = $(this).closest('.modal').data('action');

        if($('#modal_physician').length && $('#modal_physician').data('visible').toString().indexOf(action) !== -1) {

            cleanModal(2);
            var selectedValue = $(this).val();
            var searchLocation = composeUrl('includes/ajax_physician_modal.php','');

            $('#modal_physician input[type="hidden"]').val('-1');
            $('#modal_physician .current-selection').text($('#modal_physician .current-selection').data('default'));

            $.ajax({
                type: "POST",
                url: searchLocation,
                data: {location: selectedValue,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
                success: function(result) {

                    var data = $.parseJSON(result);
                    $('#modal_physician').css('display','none');
                    $('#modal_physician input[type="hidden"]').val('-1');
                    $('#modal_physician .current-selection').text($('#modal_physician .current-selection').data('default'));
                    $('#location_county').find('ul').html("");
                    if(data !== undefined) {

                        $('#modal_physician').find('ul').append($('<li class="option-selection" data-val="'+$('#modal_physician .current-selection').data('default')+'"><span>'+$('#modal_physician .current-selection').data('default')+'</span></li>'));
                        $.each(data, function(pos, item){

                            var li = $('<li class="option-selection" data-val="'+item.doctor_name+'"><span>'+item.doctor_name+'</span></li>');
                            $('#modal_physician').find('ul').append(li);
                        });
                    }

                    $('#modal_physician').slideDown('fast');
                }
            });
        }
    });

    if($('#flexslider-services').length)
        initSlider(3);

    if($('#gallery-slider').length) {

        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            autoplay: true,
            fade: true,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            focusOnSelect: true,
            autoplay: false,
            arrows: false
        });
    }

    if($(".careers").length){

        $.each($('.full').find('span'), function(pos, itemP){

            var pText = itemP.innerText.trim();
            if(pText[pText.length - 1] == ':'){
                $(itemP).addClass('header');
            }
        });
    }

    if (location.hash.substr(1) == 'request' && $("body.home").length > 0) {

        if ($('.request-appointment').length > 0) {

            $('.request-appointment').first().trigger('click');

        }

    }

    if($('.new-block').length){

       setTimeout(function(e){
           $initTop = parseInt($('.banners').css('top'));
           var newsHeight = parseInt($('.new-block').css('height'));
           $('.new-block').slideDown(400);
           $('.banners').animate({top: newsHeight + $initTop}, 400);
       },100);

       $('.new-block').on('click','.close',function (e) {

           $('.new-block').slideUp(400);
           $('.banners').animate({top: $initTop}, 400,function (e) {
               $('.new-block').remove();
           });
       });
    }

    if($('#events-calendar').length) {

        var eventList = $.parseJSON($('#event-list').val());

        $('#events-calendar').fullCalendar({
            header: {
                left: 'prev',
                center: 'title',
                right: 'next'
            },
            views: {
                monthOneWeek: {
                    type: 'month',
                    duration: {days: 3},
                    buttonText: '3 days',
                    fixedWeekCount: false
                }
            },
            defaultView: 'monthOneWeek',
            contentHeight: 'auto',
            handleWindowResize: true,
            editable: false,
            events: eventList,
            eventRender: function (event, element) {

                var newTitle = $.parseJSON(event.title);
                newTitle += '<span class="event-id" data-id="' + event.id + '"></span>';
                element.html(newTitle);
            }
        });

        $('.calendar').on('click', '.fc-event', function (e) {

            e.preventDefault();

            var id = $(this).find('.event-id').data('id');
            var currentEvent = $.grep(eventList, function (e) {
                return e.id == id;
            });

            var startDateDay = moment(currentEvent[0].start).format('ddd, MMM DD YYYY');
            var endDateDay = moment(currentEvent[0].end).format('ddd, MMM DD YYYY');
            var endDateTime = moment(currentEvent[0].end).format('hh:ss a');

            var startDate = moment(currentEvent[0].start).format('ddd, MMM DD YYYY hh:ss a');
            var endDate = moment(currentEvent[0].end).format('ddd, MMM DD YYYY hh:ss a');
            var description = $.parseJSON(currentEvent[0].description !== null ? currentEvent[0].description : '');

            $('.modal-events').find('h2').html($.parseJSON(currentEvent[0].title));
            $('.modal-events').find('h3').html(startDate);
            if (startDate != endDate) {

                if(startDateDay != endDateDay)
                    $('.modal-events').find('h3').html(startDate + " - " + endDate);
                else
                    $('.modal-events').find('h3').html(startDate + " - " + endDateTime);
            }

            $('.modal-events').find('h3').next().html(description);
            $('.modal-events').find('input[name="description"]').val($.parseJSON(currentEvent[0].description));
            $('.modal-events').find('input[name="date_start"]').val(currentEvent[0].start);
            $('.modal-events').find('input[name="date_end"]').val(currentEvent[0].end);
            $('.modal-events').find('input[name="summary"]').val($.parseJSON(currentEvent[0].title));

            $('.modal-events').addClass('on');
            $('.modal-events .modal-body').slideDown('fast');
            $('#content').css('z-index', 4);

            return false;
        });

        $('.share-event').on('click', function (e) {

            var urlShare = composeUrl('includes/ajax_share_event.php', '');
            var description = $('#download-event-file').find('input[name="description"]').val();
            var date_start = $('#download-event-file').find('input[name="date_start"]').val();
            var date_end = $('#download-event-file').find('input[name="date_end"]').val();
            var summary = $('#download-event-file').find('input[name="summary"]').val();
            var share_with = $(this).data('type');
            var _token = $('meta[name="csrf-token"]').attr('content');

            if (share_with == 'google')
                $.ajax({
                    type: "POST",
                    url: urlShare,
                    data: {
                        share_with: share_with,
                        description: description,
                        date_start: date_start,
                        date_end: date_end,
                        summary: summary,
                        _token: _token
                    },
                    success: function (result) {

                        var data = $.parseJSON(result);
                        if (data.status) {

                            $('#open-google').attr('href', data.data.link);
                            window.open(data.data.link, "_blank");

                            $('.modal .modal-body').slideUp('fast', function (e) {

                                setTimeout(function (e) {

                                    $('.close-modal').trigger('click');
                                }, 200);
                            });
                        }
                    }
                });
            else {

                $('#download-event-file').attr('action', urlShare);
                $('#download-event-file').submit();
            }
        });

        changeView();
    }

});

$(document).keyup(function(e) {

    if (e.keyCode == 27 &&  $("body").hasClass('lock-dt')) {

        $('.modal .modal-body').slideUp('fast', function (e) {

           setTimeout(function (e) {

                $('.modal').removeClass('on');
                $("body").removeClass("lock-dt");
                $("html").removeClass("lock-dt");
            }, 200);
        });

        if($("#video").length)
            $("#video").attr("src", "");

        if($('.fa-fullscreen').length > 0 )
            $('.fa-fullscreen').focus();
        else if($('.play_video').length > 0)
            $('.play_video').focus();
    }
});

$(window).resize(function(e){

    if($('#flexslider-services').length)
        initSlider(3);
    changeView();
});

$(window).scroll(function(e) {

    if($(window).scrollTop() > 500)
        $('.footer').removeClass('hide');
    else
        $('.footer').addClass('hide');
});

initSlider = function(numberOfItems) {

    $('#flexslider-services').slick({
        touchMove: true,
        autoplay: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        centerPadding: "50px",
        prevArrow: '<div class="flex-nav-prev"><span class="flex-prev"></span></div>',
        nextArrow: '<div class="flex-nav-next"><span class="flex-next"></span></div>',
        responsive: [
            {
                breakpoint: 800,
                settings: {
                    slidesToShow: 3,
                    centerMode: true,
                    centerPadding: "10px",
                    slidesToScroll: 1
                }
            },
        ]
    });
};

initMapFromMyPosition = function(position) {

    var searchLocation = composeUrl('includes/get_geo_locations.php','');
    var transportation = $('input[name="transportation"]').is(':checked') ? 1 : 0;

    $.ajax({
        type: "POST",
        url: searchLocation,
        data: {lat: position.coords.latitude, lng:position.coords.longitude,transportation:transportation,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
        success: function(result) {

            if($('#search-results').length > 0)
                $('#search-results').remove();
            $('#content-contain-results').append(result);

            $('html, body').animate({
                scrollTop: $('#search-results').offset().top
            }, 'slow');
        }
    });

    return false;
};

initMapFromMyPositionFromHome = function (position) {

    var searchLocation = composeUrl('includes/get_geo_locations.php','');

    $.ajax({
        type: "POST",
        url: searchLocation,
        data: {lat: position.coords.latitude, lng:position.coords.longitude,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
        success: function(result) {

            var data = $.parseJSON(result);
            if(data !== undefined) {
                var address = data.formatted_address.replace(/\s+/g, '+');
                if($('#search_by_physician').is(':checked')|| $('.physicians').length)
                    var searchLocation = composeUrl('physicians',address);
                else
                    var searchLocation = composeUrl('our-locations',address);
                window.location.href = searchLocation;
            }
        }
    });

    return false;
};

composeUrl = function(page,uri){

    var domain =$('meta[name="trk-domccc"]').attr('content');//
    return domain+page+'/'+uri;
};

saveDefaultPhysician = function (physician, center) {

    var searchLocation = composeUrl('includes/set_default_physician.php','');

    $.ajax({
        type: "POST",
        url: searchLocation,
        data: {current_physician: physician,current_center: center,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
        success: function(result) {

            var data = $.parseJSON(result);
            if(data !== undefined) {
                window.location.reload();
            }
        }
    });
};

cleanModal = function(step){

    if(step == 0) {

        $('#modal_county input[type="hidden"]').val('-1');
        $('#modal_county .current-selection').text($('#modal_county .current-selection').data('default'));
    }

    if(step == 1 || step == 0){

        $('#modal_location_county').css('display','none');
        $('#modal_location_county input[type="hidden"]').val('-1');
        $('#modal_location_county .current-selection').text($('#modal_location_county .current-selection').data('default'));
        $('#modal_location_county').find('ul').html("");
    }

    if(step == 2 || step == 1 || step == 0) {

        $('#modal_physician').css('display','none');
        $('#modal_physician input[type="hidden"]').val('-1');
        $('#modal_physician .current-selection').text($('#modal_physician .current-selection').data('default'));
        $('#modal_physician').find('ul').html("");

    }


    $('.modal-block').slideUp('fast');
};

correctCaptcha = function(response){

    $('input[name="g_response"]').val(response);
};

onloadCallback = function(){
    if($('#contact-recaptcha').length)
        widgetId1 = grecaptcha.render('contact-recaptcha', {
            'sitekey' : '6Lfkjr0UAAAAAIjjETFe1v84fqu4WAx6Y3rWdRIW',
            'callback' : 'correctCaptcha'
        });
};

initContactModal = function (input) {

    cleanModal(0);

    $('.modal-appointment').find('.message').removeClass('error');
    $('.modal-appointment').find('.message').removeClass('success');
    $('.modal-appointment').find('.message').html('');

    var title = $(input).data('title');
    var action = $(input).data('action');
    var county = $(input).data('county');
    var location = $(input).data('location');
    var physician = $(input).data('physician');

    $('.modal-appointment').attr('data-action',action);
    $('#action-requested span').html(action.split('_')[0]);

    if(county != undefined && county.length > 0)
    {
        $('.modal-appointment').find('input[name="modal_county"]').first().val(county);
        $('#modal_county').find('.current-selection').html(county);

        if(location != undefined && location.length > 0 && $('#modal_location_county').data('visible').toString().indexOf(action) !== -1) {

            var searchLocation = composeUrl('includes/ajax_locations_modal.php','');
            $.ajax({
                type: "POST",
                url: searchLocation,
                data: {county: county,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
                success: function(result) {

                    var data = $.parseJSON(result);
                    $('#modal_location_county').css('display','none');
                    $('#modal_location_county input[type="hidden"]').val('-1');
                    $('#modal_location_county .current-selection').text($('#modal_location_county .current-selection').data('default'));
                    $('#location_county').find('ul').html("");
                    if(data !== undefined) {

                        $('#modal_location_county').find('ul').append($('<li>'+$('#modal_location_county .current-selection').data('default')+'</li>'));
                        $.each(data, function(pos, item){

                            var li = $('<li class="option-selection" data-val="'+item.name+' Care Center"><span>'+item.name+' Care Center</span></li>');
                            $('#modal_location_county').find('ul').append(li);
                        });

                        $('#modal_location_county').css('display','block');
                        $('.modal-appointment').find('input[name="modal_location_county"]').first().val(location);
                        $('#modal_location_county').find('.current-selection').html(location);
                    }
                }
            });

            if(physician != undefined && physician.length > 0 && $('#modal_physician').data('visible').toString().indexOf(action) !== -1) {

                var searchLocation = composeUrl('includes/ajax_physician_modal.php','');
                $.ajax({
                    type: "POST",
                    url: searchLocation,
                    data: {location: location,CsrfToken: $('meta[name="csrf-token"]').attr('content')},
                    success: function(result) {

                        var data = $.parseJSON(result);
                        $('#modal_physician input[type="hidden"]').val('-1');
                        $('#modal_physician .current-selection').text($('#modal_physician .current-selection').data('default'));
                        $('#location_county').find('ul').html("");
                        if(data !== undefined) {

                            $('#modal_physician').find('ul').append($('<li class="option-selection" data-val="'+$('#modal_physician .current-selection').data('default')+'"><span>'+$('#modal_physician .current-selection').data('default')+'</span></li>'));
                            $.each(data, function(pos, item){

                                var li = $('<li class="option-selection" data-val="'+item.doctor_name+'"><span>'+item.doctor_name+'</span></li>');
                                $('#modal_physician').find('ul').append(li);
                            });

                            $('.modal-appointment').find('input[name="modal_physician"]').first().val(physician);
                            $('#modal_physician').find('.current-selection').html(physician);
                            $('#modal_physician').css('display','block');
                        }
                    }
                });


            }
        }
    }

    $('.modal-appointment h2').html(title);

    if(action != -1) {

        $.each($('.modal-show'),function (pos, item) {

            if($(item).data('visible').toString() == "all" || $(item).data('visible').toString().indexOf(action) !== -1) {
                $(item).css('display','block');
            } else
                $(item).css('display','none');
        });
    }
};

changeView = function(){

    if($('#event-list').length > 0){

        if($(window).width() > 650) {

            if($('#events-calendar').fullCalendar('getView').name == "monthOneWeek")
                $('#events-calendar').fullCalendar('changeView', 'month');
        }
        else if($('#events-calendar').fullCalendar('getView').name == "month"){
            $('#events-calendar').fullCalendar('changeView', 'monthOneWeek');
        }
    }
};

