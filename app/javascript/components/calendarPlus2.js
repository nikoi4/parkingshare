const dateFormat = require('dateformat');
const calendar1 = document.getElementById('search_starting');
const calendar2 = document.getElementById('search_ending');

Date.prototype.addHours = function(h) {
   this.setTime(this.getTime() + (h*60*60*1000));
   return this;
}


const calendarPlus2 = () => {
  if (calendar1) {
    calendar1.addEventListener('change', (event) => {
      const datePlus2 = new Date(new Date((new Date(calendar1.value)).addHours(2)).setYear(new Date().getFullYear()));
      calendar2.value = dateFormat(datePlus2, 'mmm-dd HH:MM');
    });
  }
};

export { calendarPlus2 };
