$ = require 'jquery'

module.exports =

  initExpandContent: ->
    $('body').on 'tap', '.js-display-content', (e) ->
      e.preventDefault()

      if $(e.currentTarget).hasClass('is-active')
        $(e.currentTarget).removeClass('is-active')
        $(e.currentTarget).siblings('.js-section-content').toggleClass('closed')
      else
        $('.js-section-content').addClass('closed')
        $('.body-section > a').removeClass('is-active')

        $(e.currentTarget).addClass('is-active')
        $(e.currentTarget).siblings('.js-section-content').removeClass('closed')