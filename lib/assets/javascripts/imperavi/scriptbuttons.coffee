(($) ->
  $.Redactor.prototype.scriptbuttons = ->
    init: ->
      sup = @button.add 'sup', 'x²'
      sub = @button.add 'sub', 'x₂'
      @button.addCallback sup, @scriptbuttons.formatSup
      @button.addCallback sub, @scriptbuttons.formatSub
    formatSup: -> @inline.format 'sup'
    formatSub: -> @inline.format 'sub'
) jQuery
