<!DOCTYPE html>
<!--[if lt IE 7]><html class="ie6 oldie" lang="en"><![endif]-->
<!--[if IE 7]><html class="ie7 oldie" lang="en"><![endif]-->
<!--[if IE 8]><html class="ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en"><!--<![endif]-->
    <head id="ctl00_ctl00_Head1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=7, IE=8, IE=9, chrome=1"><title>
            Kendo UI - jQuery HTML5 framework for desktop, mobile app development, HTML5 data visualization
        </title><link rel="shortcut icon" href="http://www.kendoui.com/Image/favicon.ico">    
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">  



        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
            $(function() {
                state = false;

                var naviButton = $('#toggle-link'),
                        sitenavMain = $('#sitenav-main'),
                        slogan = $('#telerik-slogan'),
                        sitenav = $('#sitenav'),
                        sitenaviPanel = $(".sitenavi-panel"),
                        buttons = $('#sitenav-personal-info-menu li'),
                        personalInfoPanel = $('#sitenav-personal-info-panel'),
                        aboutUsPanel = $('#sitenav-about-us-panel'),
                        speedIn = 800,
                        speedOut = 600,
                        doc = $.browser.msie || $.browser.mozilla ? $('html') : $('body');

                naviButton.click(function(e) {
                    var $this = $(this);

                    (!state) ? showSitenavMain() : hideSitenavMain();

                    e.stopPropagation();
                });

                sitenav.add(sitenaviPanel).click(function(e) {
                    e.stopPropagation();
                });

                doc.click(function(event) {
                    if (state && sitenavMain.not(':animated')) {
                        hideSitenavMain();
                    }

                    if (buttons.hasClass('active')) {
                        buttons.removeClass('active');
                        sitenaviPanel.fadeOut();
                    }
                });

                function showSitenavMain() {
                    if (!sitenavMain.is(':animated')) {
                        buttons.removeClass('active').find('.sitenavi-panel').fadeOut();

                        sitenavMain.animate({
                            top: "-40"
                        }, speedIn, 'easeOutBack', function() {
                            state = true;
                            //animate slogan
                            slogan.css({display: 'block'}).delay(100).animate({bottom: -12, opacity: 1});
                        });

                        naviButton.toggleClass('active');

                        if (typeof homepage != 'undefined' && homepage == true) {
                            sitenav.css({position: 'fixed'});
                            doc.animate({scrollTop: 426});
                        }
                    }
                    else {
                        return false;
                    }
                }


                function hideSitenavMain() {
                    if (!sitenavMain.is(':animated')) {
                        //animate slogan
                        slogan.animate({opacity: 0}, function() {
                            $(this).css({bottom: -22, display: 'none'})
                        });

                        sitenavMain.animate({
                            top: "-=490"
                        }, speedOut, 'easeInBack', function() {
                            state = false;
                            naviButton.toggleClass('active');
                        });

                        if (typeof homepage != 'undefined' && homepage == true) {
                            doc.delay(400).animate({scrollTop: 0}, function() {
                                sitenav.css({position: 'absolute'});
                            });
                        }
                    }
                    else {
                        return false;
                    }
                }



            });


            //Jquery Easings
            eval(function(p, a, c, k, e, r) {
                e = function(c) {
                    return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
                };
                if (!''.replace(/^/, String)) {
                    while (c--)
                        r[e(c)] = k[c] || e(c);
                    k = [function(e) {
                            return r[e]
                        }];
                    e = function() {
                        return '\\w+'
                    };
                    c = 1
                }
                ;
                while (c--)
                    if (k[c])
                        p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
                return p
            }('h.i[\'1a\']=h.i[\'z\'];h.O(h.i,{y:\'D\',z:9(x,t,b,c,d){6 h.i[h.i.y](x,t,b,c,d)},17:9(x,t,b,c,d){6 c*(t/=d)*t+b},D:9(x,t,b,c,d){6-c*(t/=d)*(t-2)+b},13:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t+b;6-c/2*((--t)*(t-2)-1)+b},X:9(x,t,b,c,d){6 c*(t/=d)*t*t+b},U:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t+1)+b},R:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t+b;6 c/2*((t-=2)*t*t+2)+b},N:9(x,t,b,c,d){6 c*(t/=d)*t*t*t+b},M:9(x,t,b,c,d){6-c*((t=t/d-1)*t*t*t-1)+b},L:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t+b;6-c/2*((t-=2)*t*t*t-2)+b},K:9(x,t,b,c,d){6 c*(t/=d)*t*t*t*t+b},J:9(x,t,b,c,d){6 c*((t=t/d-1)*t*t*t*t+1)+b},I:9(x,t,b,c,d){e((t/=d/2)<1)6 c/2*t*t*t*t*t+b;6 c/2*((t-=2)*t*t*t*t+2)+b},G:9(x,t,b,c,d){6-c*8.C(t/d*(8.g/2))+c+b},15:9(x,t,b,c,d){6 c*8.n(t/d*(8.g/2))+b},12:9(x,t,b,c,d){6-c/2*(8.C(8.g*t/d)-1)+b},Z:9(x,t,b,c,d){6(t==0)?b:c*8.j(2,10*(t/d-1))+b},Y:9(x,t,b,c,d){6(t==d)?b+c:c*(-8.j(2,-10*t/d)+1)+b},W:9(x,t,b,c,d){e(t==0)6 b;e(t==d)6 b+c;e((t/=d/2)<1)6 c/2*8.j(2,10*(t-1))+b;6 c/2*(-8.j(2,-10*--t)+2)+b},V:9(x,t,b,c,d){6-c*(8.o(1-(t/=d)*t)-1)+b},S:9(x,t,b,c,d){6 c*8.o(1-(t=t/d-1)*t)+b},Q:9(x,t,b,c,d){e((t/=d/2)<1)6-c/2*(8.o(1-t*t)-1)+b;6 c/2*(8.o(1-(t-=2)*t)+1)+b},P:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6-(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b},H:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d)==1)6 b+c;e(!p)p=d*.3;e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);6 a*8.j(2,-10*t)*8.n((t*d-s)*(2*8.g)/p)+c+b},T:9(x,t,b,c,d){f s=1.l;f p=0;f a=c;e(t==0)6 b;e((t/=d/2)==2)6 b+c;e(!p)p=d*(.3*1.5);e(a<8.w(c)){a=c;f s=p/4}m f s=p/(2*8.g)*8.r(c/a);e(t<1)6-.5*(a*8.j(2,10*(t-=1))*8.n((t*d-s)*(2*8.g)/p))+b;6 a*8.j(2,-10*(t-=1))*8.n((t*d-s)*(2*8.g)/p)*.5+c+b},F:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*(t/=d)*t*((s+1)*t-s)+b},E:9(x,t,b,c,d,s){e(s==u)s=1.l;6 c*((t=t/d-1)*t*((s+1)*t+s)+1)+b},16:9(x,t,b,c,d,s){e(s==u)s=1.l;e((t/=d/2)<1)6 c/2*(t*t*(((s*=(1.B))+1)*t-s))+b;6 c/2*((t-=2)*t*(((s*=(1.B))+1)*t+s)+2)+b},A:9(x,t,b,c,d){6 c-h.i.v(x,d-t,0,c,d)+b},v:9(x,t,b,c,d){e((t/=d)<(1/2.k)){6 c*(7.q*t*t)+b}m e(t<(2/2.k)){6 c*(7.q*(t-=(1.5/2.k))*t+.k)+b}m e(t<(2.5/2.k)){6 c*(7.q*(t-=(2.14/2.k))*t+.11)+b}m{6 c*(7.q*(t-=(2.18/2.k))*t+.19)+b}},1b:9(x,t,b,c,d){e(t<d/2)6 h.i.A(x,t*2,0,c,d)*.5+b;6 h.i.v(x,t*2-d,0,c,d)*.5+c*.5+b}});', 62, 74, '||||||return||Math|function|||||if|var|PI|jQuery|easing|pow|75|70158|else|sin|sqrt||5625|asin|||undefined|easeOutBounce|abs||def|swing|easeInBounce|525|cos|easeOutQuad|easeOutBack|easeInBack|easeInSine|easeOutElastic|easeInOutQuint|easeOutQuint|easeInQuint|easeInOutQuart|easeOutQuart|easeInQuart|extend|easeInElastic|easeInOutCirc|easeInOutCubic|easeOutCirc|easeInOutElastic|easeOutCubic|easeInCirc|easeInOutExpo|easeInCubic|easeOutExpo|easeInExpo||9375|easeInOutSine|easeInOutQuad|25|easeOutSine|easeInOutBack|easeInQuad|625|984375|jswing|easeInOutBounce'.split('|'), 0, {}))

        </script>
        <meta name="Description" content="Kendo UI is JQuery-based framework for rich UI, build HTML5 apps that look native on any device, build desktop and mobile applications for any browser."><link href="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/Global.css" type="text/css" rel="stylesheet" media="all"><link href="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/layout-sitenav.css" type="text/css" rel="stylesheet" media="screen"><link href="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/Telerik.css" type="text/css" rel="stylesheet"><meta name="Generator" content="Sitefinity 3.7.2152.140:0"><meta name="Generator" content="Sitefinity 3.7.2152.140:0">
    </head>
    <body id="grid">
        <div id="ctl00_ctl00_pnlClicktaleTop">


        </div>

        <form name="aspnetForm" method="post" action="/" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
            <div>
                <input name="ctl00_ctl00_RadStyleSheetManager1_TSSM" id="ctl00_ctl00_RadStyleSheetManager1_TSSM" value="" type="hidden">
                <input name="ctl00_ctl00_RadScriptManager1_TSM" id="ctl00_ctl00_RadScriptManager1_TSM" value="" type="hidden">
                <input name="__EVENTTARGET" id="__EVENTTARGET" value="" type="hidden">
                <input name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" type="hidden">
                <input name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUENTM4MQ9kFgJmD2QWAmYPZBYCAgUQFgIeCG9uc3VibWl0BY4CaWYodHlwZW9mKHN1Ym1pdEhhbmRsZXJfY3RsMDAkY3RsMDAkR2VuZXJhbEJveCRTZWFyY2gkdG1fdXNlcmNvbnRyb2xzX3B1YmxpY19nb29nbGVtaW5pc2VhcmNoX21haW5zZWFyY2hfYXNjeDEkdHh0U2VhcmNoVGV4dCk9PT0nZnVuY3Rpb24nKXN1Ym1pdEhhbmRsZXJfY3RsMDAkY3RsMDAkR2VuZXJhbEJveCRTZWFyY2gkdG1fdXNlcmNvbnRyb2xzX3B1YmxpY19nb29nbGVtaW5pc2VhcmNoX21haW5zZWFyY2hfYXNjeDEkdHh0U2VhcmNoVGV4dCgpOzsgcmV0dXJuIHRydWU7ZBYEAg0PZBYGAgMPZBYCZg9kFgICAg8PFgQeCENzc0NsYXNzZR4EXyFTQgICZBYCAgMPDxYEHg9WYWxpZGF0aW9uR3JvdXAFFmFkdmFuY2VkU2l0ZVNlYXJjaEZvcm0eDU9uQ2xpZW50Q2xpY2sFhAFlc2NhcGVDaGFyYWN0ZXIoJ2N0bDAwX2N0bDAwX0dlbmVyYWxCb3hfU2VhcmNoX3RtX3VzZXJjb250cm9sc19wdWJsaWNfZ29vZ2xlbWluaXNlYXJjaF9tYWluc2VhcmNoX2FzY3gxX3R4dFNlYXJjaFRleHRfdGJTYW5pdGl6ZWQnKTtkZAIFD2QWAmYPZBYIAgMQDxYCHgtOYXZpZ2F0ZVVybAUOfi9hY2NvdW50LmFzcHhkZGQCBxAPZBYCHgdvbmNsaWNrBURyYWRvcGVuKCcvTG9naW5wb3B1cC5hc3B4P2xvZ2luPXRydWUnLCAncndLZW5kb0xvZ2luJyk7cmV0dXJuIGZhbHNlO2RkAgkQD2QWAh8GBXpfZ2FxLnB1c2goWydfdHJhY2tQYWdldmlldycsICcvcmVnaXN0ZXItYnV0dG9uJ10pOyByYWRvcGVuKCcvTG9naW5wb3B1cC5hc3B4P3JlZ2lzdGVyPXRydWUnLCAncndLZW5kb0xvZ2luJyk7cmV0dXJuIGZhbHNlO2RkAgsPFCsAAhQrAANkZGQQFgFmFgEUKwADZGRkDxYBZhYBBXFUZWxlcmlrLldlYi5VSS5SYWRXaW5kb3csIFRlbGVyaWsuV2ViLlVJLCBWZXJzaW9uPTIwMTIuMi45MTIuNDAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49MTIxZmFlNzgxNjViYTNkNBYCZg8UKwADZGRkZAILD2QWAgIBD2QWAgIDD2QWAgIBD2QWBgIBDxYCHgRUZXh0BaICPGg0PlN1YnNjcmliZSB0byB0aGUgbW9udGhseSBLZW5kbyBVSSBuZXdzbGV0dGVyPC9oND4gICAgICAgICA8cCBjbGFzcz0iZGVzYyI+IAlHZXQgbm90aWZpZWQgYWJvdXQgdGhlIGxhdGVzdCBLZW5kbyBVSSBuZXdzIGFuZCByZWxlYXNlcy48YnIgLz4gCU5vIHNwYW0sIHdlIHByb21pc2UhPGJyIC8+IAk8c21hbGw+V2Ugd29uJ3Qgc2hhcmUgeW91ciBpbmZvIHdpdGggYW55b25lLiBTZWUgb3VyIDxhIGhyZWY9Ii9wcml2YWN5LXBvbGljeS5hc3B4Ij5Qcml2YWN5IFBvbGljeTwvYT4gPC9zbWFsbD4gPC9wPiBkAgMPFCsACA8WAh4NTGFiZWxDc3NDbGFzcwUHcmlMYWJlbGQWCB4GSGVpZ2h0GwAAAAAAADhAAQAAAB4FV2lkdGgbAAAAAADgc0ABAAAAHwEFEXJpVGV4dEJveCByaUhvdmVyHwICggMWCB8JGwAAAAAAADhAAQAAAB8KGwAAAAAA4HNAAQAAAB8BBRFyaVRleHRCb3ggcmlFcnJvch8CAoIDFggfCRsAAAAAAAA4QAEAAAAfChsAAAAAAOBzQAEAAAAfAQUTcmlUZXh0Qm94IHJpRm9jdXNlZB8CAoIDFggfCRsAAAAAAAA4QAEAAAAfChsAAAAAAOBzQAEAAAAfAQUTcmlUZXh0Qm94IHJpRW5hYmxlZB8CAoIDFggfCRsAAAAAAAA4QAEAAAAfChsAAAAAAOBzQAEAAAAfAQUUcmlUZXh0Qm94IHJpRGlzYWJsZWQfAgKCAxYIHwkbAAAAAAAAOEABAAAAHwobAAAAAADgc0ABAAAAHwEFEXJpVGV4dEJveCByaUVtcHR5HwICggMWCB8JGwAAAAAAADhAAQAAAB8KGwAAAAAA4HNAAQAAAB8BBRByaVRleHRCb3ggcmlSZWFkHwICggNkAgsPDxYCHhFVc2VTdWJtaXRCZWhhdmlvcmhkZAIPD2QWHAIBEA8WAh8FBThodHRwOi8vd3d3LnRlbGVyaWsuY29tL2RldmVsb3Blci1wcm9kdWN0aXZpdHktdG9vbHMuYXNweGRkZAIDEA8WAh8FBRdodHRwOi8vd3d3LmljZW5pdW0uY29tL2RkZAIFEA8WAh8FBRdodHRwOi8vd3d3LmtlbmRvdWkuY29tL2RkZAIHEA8WAh8FBS9odHRwOi8vd3d3LnRlbGVyaWsuY29tL2F1dG9tYXRlZC10ZXN0aW5nLXRvb2xzL2RkZAIJEA8WAh8FBRpodHRwOi8vd3d3LnNpdGVmaW5pdHkuY29tL2RkZAILEA8WAh8FBTZodHRwOi8vd3d3LnRlbGVyaWsuY29tL2FnaWxlLXByb2plY3QtbWFuYWdlbWVudC10b29scy9kZGQCDQ9kFgJmD2QWAgICD2QWAgIDEA8WAh8FBSAvbG9naW4uYXNweD9yZXR1cm51cmw9JTJmYWNjb3VudGRkZAIPDxYCHgVjbGFzcwUCZG5kAhEQD2QWAh8MBQhkaXNhYmxlZGRkAhMQD2QWAh8MBQhkaXNhYmxlZGRkAhUQD2QWAh8MBQhkaXNhYmxlZGRkAhcQD2QWAh8MBQhkaXNhYmxlZGRkAhkPFgIfDAUMYm9va21hcmtzIGRuZAIbDxYCHwwFAmRuZBgEBS9jdGwwMCRjdGwwMCRHZW5lcmFsQm94JENvbnRlbnQyJEdlbmVyaWNDb250ZW50Mw8UKwABZGQFNGN0bDAwJGN0bDAwJEdlbmVyYWxCb3gkSGVhZGVyQ29udGVudCRHZW5lcmljQ29udGVudDEPFCsAAWRkBS9jdGwwMCRjdGwwMCRHZW5lcmFsQm94JENvbnRlbnQyJEdlbmVyaWNDb250ZW50Mg8UKwABZGQFK2N0bDAwJGN0bDAwJENsaWNrdGFsZVJlY29yZCRHZW5lcmljQ29udGVudDcPFCsAAQUPR2VuZXJpY19Db250ZW50ZF4hywGeK5vRvCsdnnT7fpMo4hSr" type="hidden">
            </div>




            <div id="wrapper" class="home">
                <header>
                    <div class="centered-content header-main">

                        <a id="logo" href="http://www.kendoui.com/" title="Link to home page">
                            <img src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/kendo-logo.png" alt="Kendo logo">
                            Kendo UI - The way of HTML5
                        </a>
                        <!-- /end of #logo -->

                        <nav id="navi">
                            <ul>
                                <li>
                                    <a href="#expand">
                                        Products
                                        <span>‚?º</span>
                                    </a>
                                    <ol class="submenu-box">
                                        <li>
                                            <a href="http://www.kendoui.com/web">Kendo UI Web</a>
                                        </li>
                                        <li>
                                            <a href="http://www.kendoui.com/mobile">Kendo UI Mobile</a>
                                        </li>
                                        <li>
                                            <a href="http://www.kendoui.com/dataviz">Kendo UI DataViz</a>
                                        </li>
                                        <li>
                                            <a href="http://www.kendoui.com/server-wrappers.aspx">Server Side Wrappers</a>
                                        </li>
                                    </ol>
                                </li>

                                <li>
                                    <a href="http://demos.kendoui.com/">Demos</a>
                                </li>
                                <li>
                                    <a onclick="_gaq.push(['_trackPageview', '/top-nav/purchase']);" href="http://www.kendoui.com/purchase.aspx">Purchase</a>
                                </li>
                                <li class="button">
                                    <a href="http://www.kendoui.com/download" onclick="_gaq.push(['_trackPageview', '/download-button']);">Download</a>
                                </li>
                            </ul>
                        </nav>
                        <!-- /end of #navi -->

                        <nav id="navi-add">
                            <ul>
                                <li>
                                    <a href="http://www.kendoui.com/blogs.aspx">Blogs</a>
                                </li>
                                <li>
                                    <a href="http://docs.kendoui.com/">Documentation</a>
                                </li>
                                <li>
                                    <a href="#expand">
                                        Support
                                        <span>‚?º</span>
                                    </a>
                                    <ol class="submenu-box support-menu">
                                        <li>
                                            <a href="http://www.kendoui.com/forums.aspx">Forums</a>
                                        </li>
                                        <li>
                                            <a href="http://stackoverflow.com/questions/tagged/kendo-ui">StackOverflow Forums</a>
                                        </li>
                                    </ol>
                                </li>
                                <li>
                                    <a href="#expand">
                                        Resources
                                        <span>‚?º</span>
                                    </a>
                                    <div class="submenu-box">
                                        <h4>Featured Resource</h4>
                                        <h3>
                                            <a href="http://www.kendoui.com/dojo.aspx">Kendo UI Dojo</a>
                                        </h3>
                                        <hr>
                                        <ol id="resources-first">
                                            <li>
                                                <a href="http://www.kendoui.com/blogs.aspx">Blogs</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/code-library.aspx">Code Library</a>
                                            </li>
                                            <li>
                                                <a href="http://demos.kendoui.com/">Demos</a>
                                            </li>
                                            <li>
                                                <a href="http://docs.kendoui.com/">Documentation</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/faq/faq.aspx">FAQ</a>
                                            </li>
                                            <li>
                                                <a href="http://www.telerik.com/automated-testing-tools/campaigns/testing-kendoui-apps.aspx" target="_blank">Testing</a>
                                            </li>
                                        </ol>
                                        <ol>
                                            <li>
                                                <a href="http://www.kendoui.com/forums.aspx">Forums</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/roadmap.aspx">Roadmap</a>
                                            </li>
                                            <li>
                                                <a href="http://kendo.uservoice.com/forums/127393-kendo-ui-feedback" target="_blank">User Voice</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/videos.aspx">Videos</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/webinars.aspx">Webinars</a>
                                            </li>
                                            <li>
                                                <a href="http://www.kendoui.com/get-help.aspx">More Resources</a>
                                            </li>	
                                        </ol>
                                    </div>
                                </li>
                                <li>
                                    <a href="http://www.kendoui.com/contact.aspx">Contact Us</a>
                                </li>
                                <li class="searchPanel">
                                    <a href="http://www.kendoui.com/search.aspx">Search</a>
                                </li>
                            </ul>
                        </nav>
                        <!-- /end of #navi-add -->

                        <div id="search-login">



                            <div id="ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_pnlMain" onkeypress="javascript:return WebForm_FireDefaultButton(event, 'ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_btnSearch')">

                                <fieldset id="search">
                                    <input name="ctl00$ctl00$GeneralBox$Search$tm_usercontrols_public_googleminisearch_mainsearch_ascx1$txtSearchText$emptyTextInput" id="ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_txtSearchText_emptyTextInput" class="search-blur main-search-field serchBlurText" style="position: absolute; font-style: italic; color: rgb(169, 169, 169); width: 876px; height: 38px; padding: 0px 28px 0px 0px; top: 0px; left: 0px;" value="I'm looking for ‚?¶" type="text">
                                    <input style="" autocomplete="off" name="ctl00$ctl00$GeneralBox$Search$tm_usercontrols_public_googleminisearch_mainsearch_ascx1$txtSearchText$tbSanitized" id="ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_txtSearchText_tbSanitized" class="main-search ac_input" type="text">
                                    <span id="ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_txtSearchText_rfvSanitizedControl" class="tEmptySearchValidator" style="color:Red;display:none;"></span>





                                    <input name="ctl00$ctl00$GeneralBox$Search$tm_usercontrols_public_googleminisearch_mainsearch_ascx1$btnSearch" value="I'm looking for..." onclick="escapeCharacter('ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_txtSearchText_tbSanitized'); WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions( & quot; ctl00$ctl00$GeneralBox$Search$tm_usercontrols_public_googleminisearch_mainsearch_ascx1$btnSearch & quot; , & quot; & quot; , true, & quot; advancedSiteSearchForm & quot; , & quot; & quot; , false, false))" id="ctl00_ctl00_GeneralBox_Search_tm_usercontrols_public_googleminisearch_mainsearch_ascx1_btnSearch" title="Search" class="btnSearch" type="submit">
                                </fieldset>
                                <span id="search-close" title="close"></span>

                            </div>



                            <!--  /end of #search -->



                        </div>
                        <!-- /end of .search-login -->

                    </div>

                    <div class="header-content home">
                        <div style="background-position: 40% 0px;" id="slider-wrap" class="parallax-bg"> <div style="position: relative; background-position: 70% 0px;" id="slider" class="slider parallax-bg"> <div class="slider-sections sandbox"> <div class="ribbon3"> <a href="http://www.kendoui.com/download.aspx"> <span class="w"> <strong style="padding-top: 10px;">Kendo UI<br>
                                                    Q1 2013<br>
                                                    BETA</strong></span> <span class="d">Download</span> </a> </div> <section style="display: none;" class="first"> <img style="position: absolute; left: -1349px; top: 0px; width: 367px; height: 328px; display: none; opacity: 1;" class="mt-20 t-frame-element" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/main3.png" alt="Kendo UI"> <div style="padding-top: 20px;" class="text"> <h2 style="position: absolute; left: -918.5px; top: 20px; width: 470px; height: 77px; display: none; opacity: 1;" class="t-frame-element"> Kendo UI Spring 2013 Release <strong>Keynote, March 20,</strong> 11 AM EST</h2> <ul style="position: absolute; left: -918.5px; top: 122.8px; width: 455px; height: 105px; display: none; opacity: 1;" class="copy t-frame-element"> <li><strong> BIG news</strong>: Java JSP and PHP server wrappers, Windows Phone 8 support, Web widgets and DataViz charts</li> <li><strong>Live Q&amp;A</strong>, to answer all of your questions </li> <li><strong>BIG prizes</strong> (raffle): MacBook Air, Mobile device packs, Nexus 10 tablets and Kendo UI licenses</li> </ul> <p style="position: absolute; left: -918.5px; top: 242.8px; width: 470px; height: 32px; display: none; opacity: 1;" class="button t-frame-element"><a onclick="_gaq.push(['_trackPageview', '/index-banner/keynote-register']);" href="https://event.on24.com/eventRegistration/EventLobbyServlet?target=registration.jsp&amp;eventid=587764&amp;sessionid=1&amp;key=994FF2EDF5D60E86ACF2E5023E7D19B1&amp;sourcepage=register">REGISTER NOW</a> </p> </div> </section> <section style="display: none;"> <img style="position: absolute; left: -1349px; top: 0px; width: 383px; height: 239px; opacity: 1; display: none;" class="t-frame-element" alt="Kendo UI" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/dataviz-home-image-q2.png"> <div style="padding-top: 20px;" class="text"> <h2 style="position: absolute; left: -918.5px; top: 20px; width: 470px; height: 77px; opacity: 1; display: none;" class="t-frame-element">Deliver amazing <strong>data visualizations</strong> in <strong>HTML5</strong></h2> <ul style="position: absolute; left: -918.5px; top: 122.8px; width: 455px; height: 63px; opacity: 1; display: none;" class="copy t-frame-element"> <li>Present rich visual information on any browser and any device</li> <li>Hardware-accelerated, touch-aware data visualization widgets</li> <li>Animated charts, graphs and gauges right out of the box!</li> </ul> <p style="position: absolute; left: -918.5px; top: 200.8px; width: 470px; height: 32px; opacity: 1; display: none;" class="button t-frame-element"><a onclick="_gaq.push(['_trackPageview', '/index-banner/dataviz-download']);" href="http://www.kendoui.com/get-kendo-ui/download-kendo.aspx?pid=1035&amp;lict=1">DOWNLOAD</a> <a href="http://www.kendoui.com/dataviz.aspx" onclick="_gaq.push(['_trackPageview', '/index-banner/dataviz-learn-more']);" class="dimmed">Learn More</a></p> </div> </section> <section style="display: block;"> <img style="position: absolute; left: 0px; top: 0px; width: 361px; height: 282px; opacity: 1; display: block;" class="mt20 t-frame-element" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/q3-2012.png" alt="Kendo UI" height="282" width="361"> <div class="text" style="padding-top: 20px;"> <h2 style="position: absolute; left: 430.5px; top: 20px; width: 470px; height: 77px; opacity: 1; display: block;" class="t-frame-element">Build HTML5 apps without having to write JavaScript </h2> <p style="position: absolute; left: 430.5px; top: 122.8px; width: 470px; height: 22px; display: block;" class="t-frame-dispose">With Kendo UI server wrappers</p> <ul style="position: absolute; left: 430.5px; top: 174.8px; width: 455px; height: 63px; opacity: 1; display: block;" class="copy t-frame-element"> <li>ASP.NET MVC server wrappers</li> <li>Java JSP (Beta)</li> <li>PHP (coming in 2013)</li> </ul> <p style="position: absolute; left: 430.5px; top: 247.8px; width: 470px; height: 32px; opacity: 1; display: block;" class="button t-frame-element"><a href="http://www.kendoui.com/download">Download</a> <a href="http://www.kendoui.com/server-wrappers.aspx" onclick="_gaq.push(['_trackPageview', '/index-banner/wrappers-learn-more']);" class="dimmed">Learn More</a></p> </div> </section> <section style="display: none;"> <a title="Get your free Kendo UI produced whitepaper" href="http://www.kendoui.com/whitepapers/mobile-developer-guidance.aspx"> <img style="position: absolute; left: -1349px; top: 0px; width: 390px; height: 245px; opacity: 1; display: none;" class="t-frame-element" alt="Kendo UI" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/guidance.png" height="245" width="390"></a> <div style="padding-top: 20px;" class="text"> <h2 style="position: absolute; left: -918.5px; top: 20px; width: 470px; height: 77px; opacity: 1; display: none;" class="t-frame-element">Mobile Developer Guidance whitepaper</h2> <ul style="position: absolute; left: -918.5px; top: 122.8px; width: 455px; height: 63px; opacity: 1; display: none;" class="copy t-frame-element"> <li>Get real-life advice for your ‚??Hybrid vs. Native‚?ù dilemma</li> <li>Industry experts share their views on mobile industry</li> <li>Align your mobile strategy and business goals</li> </ul> <p style="position: absolute; left: -918.5px; top: 200.8px; width: 470px; height: 32px; opacity: 1; display: none;" class="button t-frame-element"> <a onclick="_gaq.push(['_trackPageview', '/index-banner/whitepaper']);" href="http://www.kendoui.com/whitepapers/mobile-developer-guidance.aspx">Get your free copy</a> </p> </div> </section> <section style="display: none;"> <img style="position: absolute; left: -1349px; top: 0px; width: 367px; height: 271px; opacity: 1; display: none;" class="t-frame-element" alt="Kendo UI" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/kendo-home-5th-banner.png"> <div style="padding-top: 20px;" class="text"> <h2 style="position: absolute; left: -918.5px; top: 20px; width: 470px; height: 77px; opacity: 1; display: none;" class="t-frame-element">The New benchmark for HTML5/JS web development</h2> <ul style="position: absolute; left: -918.5px; top: 122.8px; width: 455px; height: 63px; opacity: 1; display: none;" class="copy t-frame-element"> <li>Quickly create awesome cross-platform HTML5 apps.</li> <li>End-to-end framework designed for ease of use for JS beginners.</li> <li>Unmatched performance and minimal footprint.</li> </ul> <p style="position: absolute; left: -918.5px; top: 200.8px; width: 470px; height: 32px; opacity: 1; display: none;" class="button t-frame-element"><a onclick="_gaq.push(['_trackPageview', '/index-banner/web-download']);" href="http://www.kendoui.com/get-kendo-ui/download-kendo.aspx?pid=1035&amp;lict=1">Download</a> <a href="http://www.kendoui.com/web" class="dimmed">Learn More</a></p> </div> </section> </div> <ol class="slider-nav" style="margin-left: -60px; width: 120px"><li><a class="" href="#0">slide</a></li><li><a class="" href="#1">slide</a></li><li><a class="selected" href="#2">slide</a></li><li><a class="" href="#3">slide</a></li><li><a class="" href="#4">slide</a></li></ol></div> <a style="display: none;" href="javascript:%20void(0)" class="slider-prev">¬´</a> <a style="display: none;" href="javascript:%20void(0)" class="slider-next">¬ª</a> </div>
                    </div>
                    <!-- /end of .header-content -->

                </header>



                <div id="content" class="tClear sandbox">

                    <section class="home-content mb70"> <h3 class="mb40">Comprehensive HTML5, JavaScript framework for modern web and mobile app development </h3> <p>Kendo
                            UI is everything professional developers need to build HTML5 sites and 
                            mobile apps. Today, productivity of an average HTML/jQuery developer is 
                            hampered by assembling a Frankenstein framework of disparate JavaScript 
                            libraries <br>
                            and plug-ins.</p> <p>Kendo UI has it all: rich jQuery-based widgets, a 
                            simple and consistent programming interface, a rock-solid DataSource, 
                            validation, internationalization, a MVVM framework, themes, templates 
                            and the list goes on.</p> </section> <section class="home-content bg nm clearfix"> <h3 class="tac pt50 pb10">What‚??s included in Kendo UI</h3> <article class="three-col nm"> <div class="block"><a href="http://www.kendoui.com/web">web</a></div> <h4>Web app<br>
                                development framework</h4> <p>Kendo UI Web provides you with a simple 
                                and consistent programming interface, polished and innovative UI widgets
                                for the web, powered by jQuery, HTML5 &amp; CSS3, a MVVM framework, 
                                themes which are easily customizable to fit the widgets to your web 
                                application, templates and much more. All that‚??s left to do is to 
                                develop modern desktop and mobile web applications by leveraging your 
                                web development skills while unlocking the power of JavaScript, HTML5 
                                &amp; CSS3, and using the intuitive <a href="http://www.kendoui.com/web">Kendo UI Web</a>.</p> </article> <article class="three-col"> <div class="block mobile"><a href="http://www.kendoui.com/mobile">mobile</a></div> <h4>Mobile app<br>
                                development framework</h4> <p>Build native-like mobile apps for iPhone, Android and Blackberry, and deliver
                                unmatched user experience without any extra coding. </p> <p><a href="http://www.kendoui.com/mobile">Kendo UI Mobile</a> is packed with easy-to-use jQuery-based widgets and built-in rich components for your fast mobile application development.</p> </article> <article class="three-col"> <div class="block dataviz"><a href="http://www.kendoui.com/dataviz">dataviz</a></div> <h4>Rich UI widgets for<br>
                                interactive data visualization</h4> <p>Create interactive data 
                                visualization with HTML5 and JavaScript, build rich web apps that look 
                                and behave native on any platform or device. Kendo UI DataViz uses SVG, 
                                and brings you a collection of UI widgets, including jQuery charts, 
                                gauges, and more. </p> <p><a href="http://www.kendoui.com/dataviz">Kendo UI DataViz</a>
                                uses automatic hardware acceleration for all animations and rendering, 
                                maximizing performance and minimizing the impact on CPU resources.</p> </article> </section>
                    <div class="subscribe">
                        <div id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_ralpSendEmail" style="display:none;">

                        </div>
                        <div id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rapSendEmailPanel">
                            <div id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rapSendEmail">
                                <!-- 2012.2.912.40 -->
                                <div id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_pnlEnterEmail" class="form" onkeypress="javascript:return WebForm_FireDefaultButton(event, 'ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_btnSubscribe')">

                                    <h4>Subscribe to the monthly Kendo UI newsletter</h4>         <p class="desc"> 	Get notified about the latest Kendo UI news and releases.<br> 	No spam, we promise!<br> 	<small>We won't share your info with anyone. See our <a href="http://www.kendoui.com/privacy-policy.aspx">Privacy Policy</a> </small> </p> 
                                    <div class="inputWrapper emailSubEmpyMessage">
                                        <span id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rtbEmail_wrapper" class="riSingle RadInput RadInput_Default" style="width:318px;"><input id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rtbEmail" name="ctl00$ctl00$GeneralBox$Content2$usercontrols_public_common_subscribebyemail_ascx1$rtbEmail" size="20" maxlength="150" class="riTextBox riEmpty" value="Enter your email address" style="height:24px;" type="text"><input id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rtbEmail_ClientState" name="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_rtbEmail_ClientState" type="hidden"></span>
                                        <span id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_requireEmail" class="errorEmpty" style="color:Red;display:none;">
                                            <strong>Email cannot be empty!</strong>
                                        </span>
                                        <span id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_regexEmail" class="errorInvalid" style="color:Red;display:none;">
                                            <strong>Please enter a valid email address!</strong>      
                                        </span>
                                        <span id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_cvEmailRegistered" class="errorExist" style="color:Red;display:none;">
                                            <strong>This email is already subscribed to the Kendo UI Newsletter.</strong>
                                        </span>
                                    </div>
                                    <span class="button">
                                        <input name="ctl00$ctl00$GeneralBox$Content2$usercontrols_public_common_subscribebyemail_ascx1$btnSubscribe" value="Subscribe" onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$ctl00$GeneralBox$Content2$usercontrols_public_common_subscribebyemail_ascx1$btnSubscribe", "", true, "", "", false, true))' id="ctl00_ctl00_GeneralBox_Content2_usercontrols_public_common_subscribebyemail_ascx1_btnSubscribe" type="button"></span>

                                </div>


                            </div>
                        </div>
                    </div>

                    <section class="home-content tClear mb50"> <article class="two-col nm"> <h3 class="tac mb30"> <span>Why choose</span>
                                Kendo UI</h3> <ul> <li>Everything you need to build fast HTML5 apps</li> <li>Great UX across all devices and browsers</li> <li>Straight-up performance without compromise</li> <li>Unmatched support available from day one
                                    even with a trial.</li> </ul> </article> <article class="two-col tac"> <h3 class="mb30"> <span>Kendo UI</span>
                                Success stories</h3> <p class="mb30">Leading brands choose Kendo UI for their engaging <br>
                                websites and apps.</p> <img alt="" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/logos.png" class="logos"> </article> </section> <section class="feature home-content bg"> <h3 class="tac pt50 pb30">What customers say about Kendo UI</h3> <blockquote class="pl40 mb30"> <p>With
                                the open source world being as disjointed as it is, there is always 
                                someone writing a new plug in. Most of the time it is already written. 
                                With Kendo UI, I can get <mark>all of the plug-ins</mark> I need, knowing they will all have a <mark>consistent programming model</mark> and <mark>rock solid support</mark> that will be there if I need help.</p> </blockquote> <cite class="pl90"><strong>Joshua Grippo</strong> Chief Executive Officer  <a href="http://www.radolo.com/">Radolo</a> </cite> </section>



                </div>
                <!-- /end of #content -->


            </div>
            <!-- /end of #wrapper -->



            <footer>
                <div class="centered-content">
                    <ul id="footer-navi">
                        <li class="active"><a class="l-home" href="http://www.kendoui.com/">Home</a></li>
                        <li><a href="http://www.kendoui.com/web">Web</a></li>
                        <li><a href="http://www.kendoui.com/mobile">Mobile</a></li>
                        <li><a href="http://www.kendoui.com/dataviz">DataViz</a></li>
                        <li><a href="http://demos.kendoui.com/">Demos</a></li>
                        <li><a href="http://www.kendoui.com/dojo.aspx">Kendo UI Dojo</a></li>
                        <li><a href="http://www.kendoui.com/blogs.aspx">Blogs</a></li>
                        <li><a href="http://www.kendoui.com/forums.aspx">Forums</a></li>
                        <li><a href="http://docs.kendoui.com/">Documentation</a></li>
                        <li><a href="http://www.kendoui.com/get-help.aspx">Support &amp; Resources</a></li>
                        <li><a href="http://www.kendoui.com/roadmap.aspx">Roadmap</a></li>
                        <li><a href="http://www.kendoui.com/faq/faq.aspx">FAQ</a></li>
                        <li><a class="l-purchase" href="http://www.kendoui.com/purchase.aspx">Purchase</a></li>
                        <li><a class="l-download" href="http://www.kendoui.com/download">Download</a></li>
                    </ul>

                    <p class="desc">Kendo UI framework is developed by Telerik - a 
                        leading provider of UI components for web, desktop and mobile 
                        applications. Trusted by over 100,000 customers worldwide for our 
                        devotion to quality and industry-best technical support, Telerik helps 
                        professionals maximize their productivity and "deliver more than 
                        expected" every day.</p>

                    <div class="social-icons fhpage">
                        <strong>kendoui - powered by html5, css3 &amp; jquery</strong>
                        <span>get social</span>
                        <ul>
                            <li><a class="twitter" href="http://twitter.com/#%21/KendoUI">Twitter</a></li>
                            <li><a class="fb" href="http://www.facebook.com/KendoUI">Facebook</a></li>
                            <li><a class="gp" href="https://plus.google.com/117798269023828336983/posts">Google plus</a></li>
                            <li><a class="rss" href="http://www.kendoui.com/blogs/blogs.rss">RSS</a></li>
                        </ul>
                    </div>

                    <div class="pp-bg">
                        <a href="http://www.kendoui.com/privacy-policy.aspx">Privacy Policy</a> | <a href="http://www.kendoui.com/branding-guidelines.aspx">Branding Guidelines</a>
                    </div>
                    <p class="copy">Copyright ¬© 2011 - 2013 Telerik Inc. All rights reserved.</p>

                </div>
                <!-- /end of .centered-content -->
            </footer>












            <div id="sitenav">
                <div id="sitenav-main">
                    <ul class="products">
                        <li class="dev-tools">
                            <a id="ctl00_ctl00_siteNavigation_hlDevTools" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/dev-tools']);" href="http://www.telerik.com/developer-productivity-tools.aspx">
                                <h2><small>.NET Developer Tools </small>DevTools</h2>
                                <p>UI controls for ASP.NET AJAX, MVC, WPF,<br>SIlverlight, Windows 8 and Windows Phone</p>
                            </a>
                        </li>

                        <li class="icenium">
                            <a id="ctl00_ctl00_siteNavigation_hlIcenium" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/icenium']);" href="http://www.icenium.com/">
                                <h2><small>Hybrid Mobile Development </small>Icenium</h2>
                                <p>Cross-platform Mobile Development Tool<br>with cloud-based architecture</p>
                            </a>
                        </li>

                        <li class="kendo">
                            <a id="ctl00_ctl00_siteNavigation_hlKendo" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/kendo-ui']);" href="http://www.kendoui.com/">
                                <h2><small>HTML5 / JavaScript Development </small>Kendo UI</h2>
                                <p>Everything you need to build sites and<br>mobile apps with JavaScript and HTML5</p>
                            </a>
                        </li>

                        <li class="test-studio">
                            <a id="ctl00_ctl00_siteNavigation_hlTesting" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/test-studio']);" href="http://www.telerik.com/automated-testing-tools/">
                                <h2><small>Testing Tools </small>Test Studio</h2>
                                <p>One easy tool for Functional, Performance,<br>Load and Mobile software testing</p>
                            </a>
                        </li>

                        <li class="sitefinity">
                            <a id="ctl00_ctl00_siteNavigation_hlSitefinity" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/sitefinity']);" href="http://www.sitefinity.com/">
                                <h2><small>Web Presence Platform </small>Sitefinity CMS</h2>
                                <p>Everything for your online business - content<br>management, ecommerce, emarketing</p>
                            </a>
                        </li>

                        <li class="team-pulse">
                            <a id="ctl00_ctl00_siteNavigation_hlTeamPulse" onclick="_gaq.push(['_trackPageview', '/top-nav/site-nav/teampulse']);" href="http://www.telerik.com/agile-project-management-tools/">
                                <h2><small>Agile Project Management </small>TeamPulse</h2>
                                <p>Simple and intuitive project management<br>and collaboration software</p>
                            </a>
                        </li>
                    </ul><!-- end of .products -->

                    <div class="telerik-contacts">
                        <div class="contacts-wrap">
                            <div class="call-us">
                                <span class="phone-icon"></span>
                                <h3>Contact us</h3>
                                <span>We are here for you.</span>
                            </div>
                            <ul class="contacts">
                                <li><span class="us">usa</span>+1‚??888‚??365‚??2779</li>
                                <li><span class="uk">uk</span>+44‚??20‚??7291‚??0580</li>
                                <li><span class="bg">bg</span>+359‚??2‚??8099850</li>
                                <li><span class="de">de</span>+49‚??89‚??2441642‚??70</li>
                                <li><span class="au">au</span>+61‚??2‚??8090‚??1465</li>
                                <li><span class="mail">email</span><a href="mailto:sales@telerik.com">sales@telerik.com</a></li>
                            </ul>
                            <a href="http://www.kendoui.com/account" class="your-account"><span class="ninja-icon"></span>Your account <span>Access to your products, updates and support</span></a>
                        </div> 
                    </div><!-- end of .telerik-contacts -->
                </div><!-- end of #sitenav-main-->

                <div id="sitenav-bar">
                    <a href="http://www.telerik.com/" title="Telerik" id="Telerik-logo">
                        <img src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/telerik-logo.png" alt="Telerik" height="30" width="107">
                        <span id="telerik-slogan"></span>
                    </a>
                    <span id="toggle-link">Product Families<span class="drop-down-arrow"></span></span>

                    <ul id="sitenav-personal-info-menu">
                        <li class="profile-widget">
                            <div id="ctl00_ctl00_siteNavigation_ctl00_liSignOut" class="dn sign-out">
                                <input name="ctl00$ctl00$siteNavigation$ctl00$btnLogout" value="Log out" id="ctl00_ctl00_siteNavigation_ctl00_btnLogout" class="sign-input logout" type="submit">
                            </div>

                            <span class="dn user-welcome">Your Account</span>



                            <div id="sitenav-personal-info-panel" class="sitenavi-panel">
                                <div class="inner-content">
                                    <h3 id="ctl00_ctl00_siteNavigation_h4Welcome" class=""><span id="spanName">Anonymous</span></h3>

                                    <span class="account-avatar">
                                        <img id="imgAvatar" src="Kendo%20UI%20-%20jQuery%20HTML5%20framework%20for%20desktop,%20mobile%20app%20development,%20HTML5%20data%20visualization_files/main-sprite.png" alt="">
                                    </span>

                                    <ul class="profile-links">
                                        <li><a id="ctl00_ctl00_siteNavigation_hlAccount" onclick="_gaq.push(['_trackPageview', '/top-nav/account']);" class="" href="http://www.kendoui.com/account.aspx">Account Overview</a></li>
                                        <li class="dn"></li>
                                        <li><a id="ctl00_ctl00_siteNavigation_hlSupportTickets" onclick="_gaq.push(['_trackPageview', '/top-nav/support-tickets']);" class="" href="http://www.kendoui.com/account/support-tickets/my-support-tickets.aspx">Support Tickets <span id="spanNewMessagesCount"></span></a></li>
                                        <li><a id="ctl00_ctl00_siteNavigation_hlProfile" onclick="_gaq.push(['_trackPageview', '/top-nav/edit-profile']);" class="" href="http://www.kendoui.com/account/profile.aspx">Edit Profile</a></li>
                                        <li class="log-out"><a href="#">Log out</a></li>
                                    </ul>
                                </div>

                                <div class="wood">
                                    <nav id="ctl00_ctl00_siteNavigation_nBookmarks" class="bookmarks">
                                        <h4>Your Bookmarks</h4>
                                        <p id="no-bookmarks">It seems you haven't bookmarked any pages. Fix that by clicking the button below</p>
                                        <ul id="links-container"></ul>
                                    </nav>

                                    <div id="ctl00_ctl00_siteNavigation_dAddBookMark" class="">
                                        <a href="#" onclick="addLink();
                return false;" id="add-bookmark" class="icon-button add-bookmark" title="It will appear in your links">
                                            <span></span>Bookmark this page</a>
                                    </div>
                                </div><!-- end of .wood -->
                            </div><!-- #sitenav-personal-info-panel -->
                        </li>

                        <li>ABOUT US<span class="drop-down-arrow"></span><span class="arrow"></span>
                            <div id="sitenav-about-us-panel" class="sitenavi-panel">
                                <h3>About Telerik</h3>
                                <ul>
                                    <li><a href="http://www.telerik.com/company.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/company']);">Company</a></li>
                                    <li><a href="http://www.telerik.com/company/press-center.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/press-center']);">Press Center</a></li>
                                    <li><a href="http://www.telerik.com/company/customers.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/customers']);">Customers</a></li>
                                    <li><a href="http://www.telerik.com/community.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/community']);">Community</a></li>
                                    <li><a href="http://www.telerik.com/company/careers.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/careers']);">Careers</a></li>
                                    <li><a href="http://www.telerik.com/company/contact-us.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/contacts']);">Contacts</a></li>
                                </ul>
                            </div>
                        </li>

                        <li class="shopping-cart dn"><a href="http://www.kendoui.com/purchase/shopping-cart.aspx" onclick="_gaq.push(['_trackPageview', '/top-nav/shopping-cart']);">shopping cart <span id="spanSCItemsCount"></span></a></li>
                    </ul><!-- end of #sitenav-personal-info-menu -->
                </div><!-- end of #sitenav-bar -->
            </div><!-- end of #sitenav -->

            <div id="ctl00_ctl00_siteNavigation_divMainScripts">

            </div>

            <!-- Smile :-) -->

        </form>

        <div id="ctl00_ctl00_pnlClicktaleBottom">

            <div id="ClickTaleDiv" style="display: none;"></div>



        </div>




    </body><pixelperfectlastoverlay id="ppReloadLastOverlay"></pixelperfectlastoverlay></html>