// import swal from 'sweetalert';
import flatpickr from 'flatpickr'
import '/Users/nealsutaria/code/nealsutaria/checkboxes_part2/node_modules/flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {
  altInput: true

});

import {bindSweetAlertButtonDemo} from "./../components/submitrecord.js";

bindSweetAlertButtonDemo();



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
}


$(document).ready(function () {
      $('#reasonedit_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherReasonedit").show() : $("#otherReasonedit").hide();
      });


 });

















