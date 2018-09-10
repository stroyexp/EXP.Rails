((document, ProJ) ->
  'use strict'

  ProJ.fn ?= {}


  ProJ.fn.onload = ->
    ProJ.fn.aligns()
    ProJ
      .lazyload '.mdl-layout__content'
      .ymaps '.c-content__ymap'
    ProJ('[data-click]').each () ->ProJ.onclick @, @dataset.click
    setTimeout ProJ.fn.snackbar, 1000
    @


  ProJ.fn.onready = ->
    ProJ('a.is-active, .is-active > a').deactive()
    ProJ('[data-ymet]').ymet()
    ProJ('[data-w3c]').w3c()
    ProJ.fn.submit()
    ProJ
      .base64()
      .mailto()
      .scroll()
      .lightbox()
      .onresize ProJ.fn.aligns
    @

# ----------------------------------------------------------------------------------------------------

) document, ProJ
