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

$(function() {
  var Dashboard;
  Dashboard = {
    showDashboardSection: function(clickTarget) {
      if ($(clickTarget).next('.section-content').is(':hidden')) {
        $('.dashboard-section .section-content:visible').slideUp('fast');
        return $(clickTarget).next('.section-content').slideDown('fast');
      } else {
        return $(clickTarget).next('.section-content').slideUp('fast');
      }
    },
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
      $('.student-edit-form').hide();
      return $('.student-create-form').hide();
    },
    bindEvents: function() {
      var self;
      self = this;
      $('.dashboard-section .section-header').click(function() {
        return self.showDashboardSection(this);
      });
      return $('#cssmenu li.has-sub>a').click(function() {
        return self.handleMenuClick(this);
      });
    }
  };
  Dashboard.bindEvents();
  return Dashboard.expandDefaultNavItem();
});
