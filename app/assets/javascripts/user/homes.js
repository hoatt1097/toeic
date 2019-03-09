function getSelect() {
  var numberCell = $(".slt-vocabulary").val();
  $(".vocabulary").removeClass("cell_16");
  $(".vocabulary").removeClass("cell_36");
  $(".vocabulary").removeClass("cell_64");
  $(".vocabulary").addClass("cell_" + numberCell);
  createTable(numberCell);
}

function createTable (params){
  $(".main-table tr").remove();
  var row = Math.sqrt(params);
  var number = 0;
  for( i = 0; i < row; i++){
    $(".main-table").append("<tr class='row"+ i +"'></tr>");
    for( j = 0; j < row; j++){
      var number = number + 1;
      $(".row" + i).append("<th onclick='active()' id='" + number + "'> <div class ='cell'>" + number + "</div> </th>");
    }
  }
}
function active() {
  $(this).addClass("active");
}