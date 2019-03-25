let booking = document.getElementById("booking-amount");
if (booking) {
  window.setInterval(function(){
    booking = document.getElementById("booking-amount");
    if (parseInt(booking.innerText) > 0) {
      booking.classList.remove("booking-display");
    }
    else {
      booking.classList.add("booking-display");
    }
  }, 1000);
};
