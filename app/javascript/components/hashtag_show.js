var grabHashtag = () => {
  // stuff we need to select, WE WANT TO MANIPULATE- tARGETING.
  var hashtags = document.querySelectorAll(".saved-hashtag-card")
  var container = document.querySelector(".output-info")
  var id = document.querySelector("#hashtagid")
  var newBtns = document.querySelectorAll(".last-searched-hashtag-name")
  var my_hash

  // ADD EVENT LISTENER -CLICK OR SCROLL, STAFF WE WANT TO EXECUTE
  newBtns.forEach((btn) => {
    btn.addEventListener('click', () => {
      var my_hash = ""

      hashtags.forEach((el) => {
        if(el.innerText == `#${btn.innerText}`) {
          my_hash = el
        }
      })
      // container.innerText = hash.hashtag
      // initHashtagIndex()
      // 3EXECUTION OF WHAT I WANT TO DO
      container.innerHTML = `
      <div class="row show-hashtag-row">
        <div class="show-hashtag-name mt-3" id="name"><h2>${my_hash.querySelector("#hashtagname").innerText}</h2></div>
        <div class="col-6 mt-3 show-card-left text-center">
          <div class="p-0" id="date">On ${my_hash.querySelector("#hashtagdate").innerText} the score was</div>
          <div class="p-0" id="score">${my_hash.querySelector("#hashtagscore").innerText}</div>
          <a class="button-secondary link-dashboard-secondary" href="/pdf.pdf?id=${id.innerText}">Download PDF</a>
        </div>
        <div class="col-6 mt-3">
          <h4 class="search-hashtag-list-header">Happiest words &#128515</h4>
            <div class="search-hashtag-list green-shadow">
              <div class="p-0" id="hashtaghappywords">
              <p class="search-hashtag-happysad">
              ${JSON.parse(my_hash.querySelector("#hashtaghappywords").innerText).map(item => {
                return `<p class="search-hashtag-happysad">${item}</p>`;
              }).join('')}
              </div>
            </div>

            <h4 class="search-hashtag-list-header mt-3">Saddest words &#128148</h4>
            <div class="search-hashtag-list green-shadow">
              <div class="p-0" id="hashtaghappywords">
              <p class="search-hashtag-happysad">
              ${JSON.parse(my_hash.querySelector("#hashtagsadwords").innerText).map(item => {
                return `<p class="search-hashtag-happysad">${item}</p>`;
              }).join('')}
              </div>
            </div>
      </div>
      `
    })
  })

  hashtags.forEach((hash) => {
    hash.addEventListener('click', () => {
      // container.innerText = hash.hashtag
      // initHashtagIndex()
      var sad_arr = []
      var happy_arr = []
      if (hash.querySelector("#hashtagsadwords").innerText) {
        sad_arr = JSON.parse(hash.querySelector("#hashtagsadwords").innerText)
      }

      if (hash.querySelector("#hashtaghappywords").innerText) {
        happy_arr = JSON.parse(hash.querySelector("#hashtaghappywords").innerText)
      }

      console.log(sad_arr)
      container.innerHTML = `
      <div class="row show-hashtag-row">
        <div class="show-hashtag-name mt-3" id="name"><h2>${hash.querySelector("#hashtagname").innerText}</h2></div>
        <div class="col-6 mt-3 show-card-left text-center">
          <div class="p-0" id="date">On ${hash.querySelector("#hashtagdate").innerText} the score was</div>
          <div class="p-0" id="score">${hash.querySelector("#hashtagscore").innerText}</div>
          <a class="button-secondary link-dashboard-secondary" href="/printshow.pdf?id=${id.innerText}">Download PDF</a>
        </div>
        <div class="col-6 mt-3">
          <h4 class="search-hashtag-list-header">Happiest words &#128515</h4>
          <div class="search-hashtag-list green-shadow">
            <div class="p-0" id="hashtaghappywords">
            <p class="search-hashtag-happysad">
            ${happy_arr.map(item => {
              return `<p class="search-hashtag-happysad">${item}</p>`;
            }).join('')}

            </div>
          </div>

          <h4 class="search-hashtag-list-header mt-3">Saddest words &#128148</h4>
          <div class="search-hashtag-list green-shadow">
            <div class="p-0" id="hashtaghappywords">
            <p class="search-hashtag-happysad">
            ${sad_arr.map(item => {
              return `<p class="search-hashtag-happysad">${item}</p>`;
            }).join('')}
            </div>
          </div>
      </div>
      `
    })
  })
}

export default grabHashtag;
