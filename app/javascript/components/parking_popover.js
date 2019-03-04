const items = document.querySelectorAll(".card");
const itemstwo = document.querySelectorAll(".card-title");

const popOvers = document.querySelectorAll(".lot");
const closePopupBtns = document.querySelectorAll(".close-popup");

items.forEach(item => {
  item.addEventListener("click", e => {
    popOvers.forEach(po => (po.style.display = "none"));
    const targetId = e.target.closest(".card").dataset.target;
    const target = document.getElementById(targetId);
    target.style.removeProperty("display");
  });
});

itemstwo.forEach(item => {
  item.addEventListener("mouseover", e => {
    popOvers.forEach(po => (po.style.display = "none"));
  });
});


closePopupBtns.forEach(clbtn => {
  clbtn.addEventListener("click", e => {
    popOvers.forEach(po => (po.style.display = "none"));
  })
})
