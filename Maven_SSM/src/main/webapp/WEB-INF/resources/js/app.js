
// 用于在Input 失去焦点时隐藏键盘

function fixedInputBlur(parentId) {
    var beforeIpt=null;
    $("input").on("click", function (e) {
        beforeIpt=this;
        e.stopPropagation();
    });
    $(parentId).on("click", function (e) {
        if(e.target.nodeName.toLowerCase()!="input") {
            if(beforeIpt) {
                beforeIpt.blur();
                beforeIpt=null;
            }
        }
    });
}

(function(a) {
	a.fn.vTicker = function(b) {
		var c = {
			speed: 700,
			pause: 4000,
			showItems: 3,
			animation: "",
			mousePause: true,
			isPaused: false,
			direction: "up",
			height: 0
		};
		var b = a.extend(c, b);
		moveUp = function(g, d, e) {
			if (e.isPaused) {
				return
			}
			var f = g.children("ul");
			var h = f.children("li:first").clone(true);
			if (e.height > 0) {
				d = f.children("li:first").height()
			}
			f.animate({
				top: "-=" + d + "px"
			}, e.speed, function() {
				a(this).children("li:first").remove();
				a(this).css("top", "0px")
			});
			if (e.animation == "fade") {
				f.children("li:first").fadeOut(e.speed);
				if (e.height == 0) {
					f.children("li:eq(" + e.showItems + ")").hide().fadeIn(e.speed)
				}
			}
			h.appendTo(f)
		};
		moveDown = function(g, d, e) {
			if (e.isPaused) {
				return
			}
			var f = g.children("ul");
			var h = f.children("li:last").clone(true);
			if (e.height > 0) {
				d = f.children("li:first").height()
			}
			f.css("top", "-" + d + "px").prepend(h);
			f.animate({
				top: 0
			}, e.speed, function() {
				a(this).children("li:last").remove()
			});
			if (e.animation == "fade") {
				if (e.height == 0) {
					f.children("li:eq(" + e.showItems + ")").fadeOut(e.speed)
				}
				f.children("li:first").hide().fadeIn(e.speed)
			}
		};
		return this.each(function() {
			var f = a(this);
			var e = 0;
			f.css({
				overflow: "hidden",
				position: "relative"
			}).children("ul").css({
				position: "absolute",
				left:'50%',
				transform:' translateX(-50%)',
				padding: 0
			}).children("li").css({
				margin: 0,
				padding: 0
			});
			if (b.height == 0) {
				f.children("ul").children("li").each(function() {
					if (a(this).height() > e) {
						e = a(this).height()
					}
				});
				f.children("ul").children("li").each(function() {
					a(this).height(e)
				});
				f.height(e * b.showItems)
			} else {
				f.height(b.height)
			}
			var d = setInterval(function() {
				if (b.direction == "up") {
					moveUp(f, e, b)
				} else {
					moveDown(f, e, b)
				}
			}, b.pause);
			if (b.mousePause) {
				f.bind("mouseenter", function() {
					b.isPaused = true
				}).bind("mouseleave", function() {
					b.isPaused = false
				})
			}
		})
	}
})(jQuery);

function rem(){
	   !function (e) { function t(a) { if (i[a]) return i[a].exports; var n = i[a] = { exports: {}, id: a, loaded: !1 }; return e[a].call(n.exports, n, n.exports, t), n.loaded = !0, n.exports } var i = {}; return t.m = e, t.c = i, t.p = "", t(0) }([function (e, t) { "use strict"; Object.defineProperty(t, "__esModule", { value: !0 }); var i = window; t["default"] = i.flex = function (e, t) { var a = e || 100, n = t || 1, r = i.document, o = navigator.userAgent, d = o.match(/Android[\S\s]+AppleWebkit\/(\d{3})/i), l = o.match(/U3\/((\d+|\.){5,})/i), c = l && parseInt(l[1].split(".").join(""), 10) >= 80, p = navigator.appVersion.match(/(iphone|ipad|ipod)/gi), s = i.devicePixelRatio || 1; p || d && d[1] > 534 || c || (s = 1); var u = 1 / s, m = r.querySelector('meta[name="viewport"]'); m || (m = r.createElement("meta"), m.setAttribute("name", "viewport"), r.head.appendChild(m)), m.setAttribute("content", "width=device-width,user-scalable=no,initial-scale=" + u + ",maximum-scale=" + u + ",minimum-scale=" + u), r.documentElement.style.fontSize = a / 2 * s * n + "px" }, e.exports = t["default"] }]);
       flex(100, 1);
}
