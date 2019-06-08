$(document).ready ->
  # global $, document

  hexGrid = (container_element, radius, columns, rows, cssClass) ->

    # called throughout, will actually create the polygon element in the DOM
    createSVG = (tag) ->
      $ document.createElementNS('http://www.w3.org/2000/svg', tag or 'svg')

    $(container_element).each ->
      element = $(this)

      hexClick = ->
        hex = $(this)
        element.trigger $.Event('hexclick', hex.data())
        return

      height = Math.sqrt(3) / 2 * radius
      svgParent = createSVG('svg').attr('tabindex', 1).appendTo(element).css(
        width: (1.5 * columns + 0.5) * radius
        height: (2 * rows + 1) * height)
      column = undefined
      row = undefined
      center = undefined

      toPoint = (dx, dy) ->
        Math.round(dx + center.x) + ',' + Math.round(dy + center.y)

      row = 0
      while row < rows
        column = 0
        while column < columns
          center =
            x: Math.round((1 + 1.5 * column) * radius)
            y: Math.round(height * (1 + row * 2 + column % 2))
          createSVG('polygon').attr(
            points: [
              toPoint(-1 * radius / 2, -1 * height)
              toPoint(radius / 2, -1 * height)
              toPoint(radius, 0)
              toPoint(radius / 2, height)
              toPoint(-1 * radius / 2, height)
              toPoint(-1 * radius, 0)
            ].join(' ')
            'class': cssClass
            tabindex: 1).appendTo(svgParent).data(
            center: center
            row: row
            column: column).on('click', hexClick).attr
            'hex-row': row
            'hex-column': column
          column++
        row++
      return

  evenColumnZoc = (selected_row, selected_column) ->
    toggleClicked(selected_row, selected_column)
    toggleZoc(selected_row, selected_column, -1)
    toggleZoc(selected_row, selected_column, -1, 1)
    toggleZoc(selected_row, selected_column, 0, 1)
    toggleZoc(selected_row, selected_column, 1)
    toggleZoc(selected_row, selected_column, -1, -1)
    toggleZoc(selected_row, selected_column, 0, -1)
    return

  oddColumnZoc = (selected_row, selected_column) ->
    toggleClicked(selected_row, selected_column)
    toggleZoc(selected_row, selected_column, -1)
    toggleZoc(selected_row, selected_column, 1, 1)
    toggleZoc(selected_row, selected_column, 0, 1)
    toggleZoc(selected_row, selected_column, 1)
    toggleZoc(selected_row, selected_column, 1, -1)
    toggleZoc(selected_row,selected_column, 0, -1)
    return

  toggleClicked = (selected_row, selected_column) ->
    hex_selector = '#container .hexfield[hex-row=\'' + parseInt(selected_row) + '\'][hex-column=\'' + parseInt(selected_column) + '\']'
    hex = $(hex_selector)[0]
    hex.classList.toggle 'clicked'
    return

  toggleZoc = (selected_row, selected_column, row_adjust=0, column_adjust=0) ->
    next_hex_selector = '#container .hexfield[hex-row=\'' + (parseInt(selected_row) + row_adjust) + '\'][hex-column=\'' + (parseInt(selected_column) + column_adjust) + '\']'
    next_hex = $(next_hex_selector)[0]
    if next_hex?
      next_hex.classList.toggle 'zoc'
    return

  rebuild = ->
    radius = parseInt($('#radius').val())
    columns = parseInt($('#columns').val())
    rows = parseInt($('#rows').val())
    cssClass = 'hexfield'
    $('#container').empty()

    hexGrid($('#container'), radius, columns, rows, cssClass).on 'hexclick', (e) ->
      $('#logger').text 'clicked [' + e.column + ',' + e.row + '] hex with center at [' + e.center.x + ',' + e.center.y + '] px'
      return

    $('#container .hexfield').click ->
      rebuild()
      hex = $(this)
      selected_column = hex.attr('hex-column')
      selected_row = hex.attr('hex-row')
      if selected_column % 2 == 1
        oddColumnZoc selected_row, selected_column
      else
        evenColumnZoc selected_row, selected_column
      return
    return

  $('#rebuild').click rebuild
  rebuild()
  return
