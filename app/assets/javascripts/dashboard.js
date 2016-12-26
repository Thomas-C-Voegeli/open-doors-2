
var Dashboard = {

	handleMenuClick: function(clickTarget) {
		$(clickTarget).removeAttr('href');
		var element = $(clickTarget).parent('li');
		if (!element.hasClass('open')) {
			element.addClass('active');
			this.expandNavItem(element);
		}
	},

	expandNavItem: function(element) {
		element.addClass('open');
		element.children('ul').slideDown(200);
		element.siblings('li').children('ul').slideUp(200);
		element.siblings('li').removeClass('open');
		element.siblings('li').find('li').removeClass('open');
		element.siblings('li').find('ul').slideUp(200);
	},

	expandDefaultNavItem: function() {
		if (!window.location.hash) {
			var element = $('li#default-nav-item');
			this.expandNavItem(element);
		}
	},

	getEditForm: function (event) {
		event.preventDefault();
		var doorId = $(this).attr('id');
		Dashboard.clearDashboard();

		var method = "GET",
			path = '/doors/'+doorId+'/edit',
			data = {};

		Dashboard.showDashboard(method, path, data);
	},

	submitEditForm: function(event){
		event.preventDefault();
		var doorId = $(this).attr('id');
		Dashboard.clearDashboard();

		var method = "PUT",
			path = '/doors/'+doorId,
			data = $(this).serialize();

		Dashboard.showDashboard(method, path, data);
	},

	getAddForm: function(event){
		event.preventDefault();
		Dashboard.clearDashboard();

		var method = "GET",
			path = '/doors/new',
			data = {};

		Dashboard.showDashboard(method, path, data);
	},

	submitAddForm: function(event){
		event.preventDefault();
		Dashboard.clearDashboard();

		var method = "POST",
			path = '/doors/',
			data = $(this).serialize();

		Dashboard.showDashboard(method, path, data);
	},

	getDoors: function(event){
		event.preventDefault();
		Dashboard.clearDashboard();

		var method = "GET",
			path = '/doors',
			data = {};

		Dashboard.showDashboard(method, path, data);
	},

	showDashboard: function(method, path, data){
		$.ajax({
			method: method,
			url: path,
			data: data
		})
		.done(function(response){
			$('.dashboard').append(response);
		});
	},

	clearDashboard: function(){
		$(".dashboard").children().hide();
	},

	bindEvents: function() {
		var self = this;
		$('body').on('click', '.deck-table-cell.edit-link', Dashboard.getEditForm);
		$('body').on('submit', 'form.door-edit-form', Dashboard.submitEditForm);
		$('body').on('click', 'a#add-new', Dashboard.getAddForm);
		$('body').on('submit', 'form.door-add-form', Dashboard.submitAddForm);
		$('body').on('click', '#doors-index', Dashboard.getDoors);
		$('#cssmenu li.has-sub>a').click(function() {
			self.handleMenuClick(this);
		});
	}
};

$(document).ready(function() {
	Dashboard.bindEvents();
	Dashboard.expandDefaultNavItem();
});
