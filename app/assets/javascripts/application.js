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
// $(document).ready(function() {

// 	$('#show-all-doors').click(function(event) {
// 	 event.preventDefault();
// 	 console.log("Prevent");

// 		$.ajax({

// 			method: "GET",
// 			url: '/doors',
// 			data: 

// 		})
// 	});

// 	targetRow = $('#table-row-'+targetId);
// 	console.log(targetRow);
// 	var path = '/doors/'+targetId+'/edit'
// 	targetRow.append

// 	$('.deck-table-cell.edit-link').click(function(event) {
// 		 var targetId = event.target.id;
// 		 console.log(targetId);
// 		 event.preventDefault();
// 		 console.log("CLICK");
			
// 		});

// 		$.ajax({

// 		  method: "GET",
// 		  url: path,
//			data: 

// 		})

// 		.done(function(response){
// 			 console.log(response);
// 		})
// 	})
// });


$(function() {

	var Dashboard;

	Dashboard = {

		handleMenuClick: function(clickTarget) {
			var element;
			$(clickTarget).removeAttr('href');
			element = $(clickTarget).parent('li');
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
			var element;
			if (!window.location.hash) {
				element = $('li#default-nav-item');
				return this.expandNavItem(element);
			}
		},

		showDashboard: function(clickTarget, selector) {
			this.clearDashboard();
			$(selector).show();
			return $(clickTarget).addClass('active');
		},

		clearDashboard: function() {
			$('.dashboard').hide();
		},

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

		// nav.enableDisableButton('LogIn', (userID != "") && (userPass != ""))

		// document.getElementById("loginErrMsg").className = "hidden";
	}

	function onLogIn() {
		// if (nav.isButtonEnabled('LogIn')) {
			// var userID = document.getElementById("userID").value;
			// var userPass = document.getElementById("userPass").value;
		// 	nav.disableButton('LogIn');
		// }
		// document.getElementById("loginErrMsg").className = "hidden";
	}

	Dashboard.bindEvents();
	return Dashboard.expandDefaultNavItem();

});
