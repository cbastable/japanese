// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$( document ).ready(function() {
    //value = $("#readings").val(); 
    //alert(value);
    $("#readings").focus();
    var onyomi = $("div.onyomi-test").text().split(", ");
    var kunyomi = $("div.kunyomi-test").text().split("/");
    var kunyomiSplit = kunyomi.join(".").split("."); //fix


    $("#readings").keyup(function() {
    	var input = $(this).val();
    	var onyomiOutput = $("div.onyomi-answer").text().split(", ");
    	var kunyomiOutput = $("div.kunyomi-answer").text().split("/");
    	if ($.inArray(input, onyomi) >= 0) {
    		if ($.inArray(input, onyomiOutput) < 0) {
    		$("div.onyomi-answer").append(input + ", ")
            $("#readings").val("");
    		}
    	}
    	else if ($.inArray(input, kunyomi) >= 0) {
    		if ($.inArray(input, kunyomiOutput) < 0) {
    		$("div.kunyomi-answer").append(input + ", ")
            $("#readings").val("");
    		}
        }        
        else {
            $("span").text("No match yet - enter ひらがな for kunyomi, カタカナ for onyomi. You may need to TAB then SHIFT-TAB to enter multiple readings (known bug).").show().fadeOut(10000);
        }
    }); //readings.keyup

   $("#target").submit(function(e) {
    if ($("div.onyomi-answer").text() != "" || $("div.kunyomi-answer").text() != "") {
        e.preventDefault();
        var nextKanji = $("#pass").find("a:first").attr('href')
        window.location.href = nextKanji;
        }
    else {
        e.preventDefault();
    }    
   }); //target.submit 

   $("body").keydown(function(e) {
    if(e.keyCode == 37) { // left
        var prev = $("#prev").find("a:first").attr('href')
        window.location.href = prev;
    } 
    else if(e.keyCode == 39) { // right
        var next = $("#next").find("a:first").attr('href')
        window.location.href = next;
  }
}); //body.keydown


}); //document.ready



//$(.btn).click(alert($("#readings").val());

//if text-field contents == onyomi||kunyomi .split(".")||.split(", "), kunyomi||onyomi div = text-field
// contents.
//on form submit, go to next kanji in list
//.split(", ")[0]
// var string = $("div.onyomi-test").text()
//$("div.answer").html(string);
//$("div.answer").append(string);
// if (x == y) {
//	blah;
//  bloo;
//}
//if (str.indexOf("Yes") >= 0)
//str.search( 'Yes' ), returns -1 if no or index if yes
//FORM SUBMITTING
//$("form").submit(function() {
//  if ($("input:first").val() == "correct") {
//    $("span").text("Validated...").show();
//    return true;
//  }
//  $("span").text("Not valid!").show().fadeOut(1000);
//  return false;
//});
//$(function() {
   // $("form").submit(function(e) {
   //     e.preventDefault();//prevent the form from actually submitting
 //       var $choice = $(this).find("input[name='value']:checked");//get the selected option 
//        if ($choice.length)// if an option is selected
 //           window.location = $choice.val();
//    });
//});
        //else if ($.inArray(input, kunyomiSplit) >= 0) {
            //if ($.inArray(input, kunyomiOutput) < 0) {
            //$("div.kunyomi-answer").append(input + ", ")
         //   $("#readings").val("");
           // }
       // }