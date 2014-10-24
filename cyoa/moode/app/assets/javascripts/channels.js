$(function (){

	sortList = function($element) {
		var mylist = $element;
		var listitems = mylist.children('li').get();
		listitems.sort(function(a, b) {
		   return $(a).text().toUpperCase().localeCompare($(b).text().toUpperCase());
		})
		$.each(listitems, function(idx, itm) { mylist.append(itm); });
	}

	addToGraph = function($element) {
		$element.fadeOut(function() {
			$element.appendTo('#added-channels ul').fadeIn(function (){
				if($('#added-channels li').length >= 3)
					$(".draggable-channels").draggable("disable");
    	    	updateData(updateSeriesAndRedrawChart);
			});
		});
	};

	addToList = function(element) {
		$(element).fadeOut(function() {
			$(element).appendTo('#slack-channels').fadeIn(function (){
				sortList($('#slack-channels'));
				if($('#added-channels li').length < 3 && $(".draggable-channels").draggable("option").disabled)
					$(".draggable-channels").draggable("enable");
    	    	updateData(updateSeriesAndRedrawChart);
			});
		});
	};

	
    $("#search").keyup(function() {
    	var $cells = $("#slack-channels li");
        var val = $.trim(this.value).toUpperCase();
        if (val === "")
            $cells.show();
        else {
            $($cells.filter(function() {
                return -1 == $(this).text().toUpperCase().indexOf(val);
            })).hide();

            $($cells.filter(function() {
                return -1 != $(this).text().toUpperCase().indexOf(val);
            })).show();
        }
    });

	$(".draggable-channels").draggable({
	    cancel: "a.ui-icon", // clicking an icon won't initiate dragging
	    revert: "invalid", // when not dropped, the item will revert back to its initial position
	    appendTo: "body",
	    containment: "document",
	    helper: "clone",
	    cursor: "move",
	    opacity: 0.8
    });

    $("#moodContainer").droppable({
    	accept: ".draggable-channels",
    	activeClass: "drop-here",
    	drop: function(event, ui) {
    		addToGraph(ui.draggable);
    	}
    });

    // $("a").click(function (event){
    // 	event.preventDefault();
    // });

    $("li").click(function (){
    	addToList(this);
    	return false;
    });

    // $("#channels li").click(function (){
    // 	addToGraph(this);
    // 	return false;
    // });

});