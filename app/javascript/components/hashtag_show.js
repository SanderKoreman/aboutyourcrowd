var grabHashtag = () => {
  var hashtags = document.querySelectorAll(".saved-hashtags")
  var container = document.querySelector(".output-info")

  hashtags.forEach((hash) => {
    hash.addEventListener('click', () => {
      // container.innerText = hash.hashtag
      container.innerHTML = `<div class="bg bg-dark">${hash.innerHTML}</div>`
    })
    console.log(hash.innerHTML)
  })

}

export default grabHashtag;
