import swal from 'sweetalert';
 const swalButton = document.getElementById('sweet-alert-edit'), form = document.querySelector('form');
function bindSweetAlertButtonEdit() {
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', (event) => {
      swal({
        title: "Success",
        text: "You've edited the record. Click on ok for the record details",
        icon: "success"

      }).then(function(value){
        if(value!=null){
        form.submit();
        }
      });
        event.preventDefault();
    });
  }
}

export {bindSweetAlertButtonEdit};
