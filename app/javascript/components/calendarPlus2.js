
const calendar1 = document.getElementById('search_starting');
const calendar2 = document.getElementById('search_ending');

Date.prototype.addHours = function(h) {
   this.setTime(this.getTime() + (h*60*60*1000));
   return this;
}

const calendarPlus2 = () => {
  if (calendar1) {
    calendar1.addEventListener('blur', (event) => {
      calendar2.value = (new Date(calendar1.value)).addHours(2).setYear(new Date().getYear());
    });
  }
};

export { calendarPlus2 };
