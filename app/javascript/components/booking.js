const phoneNumber = document.getElementById('phone_number');
const carPlate = document.getElementById('car_plate');
const addCar = document.getElementById('add_car');
const bookingPhoneNumber = document.getElementById('booking_phone_number');
const bookingCarPlate = document.getElementById('booking_car_plate');
const saveAndContinue = document.getElementById('save-and-continue');
const payment = document.getElementById('payment');
const mercadoPago = document.querySelector('.mercadopago-button');

const bookingProcess = () => {

  if (phoneNumber) {
    phoneNumber.addEventListener('blur', (event) => {
      bookingPhoneNumber.value = event.target.value;
    });

    carPlate.addEventListener('input', (event) => {
      if (carPlate.value !== "") {
        addCar.classList.remove('disabled')
        addCar.removeAttribute('disabled')
      } else {
        addCar.classList.add('disabled');
        addCar.setAttribute('disabled','disabled');
      };
    });

    addCar.addEventListener('click', (event) => {
      bookingCarPlate.value = carPlate.value;
      saveAndContinue.classList.remove('disabled');
      saveAndContinue.removeAttribute('disabled')
    });

    saveAndContinue.addEventListener('click', (event) => {
      payment.classList.remove('disabled');
    });

    payment.addEventListener('click', (event) => {
      event.preventDefault();
      mercadoPago.click();
    });
  }
}


export { bookingProcess };
