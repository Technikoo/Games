$(function() {
    $(".pageLoader").click(function() {
      $page = $(this).data("page") ;
      console.log("log message:" + $page);
      $("#content").load($page);
    });
  });

$(document).ready(function(){
    $('#content').load("astronomie.html");
 });