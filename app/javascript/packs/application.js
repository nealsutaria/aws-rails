
import swal from 'sweetalert';
import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'


flatpickr(".datepicker", {
  altInput: true

});

import {bindSweetAlertButtonDemo} from "./../components/submitrecord.js";

bindSweetAlertButtonDemo();

import {bindSweetAlertButtonEdit} from "./../components/editrecord.js";

bindSweetAlertButtonEdit();




$(document).ready(function () {
      $('#vaccineedit_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherVaccine").show() : $("#otherVaccine").hide();
      });


 });

if ($('#vaccineedit_description').val() == "Other") {

  $("#otherVaccine").show();

} else {
$("#otherVaccine").hide();
}

$(document).ready(function () {
  $("#otherDesc").hide()
      $('#expense_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherDesc").show() : $("#otherDesc").hide();
      });


 });

if ($('#expens_description').val() == "Other") {

  $("#otherDes").show();

} else {
$("#otherDes").hide();
}

$(document).ready(function () {
      $('#expens_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherDes").show() : $("#otherDes").hide();
      });


 });





$(document).ready(function () {
  $("#otherReason").hide()
      $('#Reason_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherReason").show() : $("#otherReason").hide();
      });


 });



if ($('#reasonedit_description').val() == "Other") {

  $("#otherReasonedit").show();

} else {
$("#otherReasonedit").hide();
$("#vaccineedit_description").hide();

}


$(document).ready(function () {
      $('#reasonedit_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherReasonedit").show() : $("#otherReasonedit").hide();
      });

 });




$(document).ready(function () {
  $("#vaccine_description").hide()
      $('#Reason_description').on('change',function(){
       var selectedValue = $(this).val();
       if (selectedValue == "Vaccine") {
        $("#vaccine_description").show()
       } else {
        $("#vaccine_description").hide();
        $("#otherVaccine").hide();

       }

      });
 });







// selectedValue == "Vaccine" ? $("#vaccine_description").show() : $("#vaccine_description").hide();


// if ($('#reasonedit_description').val() == "Vaccine") {

//   $("#vaccineedit_description").show();

// } else {
//   $("#otherVaccine").hide();
//   $("#vaccineedit_description").hide();

// }



$(document).ready(function () {
      $('#reasonedit_description').on('change',function(){
       var selectedValue = $(this).val();
        if (selectedValue == "Vaccine") {
        $("#vaccineedit_description").show()
       } else {
        $("#vaccineedit_description").hide();
        $("#otherVaccine").hide();

       }

      });


 });


if ($('#reasonedit_description').val() == "Vaccine") {

  $("#vaccineedit_description").show();

} else {
  $("#otherVaccine").hide();
  $("#vaccineedit_description").hide();

}

// selectedValue == "Vaccine" ? $("#vaccineedit_description").show() : $("#vaccineedit_description").hide();




// if ($('#vaccineedit_description').val() == "Other") {

//   $("#otherVaccine").show();

// } else {
// $("#otherVaccine").hide();
// }

// if ($('#vaccineedit_description').val() == "Other") {

//   $("#otherVaccine").show();

// } else {
// $("#otherVaccine").hide();
// }

$(document).ready(function () {
      $('#vaccine_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherVaccine").show() : $("#otherVaccine").hide();
      });


 });

// if ($('#vaccineedit_description').val() == "Other") {

//   $("#otherVaccine").show();

// } else {
// $("#otherVaccine").hide();
// }

// $(document).ready(function () {
//       $('#vaccineedit_description').on('change',function(){
//        var selectedValue = $(this).val();
//         selectedValue == "Other" ? $("#otherVaccine").show() : $("#otherVaccine").hide();
//       });


//  });



$(function() {
  console.log("jquery is loaded")

  $(".vote").on("click", ".upvote, .downvote", function(){
    var post_id = $(this).parent().data("id"),
      is_upvote = $(this).hasClass("upvote")
    console.log("post_id", post_id)
    console.log("is_upvote", is_upvote)
    $.ajax({
      url: "/post/vote",
      method: "POST",
      data: { post_id: post_id, upvote: is_upvote },
      success: function(){
        console.log("success")
      }
    })
  })
})

$(function() {
  console.log("jquery is loaded")

  $(".votecomment").on("click", ".upvote, .downvote", function(){
    var comment_id = $(this).parent().data("id"),
      is_upvote = $(this).hasClass("upvote")
    console.log("comment_id", comment_id)
    console.log("is_upvote", is_upvote)
    $.ajax({
      url: "/comment/votecomment",
      method: "POST",
      data: { comment_id: comment_id, upvote: is_upvote },
      success: function(){
        console.log("success")
      }
    })
  })
})







