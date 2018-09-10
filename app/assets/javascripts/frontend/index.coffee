#= require ./_helpers
#= require ./_events
#= require_self


((window, document, ProJ) ->
  'use strict'

  turbo = window.Turbolinks?
  Turbolinks.supported = no if turbo and navigator.userAgent.match /Firefox\/(\d+)\./


  ProJ.onready ->
    ProJ.fn.onready()
    ProJ.onload ProJ.fn.onload


  if turbo
    ProJ(document)
      .on 'turbolinks:visit', ->
        turbo = 'visit'
      .on 'turbolinks:load', ->
        if turbo is 'visit'
          componentHandler.upgradeDom()
          ProJ.fn
            .onready()
            .onload()
      .on 'turbolinks:before-cache', ->
        ProJ.Lazyload.reset()

# ----------------------------------------------------------------------------------------------------

) window, document, ProJ
