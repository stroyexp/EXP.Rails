((document, ProJ) ->
  'use strict'


  class Lightbox

    constructor: (options) ->
      @default = ProJ.extend
        padding: 0
        show: 250
        hide: 250
        step: 250
      , options

      @overlay = document.createElement 'div'
      @overlay.className = 'lightbox-overlay'
      @overlay.style.display = 'none'
      @overlay.addEventListener 'click', => @hide()

      el = document.createElement 'div'
      el.className = 'lightbox-wrapper'
      @overlay.appendChild el

      @content = document.createElement 'div'
      @content.className = 'lightbox-content'
      @content.addEventListener 'click', (event) -> event.stopPropagation()
      el.appendChild @content

      @next = document.createElement 'div'
      @next.className = 'lightbox-next'
      @next.style.display = 'none'
      @next.addEventListener 'click', => @step yes
      @content.appendChild @next

      @prev = document.createElement 'div'
      @prev.className = 'lightbox-prev'
      @prev.style.display = 'none'
      @prev.addEventListener 'click', => @step()
      @content.appendChild @prev

      @close = document.createElement 'div'
      @close.className = 'lightbox-close'
      @close.addEventListener 'click', => @hide()
      @content.appendChild @close
      @

    load: (selector, options) ->
      @options = ProJ.extend {}, @default, options
      @target = selector or ProJ '[data-lightbox]'
      @target = ProJ @target if not (@target instanceof ProJ)
      @stack = {}
      @group = @path = ''
      @item el for el in @target
      @content.style.padding = "#{ @options.padding }px" if @options.padding
      document.body.appendChild @overlay
      ProJ

    item: (el) ->
      path = el.href or el.dataset.href or el.dataset.lightboxHref or el.src
      group = if path[0] is '#' then 'html' else el.dataset.lightbox
      if group and group isnt 'html' and group isnt 'ajax'
        @stack[group] = [] if not @stack[group]?
        @stack[group].push path

      el.addEventListener 'click', (event) =>
        event.preventDefault()
        @path = path
        @group = group
        switch group
          when 'html' then @html()
          else
            @draw()
        no

    html: ->
      @image?.style.display = 'none'
      @content.className = 'lightbox-content lightbox-html'

      @next.style.display = @prev.style.display = 'none'

      if not @modal?
        @modal = document.createElement 'div'
        @modal.className = 'lightbox-modal'
        @content.appendChild @modal

      @modal.style.display = ''
      el = ProJ(@path).get()
      if el
        @modal.innerHTML = el.innerHTML
        @show()

    draw: (step) ->
      @modal?.style.display = 'none'
      @content.className =  'lightbox-content lightbox-draw'

      if not @image?
        @image = document.createElement 'img'
        @image.className = 'lightbox-image'
        @content.appendChild @image
        (fn = => @image.style.maxHeight = "#{ Math.floor window.innerHeight * .95 }px")()
        ProJ.onresize fn

      if @group and @stack[@group].length > 1
        @next.style.display = @prev.style.display = ''
      else
        @next.style.display = @prev.style.display = 'none'

      @image.src = @path
      @image.style.display = ''
      if @image.complete
        @show step
      else
        @image.onload = => @show(step)

    show: (step) ->
      if step
        ProJ(@content).show @options.step
      else
        ProJ(@overlay).show @options.show

    hide: (cb) ->
      if cb
        ProJ(@content).hide @options.step, cb
      else
        ProJ(@overlay).hide @options.show

    step: (next) ->
      idx = @stack[@group].indexOf @path
      if next
        if idx < @stack[@group].length - 1
          ++idx
        else
          idx = 0
      else
        if idx > 0
          --idx
        else
          idx = @stack[@group].length - 1
      @hide =>
        @path = @stack[@group][idx]
        @draw yes


  ProJ.lightbox = (selector, options) -> (@Lightbox ?= new Lightbox options).load selector, options

# ----------------------------------------------------------------------------------------------------

) document, ProJ
