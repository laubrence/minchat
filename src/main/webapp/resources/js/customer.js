var Chat = {};

Chat.socket = null;


$(document).ready(function () {
    //定时任务断去请求服务器
    setInterval("heart_connect()", 10000);

    Chat.connect = (function (host) {
        if ('WebSocket' in window) {
            Chat.socket = new WebSocket(host);
        } else if ('MozWebSocket' in window) {
            Chat.socket = new MozWebSocket(host);
        } else {
            alert('Error: WebSocket is not supported by this browser.');
            return;
        }

        Chat.socket.onopen = function () {

        };

        Chat.socket.onclose = function (message) {
            receive(message);
        };

        Chat.socket.onmessage = function (message) {
            var message = JSON.parse(message.data);
            receive(message);
        };
    });

    Chat.initialize = function () {
        if (window.location.protocol == 'http:') {
            Chat.connect('ws://' + window.location.host + '/message?usertype=customer');
        } else {
            Chat.connect('wss://' + window.location.host + '/message?usertype=customer');
        }
    };

    Chat.initialize();

    //使用message对象封装消息  
    var shake_status = 0;
    var shakeTitle = {
        time: 0,
        title: document.title,
        timer: null,
        // 显示新消息提示
        show: function () {
            var title = shakeTitle.title.replace("【　　　】", "").replace("【新消息】", "");
            // 定时器，设置消息切换频率闪烁效果就此产生
            shakeTitle.timer = setTimeout(function () {
                shakeTitle.time++;
                shakeTitle.show();
                if (shake_status == 1) {
                    if (shakeTitle.time % 2 == 0) {
                        document.title = "【新消息】" + title;
                    } else {
                        document.title = "【　　　】" + title;
                    }
                    ;
                }
            }, 600);
            return [shakeTitle.timer, shakeTitle.title];
        },
        // 取消新消息提示
        clear: function () {
            //clearTimeout(shakeTitle.timer);
            shake_status = 0;
            document.title = shakeTitle.title;
        },
        // 新消息提示
        start: function () {
            shake_status = 1;
        }
    };
    shakeTitle.show();

//	var titleTimer = setTimeout(function(){
//		if(titleStatus==1){
//			shakeTitle.show();
//		}else{
//			shakeTitle.clear();
//		}}, 1000);


    //抖动效果
    function shake(obj) {
        obj.style.left = obj.offsetLeft + 'px';
        obj.style.top = obj.offsetTop + 'px';
        obj.style.position = 'absolute';
        obj.style.margin = 0;

        var posData = [obj.offsetLeft, obj.offsetTop];
        var i = 0;
        clearInterval(timer);
        var timer = setInterval(function () {
            i++;
            obj.style.left = posData[0] + ((i % 2) > 0 ? -1 : 1) + 'px';
            obj.style.top = posData[1] + ((i % 2) > 0 ? -0.5 : 0.5) + 'px';
            if (i > 30) {
                clearInterval(timer);
                obj.style.left = obj.offsetLeft + 'px';
                obj.style.top = obj.offsetTop + 'px';
                obj.style.position = '';
                obj.style.margin = 0;
            }
        }, 80);
    }

    function cancelShake(obj, timer) {
        var posData = [obj.offsetLeft, obj.offsetTop];
        clearInterval(timer);
        obj.style.left = posData[0] + 'px';
        obj.style.top = posData[1] + 'px';
    }

    function clearNotice(a) {
        var $li = $(".chat03_content input[class='chat_inboundId'][value='" + a + "']").parent();
        if ($li.find("label").attr("class") != "offline") {
            $li.find("label").attr("class", "online");
        }
        ;
    }

    function send() {
        function h() {
            -1 != g.indexOf("*#emo_") && (g = g.replace("*#", "<img src='http://" + window.location.host + "/images/chat/img/").replace("#*", ".gif'/>"), h());
        }

        var e = new Date,
            f = "";
        f += e.getFullYear() + "-", f += e.getMonth() + 1 + "-", f += e.getDate() + "  ", f += e.getHours() + ":", f += e.getMinutes() + ":", f += e.getSeconds();
        var g = $("#textarea").val();
        h();
        b = $("#mypicture").val();
        c = $("#mynickname").val();
        var i = "<div class='message clearfix'><div class='user-logo'><img src='" + b + "'/>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix'>" + c + "</h5>" + "<div>" + g + "</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>" + "</div>";

        if (null != g && "" != g && " " != g) {
            $(".mes" + a).append(i);
            //alert($(".mes" + a).height());
            $(".chat01_content").scrollTop($(".mes" + a).height());
            var message = {};
            message.type = "user_send";
            message.ginboundId = a;
            message.msg = g;
            Chat.socket.send(JSON.stringify(message));
        } else {
            alert("请输入聊天内容!");
        }
        $("#textarea").val("");
        //移除消息通知
        clearNotice(a);
        shakeTitle.clear();
    }

    function showMsg(message) {
        function h() {
            -1 != g.indexOf("*#emo_") && (g = g.replace("*#", "<img src='img/").replace("#*", ".gif'/>"), h());
        }

        var e = new Date,
            f = "";
        f += e.getFullYear() + "-", f += e.getMonth() + 1 + "-", f += e.getDate() + "  ", f += e.getHours() + ":", f += e.getMinutes() + ":", f += e.getSeconds();
        var g = message.msg;
        var a = message.ginboundId;
        h();
        var $message_box = $(".chat01_content div[class='message_box mes" + a + "']");
        b = $message_box.attr("picture");
        c = $message_box.attr("nickname");

        var i = "<div class='message clearfix'><div class='user-logo'><img src='" + b + "'/>" + "</div>" + "<div class='wrap-text'>" + "<h5 class='clearfix'>" + c + "</h5>" + "<div>" + g + "</div>" + "</div>" + "<div class='wrap-ri'>" + "<div clsss='clearfix'><span>" + f + "</span></div>" + "</div>" + "<div style='clear:both;'></div>" + "</div>";
        null != g && "" != g ? ($(".mes" + a).append(i), $(".chat01_content").scrollTop($(".mes" + a).height())) : alert("请输入聊天内容!");

        $(".chat01_content").scrollTop($(".mes" + a).height());

        var $picture = $("img[id='img" + a + "']");
        shake($picture[0]);
        shakeTitle.start();
        titleStatus = 1;
        var $li = $(".chat03_content input[class='chat_inboundId'][value='" + a + "']").parent();
        $li.find("label").attr("class", "notice");
    }

    function receive(message) {
        if (message.type == "customer_join") {
            $("#myinboundId").val(message.myinboundId);
            $("#mynickname").val(message.sysUser.nickname);
            $("#mypicture").val(message.sysUser.picture);
        } else if (message.type == "guest_join") {
            var guestList = '<li class=""><label class="online"></label><a href="javascript:;"><img src="' + message.picture + '" id="img' + message.inboundId + '"  height="30" width="30"></a><a href="javascript:;" class="chat03_name">' + message.nickname + '</a><input type="hidden" class="chat_inboundId" value=' + message.inboundId + '></li>';
            $(".chat03_content ul").prepend(guestList);
            var chat_div = '<div class="message_box mes' + message.inboundId + '" inboundId="' + message.inboundId + '" picture="' + message.picture + '" nickname="' + message.nickname + '"></div>';
            $(".chat01_content").append(chat_div);
            $(".chat03_content").scrollTop(0);
        } else if (message.type == "guest_send") {
            showMsg(message);
        } else if (message.type == "guest_leave") {//离线状态
            var $li = $(".chat03_content input[class='chat_inboundId'][value='" + message.ginboundId + "']").parent();
            var $lastli = $(".chat03_content ul").children().last();
            if ($li.find(".chat_inboundId").val() != $lastli.find(".chat_inboundId").val()) {
                $li.insertAfter($lastli);
            }
            $li.find("label").attr("class", "offline");
        }
    }

    var a = "",
        b = "",
        c = "",
        d = "";
    $(".chatLeft").hide();
    $(".close_btn").click(function () {
        $(".chatLeft").hide();
    }),
        $(".chat03_content li").mouseover(function () {
            $(this).addClass("hover").siblings().removeClass("hover");
        }).mouseout(function () {
            $(this).removeClass("hover").siblings().removeClass("hover");
        }),
        $(".chat03_content li").live("dblclick", function () {
            $(".chatLeft").show();
            a = $(this).find(".chat_inboundId").val();
            d = $(this).find(".chat03_name").text();
            $(".chat01_content").scrollTop(0);
            $(this).addClass("choosed").siblings().removeClass("choosed");
            $(".talkTo a").text($(this).children(".chat03_name").text());
            var $inbound_div = $(".mes" + a);
            if (!$inbound_div.length) {
                var chat_div = '<div class="message_box mes' + a + ' inboundId="' + a + '"></div>';
                $(".chat01_content").append(chat_div);
            }
            $(".mes" + a).show().siblings().hide();
            $(".chat01_content").scrollTop($(".mes" + a).height());
            clearNotice(a);
            shakeTitle.clear();
            titleStatus = 0;
        });

    $(".ctb01").mouseover(function () {
        $(".wl_faces_box").show();
    }).mouseout(function () {
        $(".wl_faces_box").hide();
    });
    $(".wl_faces_box").mouseover(function () {
        $(".wl_faces_box").show();
    }).mouseout(function () {
        $(".wl_faces_box").hide();
    });
    $(".wl_faces_close").click(function () {
        $(".wl_faces_box").hide();
    });
    $(".wl_faces_main img").click(function () {
        var a = $(this).attr("src");
        $("#textarea").val($("#textarea").val() + "*#" + a.substr(a.indexOf("img/") + 4, 6) + "#*");
        $("#textarea").focusEnd();
        $(".wl_faces_box").hide();
    });
    $(".chat02_bar img").click(function () {
        send();
    }),
        document.onkeydown = function (a) {
            var b = document.all ? window.event : a;
            return 13 == b.keyCode ? (send(), !1) : void 0;
        };
    $.fn.setCursorPosition = function (a) {
        return 0 == this.lengh ? this : $(this).setSelection(a, a);
    };
    $.fn.setSelection = function (a, b) {
        if (0 == this.lengh) return this;
        if (input = this[0], input.createTextRange) {
            var c = input.createTextRange();
            c.collapse(!0), c.moveEnd("character", b), c.moveStart("character", a), c.select();
        } else input.setSelectionRange && (input.focus(), input.setSelectionRange(a, b));
        return this;
    };
    $.fn.focusEnd = function () {
        this.setCursorPosition(this.val().length);
    };

//	// 页面加载时绑定点击事件，单击取消闪烁提示  
//	function bind() {  
//	    document.onclick = function () {  
//	        message.clear();  
//	    };  
//	}  

});

function heart_connect() {
    var message = {};
    message.type = "heart_connect";
    console.log(message);
    Chat.socket.send(JSON.stringify(message));
}






