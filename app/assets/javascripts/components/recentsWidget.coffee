@RecentsWidget = React.createClass
  getInitialState: ->
    articles: @props.articles
  render: ->
    React.DOM.div
      className: 'col-sm-6 col-md-12 col-lg-12'
      React.DOM.div
        className: 'panel panel-default theme-panel'
        React.DOM.div
          className: 'panel-heading',
          'Recent Articles'
        React.DOM.div
          className: 'panel-body nopadding'
          React.DOM.div
            className: 'list-group',
            for article in @state.articles
              React.createElement Article, key: article.id, article: article