import swal from 'sweetalert';
import flatpickr from 'flatpickr'
import '/Users/nealsutaria/code/nealsutaria/checkboxes_part2/node_modules/flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {
  altInput: true

});

$(document).ready(function () {
  $("#otherDesc").hide()
      $('#expense_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherDesc").show() : $("#otherDesc").hide();
      });


 });

$(document).ready(function () {
      $('#expens_description').on('change',function(){
       var selectedValue = $(this).val();
        selectedValue == "Other" ? $("#otherDes").show() : $("#otherDes").hide();
      });


 });


// $(document).ready(function () {
//   if ($('#expense_description').val() == "Other") {
//     $("#otherDesc").show();

//   } else {
//     $("#otherDesc").hide();
//   }

//  });
