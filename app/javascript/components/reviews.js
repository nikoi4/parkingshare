const see = document.getElementById('see-review')
const your = document.getElementById('your-review')

const initReview = () => {
  if (see) {
    see.addEventListener('click', event => {
      your.click();
    })
  }
}

export { initReview };
