const initToggle = () => {
  $(document).ready(function(){
    $(".feature-choice div").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { initToggle };
