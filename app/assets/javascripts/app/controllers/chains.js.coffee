$ = jQuery.sub()
Chain = App.Chain

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Chain.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
    
  constructor: ->
    super
    @active @render
    
  render: ->
    @html @view('chains/new')

  back: ->
    @navigate '/chains'

  submit: (e) ->
    e.preventDefault()
    chain = Chain.fromForm(e.target).save()
    @navigate '/chains', chain.id if chain

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
  
  constructor: ->
    super
    @active (params) ->
      @change(params.id)
      
  change: (id) ->
    @item = Chain.find(id)
    @render()
    
  render: ->
    @html @view('chains/edit')(@item)

  back: ->
    @navigate '/chains'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/chains'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Chain.find(id)
    @render()

  render: ->
    @html @view('chains/show')(@item)

  edit: ->
    @navigate '/chains', @item.id, 'edit'

  back: ->
    @navigate '/chains'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Chain.bind 'refresh change', @render
    Chain.fetch()
    
  render: =>
    chains = Chain.all()
    @html @view('chains/index')(chains: chains)
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/chains', item.id, 'edit'
    
  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
    
  show: (e) ->
    item = $(e.target).item()
    @navigate '/chains', item.id
    
  new: ->
    @navigate '/chains/new'
    
class App.Chains extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New
    
  routes:
    '/chains/new':      'new'
    '/chains/:id/edit': 'edit'
    '/chains/:id':      'show'
    '/chains':          'index'
    
  default: 'index'
  className: 'stack chains'