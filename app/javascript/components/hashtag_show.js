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
        <div class="bg bg-light" id="name"><h5>${name.innerText}</h5></div>
        <div class="bg bg-light" id="date"><strong>Searched on</strong> ${date.innerText}</div>
        <div class="bg bg-light" id="score"><strong>Score is</strong> ${score.innerText}</div>
      </div>
      `
    })

  })

}

export default grabHashtag;
