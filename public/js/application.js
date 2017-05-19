$(document).ready(function() {
  $("#new-comment").on("click", function(event){
    event.preventDefault();
    var $commentLink = $(this)
    var $link = $(this).attr('href');

    $.ajax({
      method: 'get',
      url: $link
    }).done(function(response){

      $($commentLink).hide()
      $($commentLink).closest("#comment-section").html(response)
    })
  })

  $("#edit-button").on("click", function(event){
    event.preventDefault();
    var $editLink = $(this)
    var $link = $(this).attr('href')

    $.ajax({
      method: 'get',
      url: $link
    }).done(function(response){
        debugger
      $($editLink).hide()
      $($editLink).closest("edit-section").html(response)
    })
  })


});
