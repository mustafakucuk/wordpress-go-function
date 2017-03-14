WordpressGoFunctionView = require './wordpress-go-function-view'
{CompositeDisposable} = require 'atom'
Shell = require('shell');

module.exports = WordpressGoFunction =
  wordpressGoFunctionView: null
  modalPanel: null
  subscriptions: null
  config:
    wordpressPage:
      title: 'WordPress Function Page'
      type: 'string'
      default: '1'
      enum: [
        {value: '1', description: 'Codex Page'}
        {value: '2', description: 'Developer Page'}
      ]

  activate: (state) ->
    @wordpressGoFunctionView = new WordpressGoFunctionView(state.wordpressGoFunctionViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @wordpressGoFunctionView.getElement(), visible: false)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'wordpress-go-function:toggle': => @toggle()

  toggle: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.hide();
      editor = atom.workspace.getActiveTextEditor()
      wpFunction = editor.getSelectedText()
      if wpFunction is ''
        @modalPanel.show();
      else
        if atom.config.get('wordpress-go-function.wordpressPage') is '1'
          Shell.openExternal('https://codex.wordpress.org/Function_Reference/' + wpFunction);
        else
          Shell.openExternal('https://developer.wordpress.org/reference/functions/' + wpFunction);
