const featuresFilter = document.getElementById('features_filter')
const featuresPopover = document.querySelector('.features-container')
const closeFeaturesContainer = document.querySelector('.close-features-container')


featuresFilter.addEventListener('click', (event) => {
  featuresPopover.style.removeProperty("display");
});

closeFeaturesContainer.addEventListener('click', (event) => {
  featuresPopover.style.display = 'none';
});
