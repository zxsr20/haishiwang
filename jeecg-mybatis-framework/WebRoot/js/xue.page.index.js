/**
 * XESUI 
 * Copyright 2013 xueersi.com All rights reserved.
 *
 * @description 
 *
 * @author Marco (marco@xesui.com)
 * @modify 2013-07-12 16:52:31
 * @version $Id$
 * 
 * @links http://xesui.com
 */


/**
 * @name xue.page.index.js
 * @description 首页文件
 * 
 * @module 
 * @submodule 
 * @main 
 * @class 
 * @constructor 
 * @static 
 */
// 邮箱后缀提示@@@
function mailAutoName () {
     $("#username").mailAutoComplete({
            boxClass: "out_box", //外部box样式
            listClass: "list_box", //默认的列表样式
            focusClass: "focus_box", //列表选样式中
            markCalss: "mark_box", //高亮样式
            autoClass: false,
            textHint: true, //提示文字自动隐藏
            hintText: "请输入邮箱地址"
     });    
}
// 课程详情页
function courseInfo(id){
    var _box = $(id),
        _t = (id == '#course_content') ? 39 : 39,
        _top = _box.offset().top - _t;
    $(window).scrollTop(_top);
  }

function setCourseHandleCurrent(d){
    d.addClass('current').siblings().removeClass('current');
}
// 课程列表
function filterDown(aaa) {
    var con = $(aaa).next();
    var icon = $(aaa).find('.icon_course_down');
    if(con.is(':visible')) {
        con.hide();
        icon.removeClass('icon_course_up');
    } else {
        con.show();
        icon.addClass('icon_course_up');
    }
}
function headSelectCourse(d){}
//更多条件
function filterTextMore(d) {
    if($(d).length === 0){ return; }
    
    var con = $(d).parent().prevAll(".filter_other");
    var bord = $(d).parent().prevAll(".filter_item").eq(3);
    var icon = $(d);
    if(icon.hasClass('up')){
        con.hide();
        icon.removeClass("up");
        bord.addClass("border_none");
    }else{
        con.show();
        icon.addClass("up");
        bord.removeClass("border_none");
    }   
}

function showRadomDiv(){
              var tos =$("#newCurTabs li");
              var total=tos.length;//获得li的总个数
              var showDiv=Math.round(Math.random()*(total));//获得显示li的随机数
              tos.eq(showDiv-1).addClass('current');
              $(".index_new_content").children().eq(showDiv-1).css('display','block');

        } 

      
// 切换改为鼠标移入后执行
function tabs(tabTit, on, tabCon){

    var items = $(tabTit).children();

    items.each(function(){
        var that = $(this),
            con  = $(tabCon).children(),
            link = that.find('a'),
            index = that.index(),
            grade = 5;

        // 此处为动态修改a标签的链接地址，上线时修改php内容后可去掉   
        if(tabTit == '#newCurTabs'){
            if(index >= 0 && index < 6){
                grade = 'xiao' + (index + 1);
            }else if(index >= 6 && index < 9){
                grade = 'chu' + (index - 5);
            }else if(index >= 8 && index < 12){
                grade = 'gao' + (index - 8);
            }
            link.attr({'href' : 'http://' + xue.host + '/' + grade, 'target' : '_blank'});                 
        // }else if(tabTit == '#newTeacherTabs'){
        //     if(index == 0){
        //         grade = '';
        //     }
        }
        // 修改a标签的href地址结束

        // 改为鼠标移入后切换
        that.on('mouseenter', function(){
            that.addClass(on).siblings().removeClass(on);
            con.eq(index).show().siblings().hide();
        }); 
    });

} 


