var FD_URL = 'http://analysis.xueersi.com/stats/xes_stat.php',
FD_CSS = '<style type="text/css">.sta_span{position: absolute;background: #0a7105; color:#FFF;height:20px; padding:0 5px;cursor: pointer;}.sta_b{z-index:100;border:1px solid #330000;border-bottom:0px;color:red;}.sta_div{border:1px solid #330000;z-index:101;}.sta_Box{display: none; border:1px solid #330000; background:#FFF; position: absolute;z-index: 200;padding:5px; border-radius:6px;-moz-border-radius:6px;-webkt-border-radius:6px;font: 12px/1.6em "宋体",Verdana,Helvetica,Arial,sans-serif;}</style><div class="sta_Box" id="staBox">载入中...</div><div style="left: 0px; top: 0px; display: block;cursor: pointer;" class="sta_Box" id="staBoxIndex">SHOW</div>',
FD_ID = 'xes_id',
FD_IDR = 'xes_offset'; (function($) {
    var c = {
        id: typeof(FD_ID) == 'undefined' ? 'f_id': FD_ID,
        pos: typeof(FD_IDR) == 'undefined' ? 'f_offset': FD_IDR,
        pageName: typeof(FD_NAME) == 'undefined' ? 'pname': FD_NAME,
        url: typeof(FD_URL) == 'undefined' ? 'sta.gif': FD_URL,
        data: [],
        auth: null,
        events: 0,
        sindex: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13],
        sengin: ["baidu.com", "baidu.com", "google.com", "google.cn", "soso.com", "sogou.com", "search.yahoo.com", "one.cn.yahoo.com", "114search.118114.cn", "youdao.com", "bing.com"],
        sword: ["wd", "word", "q", "q", "w", "query", "p", "p", "kw", "q", "q"],
        win: window || {},
        doc: document,
        ref: document.referrer,
        nav: navigator,
        loc: location,
        euc: encodeURIComponent,
        setCke: function(n, v, t, h, d) {
            var e = new Date();
            e.setTime(e.getTime() + t * 1000);
            c.doc.cookie = n + "=" + v + (t ? "; expires=" + e.toGMTString() : "") + (d ? "; domain=" + d: "") + (h ? "; path=" + h: "")
        },
        getCke: function(l) {
            var m = new RegExp("(^| )" + l + "=([^;]*)(;|\x24)");
            var k = m.exec(c.doc.cookie);
            if (k) {
                return k[2] || null
            }
            return null
        }
    };
    $.fn.extend({
        f_cik: function(A) {
            return this.each(function() {
                var m = new Image(1, 1);
                m.src = c.url + '?op=click&pn=' + c.pageName + '&id=' + $(this).attr(c.id) + '&m=' + A + '&r=' + Math.random()
            })
        },
        f_cikShow: function() {
            return this.each(function() {
                var o = $(this).offset();
                var _s1 = c.data['pv_' + c.pageName],
                _s2 = (c.data.click[c.pageName] || 0),
                _s3 = (c.data.click[this.id] || 0),
                _s4 = c.data['pv'];
                var tmp = ['按Esc键关闭浮层', '当前页面ID: ' + c.pageName, '当前事件ID: ' + this.id + (this.id.substring(0, 1) == '_' ? '(私有)': '(全局)'), '<hr><b>转化率<\/b>', '转化点击率: ' + $.fn._toFix(_s3, _s1, '%'), '点击占有率: ' + $.fn._toFix(_s3, _s2, '%'), '<hr><b>当前模块<\/b>', '模块点击数: ' + _s3, '页面点击量: ' + _s2, '当前页面PV: ' + _s1, '<hr><b>页面概况<\/b>', '日总访问IP: ' + c.data['ip'], '日总访问PV: ' + _s4].join('<br>');
                $('#staBox').css({
                    top: (o.top + 20) + 'px',
                    left: o.left + 'px'
                }).show().html(tmp)
            })
        },
        f_cikIndex: function() {
            return this.each(function() {
                var _s1 = (c.data.click[c.pageName] || 0),
                _s2 = c.data['pv_' + c.pageName];
                var tmp = ['<b>当前页面<\/b>', '监听事件总数: ' + c.events, '页面跳出率: ' + $.fn._toFix(_s2 - _s1, _s2, '%'), '当前页面PV: ' + _s2, '当前页面IP: ' + c.data['ip'], '当前页面点击量: ' + _s1, '<hr><b>全站概述<\/b>', '日总访问IP: ' + c.data['ip'], '日总访问PV: ' + c.data['pv']].join('<br>');
                $(this).html(tmp)
            })
        },
        _toFix: function(A, B, C) {
            A = B <= 0 ? 0 : (A * 100 / B).toFixed(2);
            return A + (C || '')
        }
    });
    function cikShow() {
        $(c.doc.body).append(FD_CSS);
        $('[' + c.id + ']').each(function(i) {
			alert
            var _P = $(this).offset(),
            _ID = $(this).attr(c.id),
            _AR = $(this).attr(c.pos);
            _AR = typeof(_AR) == 'undefined' ? '0,0': _AR;
            _AR = _AR.split(',');
            _AR[0] = parseInt(_AR[0]) + _P.left;
            _AR[1] = parseInt(_AR[1]) + _P.top - 20;
            _AR[1] = _AR[1] < 0 ? 0 : _AR[1]; ++c.events;
            $(c.doc.body).append("<span id='" + _ID + "' class='sta_span' style='left:" + _AR[0] + "px;top:" + _AR[1] + "px;z-index:9999;'>0</span>");
            $('#' + _ID).hover(function() {
                $(this).addClass('sta_b');
                $('[' + c.id + '=' + _ID + ']').addClass('sta_div')
            },
            function() {
                $(this).removeClass('sta_b');
                $('[' + c.id + '=' + _ID + ']').removeClass('sta_div')
            }).click(function() {
                $(this).f_cikShow()
            })
        });
        $.getJSON(c.url + '?op=getclick&pu=' + c.doc.auth + '&pn=' + c.pageName + '&callback=?&r=' + Math.random(),
        function(data) {
            if (data.auth == 1) {
                c.setCke('__STA_U', '', -3600)
            }
            c.data = data;
            for (var k in data.click) {
                $('#' + k).text(data.click[k])
            }
        });
        $(c.doc).keydown(function(e) {
            if (e == null) {
                keycode = event.keyCode
            } else {
                keycode = e.which
            }
            if (keycode == 27) {
                $('#staBox').hide()
            }
        });
        $('#staBoxIndex').hover(function() {
            $(this).f_cikIndex()
        },
        function() {
            $(this).text('SHOW')
        })
    }
    function f() {
        this.tags = {};
        this.init()
    }
    f.prototype = {
        init: function() {
            this._setPars();
            var _m = new Image(1, 1);
            _m.src = c.url + '?op=hits&pn=' + c.pageName + '&' + this._getPars()
        },
        _setPars: function() {
            this.tags.bw = screen.width + 'x' + screen.height;
            this.tags.dp = screen.colorDepth;
            this.tags.ac = c.nav.appCodeName;
            this.tags.an = this._getBw();
            this.tags.pf = c.nav.platform;
            this.tags.lg = (c.nav.systemLanguage || (c.nav.browserLanguage || (c.nav.language || (c.nav.userLanguage || "-")))).toLowerCase();
            this.tags.ck = (c.nav.cookieEnabled ? "1": "0");
            this.tags.tz = new Date().getTimezoneOffset() / 60;
            this.tags.fv = this._getFl();
            this.tags.ja = (navigator.javaEnabled() ? "1": "0");
            this.tags.rf = c.euc(document.referrer || "");
            this.tags.cid = this._getCouId(c.loc.href);
            this.tags.ucsrc = this._getValue('uc_src', c.loc.href);
            if (c.ref) {
                for (var o = 0; o < c.sengin.length; ++o) {
                    if ((c.ref.indexOf(c.sengin[o]) > -1) && (this._getValue(c.sword[o], c.ref))) {
                        this.tags.sw = c.euc(this._getValue(c.sword[o], c.ref));
                        this.tags.se = c.sindex[o];
                        break
                    }
                }
            } else {
                this.tags.se = 1
            }
        },
        _getPars: function() {
            var r = [];
            for (var k in this.tags) {
                r.push(k + '=' + this.tags[k])
            }
            return r.join('&')
        },
        _getFl: function() {
            var r = '';
            if (c.nav.plugins && c.nav.mimeTypes.length) {
                var k = c.nav.plugins["Shockwave Flash"];
                if (k && k.description) {
                    r = parseInt(k.description.replace(/([a-zA-Z]|\s)+/, "").replace(/(\s)+r/, ".")) + ".0"
                }
            } else {
                if (c.doc.ActiveXObject) {
                    var m = 0;
                    for (var l = 10; l >= 2; l--) {
                        try {
                            var p = new ActiveXObject("ShockwaveFlash.ShockwaveFlash." + l);
                            if (p) {
                                m = l + ".0";
                                break
                            }
                        } catch(o) {}
                    }
                    r = parseInt(m) + ".0"
                }
            }
            return r
        },
        _getCouId: function(n) {
            var l = new RegExp("/kc/([0-9]+).html");
            var k = n.match(l);
            return k ? k[1] : 0
        },
        _getValue: function(m, n) {
            var l = new RegExp("(^|&|\\?)" + m + "=([^&]*)(&|\x24|#)");
            var k = n.match(l);
            return k ? k[2] : ""
        },
        _getBw: function() {
            var ua = c.nav.userAgent.toLowerCase(),
            _bv = 0,
            _bw,
            _s;
            if (ua.indexOf('msie') > -1) {
                _bw = 'msie';
                _bv = (_s = ua.match(/msie ([\d]+.[\d]+)/)) ? _s[1] : 0
            } else if (ua.indexOf('firefox') > -1) {
                _bw = 'firefox';
                _bv = (_s = ua.match(/firefox\/([\d]+.[\d]+)/)) ? _s[1] : 0
            } else if (ua.indexOf('opera') > -1) {
                _bw = 'opera';
                _bv = (_s = ua.match(/opera.([\d]+.[\d]+)/)) ? _s[1] : 0
            } else if (ua.indexOf('chrome') > -1) {
                _bw = 'chrome';
                _bv = (_s = ua.match(/chrome\/([\d]+.[\d]+)/)) ? _s[1] : 0
            } else if (ua.indexOf('safari') > -1) {
                _bw = 'safari';
                _bv = (_s = ua.match(/version\/([\d]+.[\d]+).*safari/)) ? _s[1] : 0
            } else {
                _bw = 'other'
            }
            this.tags.bv = _bv;
            return _bw
        }
    };
    new f();
    jQuery(function($) {
        c.doc.auth = c.getCke('__STA_U');
        if (c.doc.auth != null) {
            cikShow()
        }
        $('[' + c.id + ']').mousedown(function() {
            $(this).f_cik(1);
            return true
        });
        $('body').attr(c.id, '').mousedown(function(e) {
            var obj = e.srcElement || e.target;
            if (obj.tagName == 'A') {
                $(this).f_cik(0)
            }
            return true
        })
    })
})(jQuery);