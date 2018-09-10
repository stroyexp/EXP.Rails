((window, document, ProJ) ->
  'use strict'


  ProJ.extend

    aligns: (selector) ->
      val = 0
      ProJ.to(selector)
        .each ->
          @style.height = ''
          height = ProJ(@).innerHeight()
          val = height if height > val
        .each ->
          @style.height = "#{ val }px"
      @

    scroll: (options, callback) ->
      ProJ('[data-scroll]').onclick (event) ->
        event.preventDefault()
        selector = @dataset.scroll or @getAttribute 'href'
        if selector and not @parentNode.classList.contains 'active' and not @classList.contains 'active'
          if selector is '#'
            ProJ.totop options, callback
          else
            ProJ.toobj selector, options, callback
      @

    base64: ->
      @('[data-base64]').each -> @innerHTML += atob @dataset.base64
      @

    mailto: ->
      @('[data-mailto]').each ->
        mail = atob @dataset.mailto
        if mail
          @href = "mailto://#{ mail }"
          @innerHTML += mail if not @dataset.mailtoSafe?
        else
          @style.visibility = 'hidden'
      @

    w3c: ->
      window.open "//validator.w3.org/nu/?doc=#{ encodeURIComponent location.href }&showsource=yes&showoutline=yes",
                  '_blank'
      @

    ymet: ->
      window.open "//metrika.yandex.ru/dashboard?id=#{ @dataset.ymet }",
                  '_blank' if @dataset.ymet
      @


  ProJ::extend

    aligns: (selector) ->
      if selector
        @each -> ProJ.aligns ProJ selector, @
      else
        ProJ.aligns @
        @

    deactive: -> @onclick (event) -> event.preventDefault()

    w3c: -> @onclick ProJ.w3c

    ymet: -> @onclick ProJ.ymet

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ
