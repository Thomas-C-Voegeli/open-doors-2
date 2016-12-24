// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs

// // Got a bit of a start on ajaxifying some of the menu buttons/links, I started in application.js just for the initial ease of it, these would later be moved off to other locations more suited to them

$(document).ready(function() {

	$('body').on('click', '.deck-table-cell.edit-link', function () {
		event.preventDefault();
		var doorId = $('.deck-table-cell.edit-link').attr('id');
		$("#dash-block").children().hide();

		$.ajax({

			method: "GET",
			url: '/doors/'+doorId+'/edit',

		})

		.done(function(response){
			console.log("RESPONSE: "+response);
			$('#dash-block').append(response);
		})

	});

	$('body').on('submit', 'form.door-edit-form', function () {
		event.preventDefault();
		var doorId = $(this).attr('id');
		var data = $(this).serialize();
		$('#dash-block').children().hide();

		$.ajax({

			method: "PUT",
			url: '/doors/'+doorId,
			data: data

		})

		.done(function(response){
			console.log("RESPONSE: "+response);
			$('#dash-block').append(response);
		})

	});

	var Dashboard = {

		handleMenuClick: function(clickTarget) {
			$(clickTarget).removeAttr('href');
			var element = $(clickTarget).parent('li');
			if (!element.hasClass('open')) {
				element.addClass('active');
				return this.expandNavItem(element);
			}
		},

		expandNavItem: function(element) {
			element.addClass('open');
			element.children('ul').slideDown(200);
			element.siblings('li').children('ul').slideUp(200);
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			return element.siblings('li').find('ul').slideUp(200);
		},

		expandDefaultNavItem: function() {
			if (!window.location.hash) {
				var element = $('li#default-nav-item');
				return this.expandNavItem(element);
			}
		},

		// showDashboard: function(clickTarget, selector) {
		// 	this.clearDashboard();
		// 	$(selector).show();
		// 	return $(clickTarget).addClass('active');
		// },

		// clearDashboard: function() {
		// 	$('.dashboard').hide();
		// },

		bindEvents: function() {
			var self;
			self = this;
			return $('#cssmenu li.has-sub>a').click(function() {
				return self.handleMenuClick(this);
			});
		}
	};

	function validateInput() {
		// var userID = document.getElementById("userID").value;
		// var userPass = document.getElementById("userPass").value;
		// document.getElementById("loginErrMsg").className = "hidden";
	}

	function onLogIn() {
		// if (nav.isButtonEnabled('LogIn')) {
			// var userID = document.getElementById("userID").value;
			// var userPass = document.getElementById("password-input").value;
		// 	nav.disableButton('LogIn');
		// }
		// document.getElementById("loginErrMsg").className = "hidden";
	}

	Dashboard.bindEvents();
	return Dashboard.expandDefaultNavItem();

});
