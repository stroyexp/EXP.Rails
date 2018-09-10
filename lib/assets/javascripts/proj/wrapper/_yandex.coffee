((window, document, ProJ) ->
  'use strict'


  class Ymaps

    constructor: (selector, options) ->
      @options = ProJ.extend
        selector: '.c-ymap'
        zoom: 14
        type: 'yandex#map'
        behaviors: ['default']
        controls: ['default']
        preset: 'islands#redDotIcon'
      , options
      @selector = selector or @options.selector

      @


    load: ->
      @target = ProJ @selector
      if @target.length
        if ymaps?
          @loader()
        else
          ProJ.script "//api-maps.yandex.ru/2.1/?lang=#{ options?.locale or 'ru_RU' }", @loader
      ProJ


    loader: => ymaps.ready => @ymap el for el in @target

    error: => @target.addClass 'error'


    ymap: (el) ->
      self = @
      fn = (name, separator) ->
        data = el.dataset[name]
        if data and separator?
          data.split separator
        else
          data or self.options[name]
      fz = ->
        value = parseInt el.dataset.zoom or self.options.zoom
        switch
          when window.innerWidth >= 768
            value + 2
          when window.innerWidth >= 480
            value + 1
          else
            value
      el.removeChild map if map = el.querySelector 'ymaps'
      map = new ymaps.Map el,
        type: fn 'type'
        center: fn 'center', ' '
        zoom: fz()
        behaviors: fn 'behaviors'
        controls: fn 'controls'
      map.geoObjects.add new ymaps.Placemark fn('placemark', ' '),
        iconContent: null
        balloonContent: "<h6>#{ fn 'name' }</h6><div>#{ fn 'info' }</div>"
      ,
        preset: fn 'preset'
        draggable: no
        hideIconOnBalloonOpen: no
      ProJ.onresize -> map.container?.fitToViewport


  ProJ.ymaps = (selector, options) -> (@Ymaps ?= new Ymaps selector, options).load()

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ
