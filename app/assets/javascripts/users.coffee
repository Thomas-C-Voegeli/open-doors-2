# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  Dashboard =

    showDashboardSection: (clickTarget) ->
      if $(clickTarget).next('.section-content').is(':hidden')
        $('.dashboard-section .section-content:visible').slideUp('fast')
        $(clickTarget).next('.section-content').slideDown('fast')
      else
        $(clickTarget).next('.section-content').slideUp('fast')
      @resizeCharts()

    handleMenuClick: (clickTarget) ->
      $(clickTarget).removeAttr 'href'
      element = $(clickTarget).parent('li')
      unless element.hasClass('open')
        # $('a.show-group-dashboard').removeClass('active')
        element.addClass('active')
        @expandNavItem(element)

    expandNavItem: (element) ->
      element.addClass 'open'
      element.children('ul').slideDown 200
      element.siblings('li').children('ul').slideUp 200
      element.siblings('li').removeClass 'open'
      element.siblings('li').find('li').removeClass 'open'
      element.siblings('li').find('ul').slideUp 200

    expandDefaultNavItem: ->
      unless window.location.hash
        element = $('li#default-nav-item')
        @expandNavItem(element)

    restoreDashboardFromUrl: ->
      studentId = window.location.hash.replace('#', '')
      if studentId
        studentLink = $('a[data-student-id=' + studentId + ']')
        @showStudentDashboard(studentLink)
        groupElement = studentLink.parents('li:has(a[data-group-id])').children('a[data-group-id]')[0]
        @handleMenuClick(groupElement)

    showDashboard: (clickTarget, selector) ->
      @clearDashboard()
      $(selector).show()
      $('a.show-group-dashboard').removeClass('active')
      $(clickTarget).addClass('active')

    # showStudentDashboard: (clickTarget) ->
    #   studentId = $(clickTarget).data('student-id')
    #   selector = '#student-dashboard-' + studentId
    #   @showDashboard(clickTarget, selector)

    # showGroupDashboard: (clickTarget) ->
    #   groupId = $(clickTarget).data('group-id')
    #   selector = '#group-dashboard-' + groupId
    #   @showDashboard(clickTarget, selector)

    # showStudentEditForm: (clickTarget) ->
    #   studentId = $(clickTarget).data('student-id')
    #   selector = '#student-edit-form-' + studentId
    #   @showDashboard(clickTarget, selector)

    # showStudentCreateForm: (clickTarget) ->
    #   @clearDashboard()
    #   $('.student-create-form').show()

    # toggleNewNoteForm: (clickTarget) ->
    #   studentId = $(clickTarget).data('student-id')
    #   $('form#new-note-form-' + studentId).toggle()
    #   $('form#new-note-form-' + studentId + ' textarea').focus()
    #   $('div#no-students-' + studentId).toggle()
    #   $('button#add-new-note-' + studentId).toggle()

    # showEditNoteForm: (clickTarget) ->
    #   noteId = $(clickTarget).data('note-id')
    #   $('a#collapse-note-' + noteId).click()
    #   $('form#edit-note-form-' + noteId).show()
    #   $('#note-content-' + noteId).hide()

    # toggleEditNoteButton: (clickTarget) ->
    #   noteId = $(clickTarget).data('note-id')
    #   $('button#edit-note-' + noteId).toggleClass('hidden')

    # hideEditNoteForm: (clickTarget) ->
    #   noteId = $(clickTarget).data('note-id')
    #   $('form#edit-note-form-' + noteId).hide()
    #   $('#note-content-' + noteId).show()
    #   $('button#edit-note-' + noteId).removeClass('hidden')

    # localizeDates: ->
    #   @localizeDatesToString()
    #   $('.localize-date').each ->
    #     date = new Date($(this).text())
    #     suffix = if hours >= 12 then "PM" else "AM"
    #     hours = ((date.getHours() + 11) % 12 + 1)
    #     formattedDate = "#{date.getMonth()+1}/#{date.getDate()}/#{date.getFullYear()} #{hours}:#{date.getMinutes()} #{suffix}"
    #     $(this).text(formattedDate)

    # localizeDatesToString: ->
    #   $('.localize-date-string').each ->
    #     date = $(this).text()
    #     dateOptions = { weekday: "long", year: "numeric", month: "short", day: "numeric", hour: "2-digit", minute: "2-digit" };
    #     localDate = new Date(date).toLocaleDateString("en-US", dateOptions)
    #     $(this).text(localDate)

    clearDashboard: ->
      $('.dashboard').hide()
      $('.student-edit-form').hide()
      $('.student-create-form').hide()
      $('.show-student-dashboard').removeClass('active')
      $('.show-group-dashboard').removeClass('active')

    bindEvents: ->
      self = this
      # $('.dashboard-header a').click -> self.showStudentEditForm(this)
      $('.dashboard-section .section-header').click -> self.showDashboardSection(this)
      $('#cssmenu li.has-sub>a').click -> self.handleMenuClick(this)
      $('.show-student-dashboard').click -> self.showStudentDashboard(this)
      $('.show-group-dashboard').click -> self.showGroupDashboard(this)
      # $('a.show-student-create-form').click -> self.showStudentCreateForm(this)
      # $('button#cancel-student-edit').click -> self.showStudentDashboard(this)
      # $('button#cancel-student-create').click -> self.clearDashboard(this)
      # $('button.add-new-note').click -> self.toggleNewNoteForm(this)
      # $('button.cancel-new-note').click -> self.toggleNewNoteForm(this)
      # $('button.edit-note').click -> self.showEditNoteForm(this)
      # $('button.cancel-edit-note').click -> self.hideEditNoteForm(this)
      # $('a.collapse-note').click -> self.toggleEditNoteButton(this)

  Dashboard.bindEvents()
  Dashboard.restoreDashboardFromUrl()
  # Dashboard.localizeDates()
  Dashboard.expandDefaultNavItem()