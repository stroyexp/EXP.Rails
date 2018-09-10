(($) ->
  $.Redactor.prototype.bufferbuttons = ->
    init: ->
      if 'html' in @opts.buttons
        undo = @button.addAfter 'html', 'undo', 'Undo'
      else
        undo = @button.addFirst 'undo', 'Undo'
      redo = @button.addAfter 'undo', 'redo', 'Redo'
      @button.addCallback undo, @buffer.undo
      @button.addCallback redo, @buffer.redo
) jQuery
