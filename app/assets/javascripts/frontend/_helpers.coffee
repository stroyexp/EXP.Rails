((document, ProJ) ->
  'use strict'

  ProJ.fn ?= {}


  ProJ.fn.aligns = ->
    ProJ('.h-js--aligns').aligns '.h-js--align'
    @


  ProJ.fn.submit = ->
    ProJ('[data-submit]').on 'change', ->
      if @dataset.submit
        document.querySelector(@dataset.submit).submit()
      else
        @parentNode.submit()
    @


  ProJ.fn.snackbar = ->
    document.querySelector('.mdl-js-snackbar')?.MaterialSnackbar.showSnackbar(
      message: msg.innerHTML
      actionHandler: -> alert msg.innerHTML
      actionText: msg.dataset.type
    ) for msg in document.querySelectorAll '.c-message--flash'
    @

# ----------------------------------------------------------------------------------------------------

) document, ProJ
