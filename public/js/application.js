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

  $("#edit-question").on("click", function(event){
    event.preventDefault();
    var $editQuestionTag = $(this)
    var $link = $(this).attr('href')

    $.ajax({
      method: 'get',
      url: $link
    }).done(function(response){
      $($editQuestionTag).hide()
      $("#question-info").html(response)
    })
  })

  $(".new-answer-section").on("click", "#new-answer-link", function() {
    event.preventDefault();
    var $link = $(this);
    var $url = $(this).attr("href");

    $.ajax({
      method: 'get',
      url: $url,
    }).done(function(res) {
      console.log(res);
      $($link).hide();
      $($link).closest(".new-answer-section").append(res);
    })
  })
});
