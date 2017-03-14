module.exports =
class WordpressGoFunctionView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('wordpress-go-function')

    message = document.createElement('div')
    message.textContent = "Please, select a function"
    message.classList.add('message')
    @element.appendChild(message)

  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element
