import "bootstrap";


var steps = document.querySelectorAll('.step-callback');
var i;
for (i = 0; i < steps.length; i++) {
  $(steps[i]).on('shown.bs.modal', function (e) {
    var id = this.id.split("_")[1]
    $.get({
      url: "/steps/" + id,
      success: function(result){
        console.log("oi")
      }
    });
  })
}
