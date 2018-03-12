$(function(){
	//固定导航三角背景旋转动画
	$('.fixedNavList>li>a').on('click',function(){
		$(this).children('.navJt').toggleClass('JtActive');
		$(this).next('.sNavList').slideToggle();
	});
	//二级菜单焦点状态
	$('.sNavList>li').on('click',function(){
		$(this).addClass('sNavActive').siblings().removeClass('sNavActive')
	});
	//模拟下拉框
	$('.seleCon').on('click',function(event){
		$(this).next('.seleDownBox').slideToggle(300);
		  event.stopPropagation();
	});
	$('.seleList>li').on('click',function(){
		var liCon = $(this).text();
		$(this).children('.seleDownBox').slideUp(300);
		$(this).parents('.seleBox').find('.seleInp').val(liCon);
	});
	$(document).click(function(){
    	$(".seleDownBox").slideUp(300);
	});
})


