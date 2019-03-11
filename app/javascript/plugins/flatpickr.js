import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS


flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "M-d H:i",
    minDate: "Mar-08 21:02",
})
