<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>在线客服系统</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/customer.css?v=0.1" />
<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx}/js/customer.js?v=0.1"></script>
<!--[if lt IE 7]>
<script src="js/IE7.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
<script src="js/iepng.js" type="text/javascript"></script>
<script type="text/javascript">
EvPNG.fix('body, div, ul, img, li, input, a, span ,label'); 
</script>
<![endif]-->
</head>
<body class="keBody">
<h1 class="keTitle">在线客服系统</h1>
<div class="kePublic">
<!--效果html开始-->
    <div class="content">
        <div class="chatBox">
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">
                        <ul class="talkTo">
                            <li><a href="javascript:;"></a></li></ul>
                        <a class="close_btn" href="javascript:;"></a>
                    </div>
                    <div class="chat01_content">
                        
                    </div>
                </div>
                <div class="chat02">
                    <div class="chat02_title">
                        <a class="chat02_title_btn ctb01" href="javascript:;"></a>
                        <%-- 
                        <a class="chat02_title_btn ctb02"
                            href="javascript:;" title="选择文件">
                         <embed width="15" height="16" flashvars="swfid=2556975203&amp;maxSumSize=50&amp;maxFileSize=50&amp;maxFileNum=1&amp;multiSelect=0&amp;uploadAPI=http%3A%2F%2Fupload.api.weibo.com%2F2%2Fmss%2Fupload.json%3Fsource%3D209678993%26tuid%3D1887188824&amp;initFun=STK.webim.ui.chatWindow.msgToolBar.upload.initFun&amp;sucFun=STK.webim.ui.chatWindow.msgToolBar.upload.sucFun&amp;errFun=STK.webim.ui.chatWindow.msgToolBar.upload.errFun&amp;beginFun=STK.webim.ui.chatWindow.msgToolBar.upload.beginFun&amp;showTipFun=STK.webim.ui.chatWindow.msgToolBar.upload.showTipFun&amp;hiddenTipFun=STK.webim.ui.chatWindow.msgToolBar.upload.hiddenTipFun&amp;areaInfo=0-16|12-16&amp;fExt=*.jpg;*.gif;*.jpeg;*.png|*&amp;fExtDec=选择图片|选择文件"
                                data="upload.swf" wmode="transparent" bgcolor="" allowscriptaccess="always" allowfullscreen="true"
                                scale="noScale" menu="false" type="application/x-shockwave-flash" src="http://service.weibo.com/staticjs/tools/upload.swf?v=36c9997f1313d1c4"
                                id="swf_3140">
                        </a><a class="chat02_title_btn ctb03" href="javascript:;" title="选择附件">
                            <embed width="15" height="16" flashvars="swfid=2556975203&amp;maxSumSize=50&amp;maxFileSize=50&amp;maxFileNum=1&amp;multiSelect=0&amp;uploadAPI=http%3A%2F%2Fupload.api.weibo.com%2F2%2Fmss%2Fupload.json%3Fsource%3D209678993%26tuid%3D1887188824&amp;initFun=STK.webim.ui.chatWindow.msgToolBar.upload.initFun&amp;sucFun=STK.webim.ui.chatWindow.msgToolBar.upload.sucFun&amp;errFun=STK.webim.ui.chatWindow.msgToolBar.upload.errFun&amp;beginFun=STK.webim.ui.chatWindow.msgToolBar.upload.beginFun&amp;showTipFun=STK.webim.ui.chatWindow.msgToolBar.upload.showTipFun&amp;hiddenTipFun=STK.webim.ui.chatWindow.msgToolBar.upload.hiddenTipFun&amp;areaInfo=0-16|12-16&amp;fExt=*.jpg;*.gif;*.jpeg;*.png|*&amp;fExtDec=选择图片|选择文件"
                                data="upload.swf" wmode="transparent" bgcolor="" allowscriptaccess="always" allowfullscreen="true"
                                scale="noScale" menu="false" type="application/x-shockwave-flash" src="http://service.weibo.com/staticjs/tools/upload.swf?v=36c9997f1313d1c4"
                                id="swf_3140">
                        </a>
                        <label class="chat02_title_t">
                            <a href="chat.htm" target="_blank">聊天记录</a>
                        </label>
                       --%>
                        <div class="wl_faces_box">
                            <div class="wl_faces_content">
                                <div class="title">
                                    <ul>
                                        <li class="title_name">常用表情</li><li class="wl_faces_close"><span>&nbsp;</span></li></ul>
                                </div>
                                <div class="wl_faces_main">
                                    <ul>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_01.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_02.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_03.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_04.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_05.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_06.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_07.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_08.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_09.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_10.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_11.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_12.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_13.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_14.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_15.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_16.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_17.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_18.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_19.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_20.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_21.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_22.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_23.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_24.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_25.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_26.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_27.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_28.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_29.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_30.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_31.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_32.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_33.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_34.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_35.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_36.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_37.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_38.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_39.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_40.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_41.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_42.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_43.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_44.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_45.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_46.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_47.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_48.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_49.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_50.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_51.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_52.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_53.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_54.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_55.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_56.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_57.gif" /></a></li>
                                        <li><a href="javascript:;">
                                            <img src="${ctx}/images/chat/img/emo_58.gif" /></a></li><li><a href="javascript:;">
                                                <img src="${ctx}/images/chat/img/emo_59.gif" /></a></li><li><a href="javascript:;">
                                                    <img src="${ctx}/images/chat/img/emo_60.gif" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="wlf_icon">
                            </div>
                        </div>
                    </div>
                    <div class="chat02_content">
                        <textarea id="textarea"></textarea>
                    </div>
                    <div class="chat02_bar">
                        <ul>
                            <li style="left: 20px; top: 10px; padding-left: 30px;"></li>
                            <li style="right: 5px; top: 5px;"><a href="javascript:;">
                                <img src="${ctx}/images/chat/img/send_btn.jpg" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="chatRight" >
                <div class="chat03">
                    <div class="chat03_title">
                        <label class="chat03_title_t">在线访客列表</label>
                    </div>
                    <input type="hidden" id="myinboundId" value=""/>
                    <input type="hidden" id="mynickname" value=""/>
                    <input type="hidden" id="mypicture" value=""/>
                    <div class="chat03_content">
                        <ul>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
<!--效果html结束-->
</div>

</body>
</html>