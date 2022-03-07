var grabHashtag = () => {
  var hashtags = document.querySelectorAll(".saved-hashtag-card")
  var container = document.querySelector(".output-info")

  hashtags.forEach((hash) => {
    hash.addEventListener('click', () => {
      // container.innerText = hash.hashtag

      container.innerHTML = `
      <div class="row show-hashtag-row">
        <div class="show-hashtag-name mt-3" id="name"><h2>${hash.querySelector("#hashtagname").innerText}</h2></div>
        <div class="col-6 mt-3 show-card-left">
          <div class="p-0" id="date"><strong>Searched on</strong> ${hash.querySelector("#hashtagdate").innerText}</div>
          <div class="p-0" id="score"><strong>Score is</strong> ${hash.querySelector("#hashtagscore").innerText}</div>
        </div>
        <div class="col-6 mt-3 show-card-right">
          <a class="button-secondary link-dashboard-secondary" style="cursor: pointer;">Find realtime sentiment</a>
        </div>
      </div>
      `
    })

  })

}

export default grabHashtag;
