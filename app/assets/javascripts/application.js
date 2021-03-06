// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all

//= require_tree .
//= require jquery.tokeninput
//= require bootstrap
//= require colorbox-rails
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap3
//= require best_in_place
//= require best_in_place.purr



$(document).ready(
	function()
	{
		var modalOpt = 
		{
			'backdrop' : true,
			'show' : true
		};
		
		$('#searchModal').modal(modalOpt);
		
		
		$('.modalLauncher').click(
			function()
			{
				//console.log('booyah');
				$('#searchModal').modal('show');
				//$('#searchModal').css('opacity', 1);
			}
		);
	}
);

$(document).ready(function() {
  /* Activating Best In Place */
  $(".best_in_place").best_in_place();
});
