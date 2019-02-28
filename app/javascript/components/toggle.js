const initToggle = () => {
  const icons = document.querySelectorAll(".feature-choice div");
  icons.forEach( icon => {
    icon.addEventListener("click", event => {
      const element = event.target
      if (element.classList.contains("active")) {
        const url = element.style.backgroundImage.slice(4, -13).replace(/"/g, "");
        element.setAttribute('style', `background-image: url(${url}.svg);`);
      }
      else {
        const url = element.style.backgroundImage.slice(4, -6).replace(/"/g, "");
        element.setAttribute('style', `background-image: url(${url}-active.svg);`);
      }
      element.classList.toggle("active");
    });
  });
}

export { initToggle };



  // $(document).ready(function(){
  //   $().click(function(){
  //     $(this).toggleClass("active");
  //     console.log('???')
  //     if ($(this).classList.contains("active")) {
  //     } else {
  //       console.log('not working')
  //     }
  //   });
  // });
