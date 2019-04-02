function getSelect() {
  var numberCell = $(".slt-vocabulary").val();
  var sltLesson = $(".slt-lesson").val();
  if(!sltLesson) {
    alert("Choose lesson!!!");
  }
  $(".vocabulary").removeClass("cell_16");
  $(".vocabulary").removeClass("cell_36");
  $(".vocabulary").removeClass("cell_64");
  $(".vocabulary").addClass("cell_" + numberCell);
  randomTable(numberCell, sltLesson);
}

function removeTable(){
  $(".main-table tr").remove();
  
}

function createTable(params) {
  removeTable();
  var row = Math.sqrt(params);
  var number = 0;
  for( i = 0; i < row; i++){
    $(".main-table").append("<tr class='row"+ i +"'></tr>");
    for( j = 0; j < row; j++){
      var number = number + 1;
      $(".row" + i).append("<th><div class ='cell word_" + number + "'>" + number + "</div> </th>");
    }
  }
}

function randWord(n, arr) {
  var n = n/2;
  var arrWordDisplay = [];
  for(i = 0; i < n; i++) {
    var k = Math.floor((Math.random() * arr.length) + 0);
    arrWordDisplay.push({"id" : i, "word" : arr[k].word});
    arrWordDisplay.push({"id" : i, "word" : arr[k].mean});
    arr.splice(k, 1);
  }
  return arrWordDisplay;
}

function randomTable (params, sltLesson){
  $.ajax({
    url: '/user/get_vocabulary_by_lesson',
    type: 'get',
    dataType: 'json',
    data: {
      sltLesson: sltLesson
    }
  }).done(function(result) {
    console.log(result.arrVocabulary);
    if(params/2 > result.arrVocabulary.length){
      removeTable();
      alert("Số lượng từ vự không đủ hoặc chưa được cập nhật. Vui lòng chọn cấp độ dễ hơn!");
    }
    else {
      createTable(params);
      arrWordDisplay = randWord(params, result.arrVocabulary);
      console.log(arrWordDisplay);
      for(i = 1; i <= params; i ++){
        var k = Math.floor((Math.random() * arrWordDisplay.length) + 0);
        $(".word_" + i).html(arrWordDisplay[k].word);
        $(".word_" + i).attr("val", arrWordDisplay[k].id )
        arrWordDisplay.splice(k, 1);
      }
    }

  });
}

var a = [];
$(".main-table").on("click", "tr th", function() {
  $(this).addClass("active");
  a.push($(".cell", this).attr("val"));
  console.log(a);
  // $('.active div').html("");
  if(a.length == 2){
    setTimeout(function(){
      if(a[0] == a[1]){
        // alert("CO the xoa");
        a =[];
        $('.active div').html("");
        $('.active div').addClass("none");
        $('.active').removeClass("active");
        if($(".none").length == $(".slt-vocabulary").val()){
          $(".main-table tr").remove();
          setTimeout(function() {
            alert("Chuc mung ban da hoan thanh");
          }, 100);
        }
      }
      else
      {
        a =[];
        // alert("Sai");
        $('.active').removeClass("active");
        // $(this).addClass("active");
      }
    }, 100);
  }

});