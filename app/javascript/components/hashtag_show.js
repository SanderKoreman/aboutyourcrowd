import { initHashtagIndex } from "./hashtag_index";

var grabHashtag = () => {
  var hashtags = document.querySelectorAll(".saved-hashtag-card")
  var container = document.querySelector(".output-info")
  var id = document.querySelector("#hashtagid")


  hashtags.forEach((hash) => {
    hash.addEventListener('click', () => {
      // container.innerText = hash.hashtag
      initHashtagIndex()
      container.innerHTML = `
      <div class="row show-hashtag-row">
        <div class="show-hashtag-name mt-3" id="name"><h2>${hash.querySelector("#hashtagname").innerText}</h2></div>
        <div class="col-6 mt-3 show-card-left text-center">
          <div class="p-0" id="date">On ${hash.querySelector("#hashtagdate").innerText} the score was</div>
          <div class="p-0" id="score">${hash.querySelector("#hashtagscore").innerText}</div>
          <a class="button-secondary link-dashboard-secondary" href="/pdf.pdf?id=${id.innerText}">Download PDF</a>
        </div>
        <div class="col-6 mt-3 show-card-right text-center">
          <p class="mb-0">At this moment the score is</p>
          <div class="p-0" id="score">?</div>
          <a class="button-secondary link-dashboard-secondary" style="cursor: pointer;" href= "/">Find realtime sentiment</a>
        </div>
      </div>
      `
    })
  })

}

export default grabHashtag;
