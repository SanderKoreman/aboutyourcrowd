var grabHashtag = () => {
  var hashtags = document.querySelectorAll(".saved-hashtag-card")
  var container = document.querySelector(".output-info")
  var name = document.querySelector("#hashtagname")
  var date = document.querySelector("#hashtagdate")
  var score = document.querySelector("#hashtagscore")

  hashtags.forEach((hash) => {
    hash.addEventListener('click', () => {
      // container.innerText = hash.hashtag
      container.innerHTML = `
      <div>
        <div class="bg bg-light" id="name">${name.innerText}</div>
        <div class="bg bg-primary" id="date">${date.innerText}</div>
        <div class="bg bg-dark" id="score">${score.innerText}</div>
      </div>
      `
    })

  })

}

export default grabHashtag;
