# $ ->
# 	Dashboard =

# 		showDashboardSection: (clickTarget) ->
# 			if $(clickTarget).next('.section-content').is(':hidden')
# 				$('.dashboard-section .section-content:visible').slideUp('fast')
# 				$(clickTarget).next('.section-content').slideDown('fast')
# 			else
# 				$(clickTarget).next('.section-content').slideUp('fast')

# 		handleMenuClick: (clickTarget) ->
# 			$(clickTarget).removeAttr 'href'
# 			element = $(clickTarget).parent('li')
# 			unless element.hasClass('open')
# 				element.addClass('active')
# 				@expandNavItem(element)

# 		expandNavItem: (element) ->
# 			element.addClass 'open'
# 			element.children('ul').slideDown 200
# 			element.siblings('li').children('ul').slideUp 200
# 			element.siblings('li').removeClass 'open'
# 			element.siblings('li').find('li').removeClass 'open'
# 			element.siblings('li').find('ul').slideUp 200

# 		expandDefaultNavItem: ->
# 			unless window.location.hash
# 				element = $('li#default-nav-item')
# 				@expandNavItem(element)

# 		showDashboard: (clickTarget, selector) ->
# 			@clearDashboard()
# 			$(selector).show()
# 			$(clickTarget).addClass('active')

# 		clearDashboard: ->
# 			$('.dashboard').hide()
# 			$('.student-edit-form').hide()
# 			$('.student-create-form').hide()

# 		bindEvents: ->
# 			self = this
# 			$('.dashboard-section .section-header').click -> self.showDashboardSection(this)
# 			$('#cssmenu li.has-sub>a').click -> self.handleMenuClick(this)

# 	Dashboard.bindEvents()
# 	Dashboard.expandDefaultNavItem()