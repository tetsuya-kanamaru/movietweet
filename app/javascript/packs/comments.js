function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", " /tweets/:tweet_id/comments", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const item = XHR.response.comment;
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const HTML = `
      <div class="comment-content">
        <p>
          ${item.comment}
        </p>
      </div>`;
      list.insertAdjacentHTML("afterend", HTML);

      formText.value = "";

      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
      } else {
        return null;
      }
    };

    e.preventDefault();
  });
}

window.addEventListener("load", comment);
