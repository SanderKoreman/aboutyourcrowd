const initHashtagIndex = () => {

  var ProgressBar = require('progressbar.js');

  document.querySelectorAll('.chart-container').forEach((container) => {

    var bar = new ProgressBar.Circle(container, {
      color: '#8BBEB2',
      // This has to be the same size as the maximum width to
      // prevent clipping
      strokeWidth: 6,
      trailWidth: 1,
      easing: 'easeInOut',
      duration: 1400,
      text: {
        autoStyleContainer: false
      },
      from: { color: '#8BBEB2', width: 1 },
      to: { color: '#8BBEB2', width: 6 },
      // Set default step function for all animate calls
      step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color);
        circle.path.setAttribute('stroke-width', state.width);
        var value = container.dataset.score;
        if (value === 0) {
          circle.setText('');
        } else {
          circle.setText(value);
        }

      }
    });
    bar.text.style.fontFamily = '"Roboto", Helvetica, sans-serif';
    bar.text.style.fontSize = '1.5rem';
    // console.log(container.dataset.score);
    bar.animate((container.dataset.score) / 10);  // Number from 0.0 to 1.0
  })
}

export { initHashtagIndex }
