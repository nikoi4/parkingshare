import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS


flatpickr(".datepicker", {
    enableTime: true,
    minDate: "today",
    dateFormat: "M-d H:i"
})
