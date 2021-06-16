function comment() {
  const submit = document.getElementById("submit");

  submit.addEventListener("click", (e) => {
    const form = document.getElementById("form")
    const formData = new FormData(form);
    const tweetCommentsPath = form.getAttribute("action")

    const XHR = new XMLHttpRequest();
    XHR.open("POST", tweetCommentsPath, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = (e) => {
      const item = XHR.response.comment;
      const user_name = XHR.response.user_name;
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const HTML = `
      <div class="comment-content">
        <p><strong><a href="/users/${item.user_id}">${user_name}</a></strong>
        ${ item.comment }</p>
      </div>`;
      list.insertAdjacentHTML("afterend", HTML);

      formText.value = "";

      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
      } else {
        return null;
      }
    };

    XHR.onerror = function() {
      alert("Request Failed");
    };

    e.preventDefault();
  });
}

window.addEventListener("load", comment);
