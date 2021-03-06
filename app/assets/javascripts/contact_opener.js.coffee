$ ->
  $("#contact_popup .opener").click (e) ->
    e.preventDefault()
    if $(this).parent().parent().css("bottom") == "55px"
      $(this).parent().parent().css("bottom", "-409px")
      $(".my_overlay").fadeOut(500)
    else
      $(this).parent().parent().css("bottom", "55px")
      $(".my_overlay").fadeIn(500)

$(window).on "scroll", ->
  scrollHeight = $(document).height()
  scrollPosition = $(window).height() + $(window).scrollTop()
  
  # when scroll to bottom of the page
  if (scrollHeight - scrollPosition) / scrollHeight is 0
    $("#contact_popup .opener").parent().parent().css("bottom", "-466px")
  else
    $("#contact_popup .opener").parent().parent().css("bottom", "-409px")
  return
