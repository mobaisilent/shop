$(document).ready(function () {
  var imgObj = $(".floor-item img"); //点击的图片

  $.each(imgObj, function () {
    $(this).click(function () {
      var container = $("<div class=container></div>");
      var myImg = $(this);
      coverLayer(1);
      with (container) {
        appendTo("body");
        var windowWidth = $(window).width();
        var windowHeight = $(window).height();
        //获取原图宽度、高度
        var originalImg = new Image();
        originalImg.src = myImg.attr("src");
        var myImgWidth = originalImg.width;
        var myImgHeight = originalImg.height;

        if (myImgWidth < windowWidth) {
          if (myImgHeight < windowHeight) {
            var topHeight = (windowHeight - myImgHeight) / 2;
            if (topHeight > 35) {
              topHeight = topHeight - 35;
              css("top", topHeight);
            } else {
              css("top", 0);
            }
            html("<img src=" + myImg.attr("src") + " border=0 />");
          } else {
            css("top", 0);
            html(
              "<img src=" +
                myImg.attr("src") +
                " height=" +
                windowHeight +
                " border=0 />"
            );
          }
        } else {
          var myImgChangeHeight = (myImgHeight * windowWidth) / myImgWidth;
          if (myImgChangeHeight < windowHeight) {
            var topHeight = (windowHeight - myImgChangeHeight) / 2;
            if (topHeight > 35) {
              topHeight = topHeight - 35;
              css("top", topHeight);
            } else {
              css("top", 0);
            }
            html(
              "<img src=" +
                myImg.attr("src") +
                " width=" +
                windowWidth +
                " border=0 />"
            );
          } else {
            css("top", 0);
            html(
              "<img src=" +
                myImg.attr("src") +
                " width=" +
                windowWidth +
                "; height=" +
                windowHeight +
                " border=0 />"
            );
          }
        }
      }
      container.click(function () {
        $(this).remove();
        coverLayer(0);
      });
    });
  });

  //使用禁用蒙层效果
  function coverLayer(tag) {
    with ($(".bigimg")) {
      if (tag) {
        css("height", $(document).height());
        css("display", "block");
        css("opacity", 1);
        css("background-color", "#fff");
        css("background-color", "rgba(0,0,0,0.6)"); //蒙层透明度
      } else {
        css("display", "none");
      }
    }
  }
});
