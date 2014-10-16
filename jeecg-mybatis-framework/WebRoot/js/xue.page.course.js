/**
 * XESUI 
 * Copyright 2013 xueersi.com All rights reserved.
 *
 * @description 
 *
 * @author Marco (marco@xesui.com)
 * @modify 2013-07-14 09:53:41
 * @version $Id$
 * 
 * @links http://xesui.com
 */


/**
 * @name xue.page.course.js
 * @description 听课页交互
 * 
 * @module 
 * @submodule 
 * @main 
 * @class 
 * @constructor 
 * @static 
 */
$(function(){
    
    var briefTab = $('.list_title_info li');
    var briefBox = $('.scrolls_item');

    // 滚动条用的
    // var outline = { 0 : null, 1 : null };

    // 大概切换效果
    xue.briefToggle = function(index){
        var index = index || 1;
        $('#outline'+index).removeClass('hidden').siblings('.scrolls_item').addClass('hidden');
        briefTab.eq(index-1).addClass('current').siblings('li').removeClass('current');
        // briefBox.eq(index).addClass('hidden').siblings('.scrolls_item').removeClass('hidden');
        // 切换大纲的时候需要重新计算下隐藏部分的高度
        $('#outline1').jScrollPane();
        $('#outline2').jScrollPane();
        // if($('#outline2').length > 0){
        //     var n = index == 0 ? 1 : 0;
        //     // if(!outline[n]){
        //         //outline[index] = new xue.course.outline('outline' + (n+1));
        //     // }  
        // }
      // if (xue.isIE6) {
         //xue.ie6.png();
      //   }
     }
    // 大纲头部绑定切换效果
    briefTab.off('click', 'a').on('click', 'a', function(){
        var _tab = $(this).parent('li'), 
            _index = briefTab.index(_tab[0]);
           // xue.log(_index+1);
        xue.briefToggle(_index+1);
    });
    // 当前讲点击时的大纲切换
    $('.scrolls_con_list').off('click', 'li').on('click', 'li', function(){
        if($(this).hasClass('current')){
            var _this = $(this).parents('.scrolls_item')[0];
            var _eq = briefBox.index(_this);
            xue.briefToggle(_eq);
        }
    });


    // xue.use('course', function(){
    //     // 只计算显示出来的，隐藏的部分在切换大纲时再计算
    //     //var li = $('.list_title_info li.current'), m = li.index();     
    //     //var oid = m == 0 ? 2 : 1;
    //     //outline[m] = new xue.course.outline('outline' + oid);
    // });

    var course_tab = $('#course_tab');
    if(course_tab.length > 0){
        xue.tabs('course_tab', function(d){
            var index = $(d).index();
            var box = $('#course_info_box .course_detail');
            box.hide()
            box.eq(index).show();
            box.eq(index).find('textarea').trigger('focus');
        });
    }

});

