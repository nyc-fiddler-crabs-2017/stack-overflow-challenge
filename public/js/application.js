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
      $($link).hide();
      $($link).closest(".new-answer-section").append(res);
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
      $("#bottom-home").append(response)
      $($newQuestionLink).hide()
    })
  })

  $("#bottom-home").on("submit", "#new_question_form", function(event){
    event.preventDefault()
    var data = $(this).serialize()
    var $link = $(this).attr("action")
    var $form = $(this)

    $.ajax({
      method: 'post',
      url: $link,
      data: data
    }).done(function(response){
      $("#q-list").append(response)
      $($form).hide()
      $("#show_question_form").show()
    })
  })

  $(".new-answer-section").on("submit", "#new-answer-form", function() {
    event.preventDefault();
    var $url = $(this).attr("action");
    var $method = $(this).attr("method");
    var $data = $(this).serialize();

    $.ajax({
      method: $method,
      url: $url,
      data: $data,
    }).done(function(res){
      $("#new-answer-form").remove();
      $(".ul-answers").append(res);
      $("#new-answer-link").show();
    })
  })
});