$(function(){
    tabs("#newCurTabs", "current", ".index_new_content");
    tabs("#openCourseTabs", "current", ".open_course_content");
    tabs("#newTeacherTabs", "current", ".teacher_new_content");
    tabs(".tabs_trends", "current", ".side_tab_body");
    tabs("#learningClassTabs", "current", ".learning_class_content");
    //tabs("#zt_sub", "current", "#zt_cou_list");
    showRadomDiv();
    mailAutoName();//执行邮箱后缀提示
    //课程详情页
    $('.tabs_title_item li').click(function(){
        var _id = $(this).attr('con');
        if(_id){
            setCourseHandleCurrent($(this));
            courseInfo('#' + _id);
        }
    });

    //课程列表
    $('.filter_down').click(function(){
        filterDown(this);
    });
    // 点击空白处，隐藏课程筛选下拉框
    $(document).on('click', function(e){
        var p = $(e.target).parents('.filter_handle');
        if(p.length === 0){
            var con = $('.filter_handle .filter_handle_items');
            var icon = $('.filter_handle .icon_course_down');
            if(con.is(':visible')) {
                con.hide();
                icon.removeClass('icon_course_up');
            }
        }
    });
 
    
    //更多条件
    // $('.filter_more p').click(function(){
    //     filterTextMore(this);    

    //  });

    // xue.use('userAutoComplete', function(){
    //     if (!xue.userAutoComplete.opt.isLoad) {
    //         userAutoCompleteOnload();

    //          var _config = {
    //             id: 'xes_autoTips',
    //             itemCls: 'item',
    //             curCls: 'cur',
    //             curBg: '#FFD4D7',
    //             tips: '请选择邮箱类型',
    //             userCls: '#username',
    //             passCls: '#password',
    //             subCls: '#loginsubmit',
    //             formCls: '#form_indexlogin'
    //         };
    //         var _autoComplete = xue.userAutoComplete;
    //         _autoComplete.ready(_config);
    //         _autoComplete.opt.isLoad = true;   
    //     }
    // });

    // 签到
    function showAlert(dom){
        var _day =dom.data('day'),
            _gold= dom.data('gold'),
            _nextgold= dom.data('ngold'),
            _nextdays=dom.data('ndays');
        // 成功后的提一条提示：奖励10金币
        tpl = '<p>今日签到成功！获得<strong>10</strong>金币</p>'; 
        // alert(tpl);
        // 当额外奖励 > 0时出现下面的第二条信息
        if(Number(_nextgold) > 0){
            tpl += '<p>再连续签到<strong>'+ _nextdays +'</strong>天可额外获得<strong>'+_nextgold+'</strong>金币！</p>';
        // }else if(Number(_gold) > 0){
        }else{
            tpl += '<p>连续签到<strong>'+ _day +'</strong>天，额外获得<strong>'+_gold+'</strong>金币！</p>';
        }
        $('.classcard').addClass('classdisable finish');
        xue.win({
            id: 'signTips',
            cls: 'signTips',
            title: false,
            cancel: false,
            submit: false,
            arrow: 'tc',
            close: false,
            lock: false,
            follow: dom,
            // time: 2500,
            content: tpl
        });
        // 设置弹窗定位   
        xue.win('signTips').position(0, dom.offset().top + dom.height() + 10);
        var _tips = $('#xuebox_signTips');
        _tips.css('position', 'absolute');
        var tipsOut = setTimeout(function(){
            _tips.fadeOut(100,function(){
                xue.win('signTips').close();
                tipsOut = null;
            });
        }, 2000);
    }

    $('.classcard:not(.classdisable)').on({
        mouseover: function(){
            $(this).addClass('hoverclass');
        },
        mouseout: function(){
            $(this).removeClass('hoverclass');
        },
        click: function(){
            // 声明模板
            var tpl, that = $(this);
            if($(this).hasClass('classdisable')){return false;}
                var url = 'http://' + xue.host + '/LearningCenter/signInAjax';
                // var url = 'http://v04.xesui.com/source/json/sign.json';
                $.ajax(url, {
                    type:'post',
                    dataType: 'json',
                    timeout : 7000,
                    error: function(){
                        alert('Date Error!');
                    },
                    success: function(d){
                        var singAlert = xue.ajaxCheck.json(d);
                        if(singAlert){
                            // 给“签到”标签增加data数据内容
                            that.data({
                                day : singAlert.days,       // 连续天数，有可能是0
                                gold: singAlert.gold,       // 额外奖励金币，有可能是0
                                ngold: singAlert.nextGold,  //下次额外奖励的金币数
                                ndays: singAlert.nextDays   //距离下次额外奖励的天数
                            });
                            // 执行弹出提示效果
                            showAlert(that);
                        }
                    }
                }); 
        }
    });
    $('#container').on('mouseenter', '.classcard.classdisable', function(){
        var that = $(this);
        showAlert(that);
    });
//新鲜事整区域增加链接
    var a = $('.hover_feed_item');
    a.on('mouseover', function(){
        $(this).addClass('hover_feed');
    });
    a.on('mouseout', function(){
        $(this).removeClass('hover_feed');
    });
    a.off('click').on('click', function(event){
        var t = $(event.target);
        if(t.attr('href')){
            return;
        }else{
            var b = $(this).find('.feed_bar a');
            window.open(b.attr('href'));
        }
    })
    //文章页评论字数
  $('.article_comments_item').off('keyup', '.comment_textarea textarea').on('keyup', '.comment_textarea textarea', function(){
        var that = $(this);
        xue.use('comment', function(){
            setTimeout(function(){
                xue.comment.countsize(that);
            }, 10);
        });
    });   

    // // 每日五题：首页提示
    // $('#container').off('mouseenter', '.task_fiveQuestions').on('mouseenter', '.task_fiveQuestions', function(){
    //     var that = $(this);
    //     if(that.find('.task_days').length > 0){ return false; }
    //     xue.use('feed', function(){
    //         xue.feed.extend.fiveQuestionTips(that);
    //     });
    // });

    // // 每日五题：首页领奖
    // $('.task_fiveQuestions').off('click', '.task_days_btn').on('click', '.task_days_btn', function(){
    //     var that = this;
    
    //     xue.use('feed', function(){
    //         xue.feed.extend.fiveQuestionSubmit(that);
    //     });
    // });

    // // 每日五题：点击显示功能提示弹层
    // $('.task_fiveQuestions').on('click', function(){
    //     var that = $(this);
    //     if(that.find('.task_days').length === 0){ return false; }
    //     xue.win({
    //         id : 'fiveQuestions',
    //         title : false,
    //         cancel : false,
    //         // width : 531,
    //         // height: 305,
    //         submitVal : '去看看',
    //         padding : '10px 10px 0 10px',
    //         content : '<img src="http://img04.xesimg.com/tips_five.jpg" />',
    //         submit : function(){
    //             window.location.href = '/LearningCenter/dynamic';
    //         }
    //     });
    // });
    $('.list_title_info').on('click', ' ul li:last', function() {//点击最后一个li添加一个类
        $(this).find('.liveCoachInfo').addClass('liveImg');
        
    });
     $('.list_title_info').on('click', ' ul li:first', function() {//点击第一个li添加一个类
        $(this).next().find('.liveCoachInfo').removeClass('liveImg');
    });
   
});


