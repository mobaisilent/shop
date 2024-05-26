window.onload = function () {
  window.onscroll = function () {
    var toup = document.getElementById("toup");
    if (window.scrollY > 230) {
      toup.style.display = "block";
    } else {
      toup.style.display = "none";
    }
  };

  var isClicked = false;
  document.getElementById("changecolor").onclick = function () {
    var boddy = document.getElementById("boddy");
    if (!isClicked) {
      boddy.style.backgroundImage = "none";
      boddy.style.backgroundColor = "black";
      isClicked = true;
    } else {
      boddy.style.backgroundImage = "";
      boddy.style.backgroundColor = "";
      isClicked = false;
    }
  };

  document.getElementById("totop").onclick = function () {
    window.scrollTo(0, 0);
  };
};
