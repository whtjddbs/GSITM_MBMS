(function( $ ){
    $.fn.timeselect = function( options ){

        this.addClass('timeselect');

        var settings = $.extend({
            format: "24h", // 12h or 24h
            interval: 30, // in minutes
            startHour: 9,
            endHour: 18,
            hideSeconds:true,
            showSeparator:true,
			disableTimes: ["14:00", "15:00"],
        }, options);

        var times = [];

        for(var i = settings.startHour; i <= settings.endHour; i++)
        {
            var mode = '';//AM

            if(i > 11) {
                mode = 'PM';
            }

            var time = i;

            if(settings.format == '12h'){
                if(time > 12){
                    time = time - 12;
                }
            }

            for(var j = 0; j < 60; j+= settings.interval){
                var fulltime = ('00'+time).substr(-2,2) + ':'+('00'+j).substr(-2,2);

                if(settings.hideSeconds === false) fulltime += ':00';

                if(settings.format == '12h') fulltime += ' '+mode;

                if(i != settings.endHour) {
                    times.push(fulltime);
                }else{
                    if(j == 0) times.push(fulltime);
                }
            }
        }

        var template = '<input type="text" name="timeselect" value=""/><ul style="display:none;">';

        var morningSeparator = false;
        for(var i = 0; i < times.length; i++)
        {
            if(settings.showSeparator === true) {
                var t = times[i].split(':');

                if (t[0] < 12 && (t[1].trim() == "00 AM" || t[1].trim() == "00") && morningSeparator == false) template += '<li class="separator">Morning<hr/></li>'; morningSeparator = true;
                if (t[0] == 12 && (t[1].trim() == "00 PM" || t[1].trim() == "00")) template += '<li class="separator">Afteroon<hr/></li>';
                if (t[0] == 6 && (t[1].trim() == "00 PM" || t[1].trim() == "00")) template += '<li class="separator">Evening<hr/></li>';
            }

			if(checkRange(times[i], settings.disableTimes)) {
			
				template += '<li data-time="'+times[i]+'" class="disable">'+times[i]+'</li>';
			} else {
				template += '<li data-time="'+times[i]+'">'+times[i]+'</li>';
			}
        }

        template += '<br class="clr"/></ul>';
        this.append(template);

        $('input[name=timeselect]').focus(function(){
            $('ul').show();
        });

        $('li').click(function(){
			if($(this).hasClass("disable")) return;
            $('input[name=timeselect]').val($(this).data('time'));
        })

        $(document).mouseup(function(e){
            var container = $('#'+$(this).find('.timeselect').prop('id'));
            if (!container.is(e.target) && container.has(e.target).length === 0){
                $("ul").hide();
            }
        });


        return this;
    };
}( jQuery ));

function checkRange(oneDate, dateRange) {
	let from = moment(dateRange[0], 'HH:mm').format('HH:mm');
	let to = moment(dateRange[1], 'HH:mm').format('HH:mm');
	let now = moment(oneDate, 'HH:mm').format('HH:mm');
	
	console.log(from + " - " + to + " -> " + now);
	
	if( from <= now && now < to) return true;
	else return false;
}