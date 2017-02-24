window.jQuery = window.$ = require 'jquery'
tocca = require 'tocca'
attachFastClick = require 'fastclick'
require 'waypoints/lib/jquery.waypoints.js'
require 'waypoints/lib/shortcuts/sticky.js'
headerTemplate = -> require('../header/index.jade') arguments...
headerData = require('../header/data.coffee')
bodyTemplate = -> require('../body/index.jade') arguments...
bodyData = require('../body/data.coffee')
footerTemplate = -> require('../footer/index.jade') arguments...
footerData = require('../footer/data.coffee')
{ initSlideShow } = require '../carousel/index.coffee'
{ initExpandContent } = require '../body/index.coffee'
DEFAULT_LANGUAGE = 'traditional'

$ ->
  attachFastClick document.body

  setUpWaypoints = () ->
    sticky = new Waypoint.Sticky
      element: $('.header-section-nav')[0],
      offset: '-35%'

  render = (language) ->
    $('header').html headerTemplate
      copy: headerData
      language: language

    $('.body-content-container.main-side-margin').html bodyTemplate
      copy: bodyData
      language: language

    $('footer').html footerTemplate
      copy: footerData
      language: language


  render(DEFAULT_LANGUAGE)

  $('body').on 'click', '.header-section-nav a', (e)->
    section = $(e.currentTarget).data 'section'
    $('html,body').animate { scrollTop: $("##{section}").offset().top - 140 }, 1000

  $('body').on 'click', 'a.header-chevron-link', (e) ->
    e.preventDefault()
    destination = e.currentTarget.hash
    $('html,body').animate { scrollTop: $(destination).offset().top - 140 }, 1000

  rotateHeaderBanner = ->
    $active = $('.header-slide.active-banner')
    $next = if $active.next('.header-slide').length then $active.next() else $('.header-slide:first')

    $next.addClass('active-banner')
    $active.removeClass('active-banner')

  setUpWaypoints()
  setInterval rotateHeaderBanner, 10000
  initSlideShow()
  initExpandContent()
