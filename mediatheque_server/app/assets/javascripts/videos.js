jQuery(function($){
  $('#video_cover').change(function(){
    preview = $('#cover')[0];
    var $preview = $(preview);

    //Removing the content oh cover element
    if($preview.children().size() > 0){
      $preview.empty();
    }

    handleFiles(this.files);
  });
});