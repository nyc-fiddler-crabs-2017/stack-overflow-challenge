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

  $("#show_question_form").on("click", function(event){
    event.preventDefault();
    var $link = $(this).attr('href')
    var $newQuestionLink = this

    $.ajax({
      method: 'get',
      url: $link
    }).done(function(response){
      $(".class5").append(response)
      $($newQuestionLink).hide()
    })
  })

  $(".class5").on("submit", "#new_question_form", function(event){
    event.preventDefault()
    var data = $(this).serialize()
    var $link = $(this).attr("action")
    var $form = $(this)

    $.ajax({
      method: 'post',
      url: $link,
      data: data
    }).done(function(response){
      $(".class5").append(response)
      $($form).hi

    })
  })




});
