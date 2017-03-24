/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 * 
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */
/*global define: false */

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem, c ) {
    return elem.classList.contains( c );
  };
  addClass = function( elem, c ) {
    elem.classList.add( c );
  };
  removeClass = function( elem, c ) {
    elem.classList.remove( c );
  };
}
else {
  hasClass = function( elem, c ) {
    return classReg( c ).test( elem.className );
  };
  addClass = function( elem, c ) {
    if ( !hasClass( elem, c ) ) {
      elem.className = elem.className + ' ' + c;
    }
  };
  removeClass = function( elem, c ) {
    elem.className = elem.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem, c ) {
  var fn = hasClass( elem, c ) ? removeClass : addClass;
  fn( elem, c );
}

var classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

// transport
if ( typeof define === 'function' && define.amd ) {
  // AMD
  define( classie );
} else {
  // browser global
  window.classie = classie;
}

})( window );


function $(id) {
    return typeof id==='string'?document.getElementById(id):id;
}
window.onload=function(){
    var index=0;
    var timer=null;
    var pic=$("pic").getElementsByTagName("li");
    var num=$("num").getElementsByTagName("li");
    var flash=$("flash");
    var left=$("left");
    var right=$("right");
    //单击左箭头
    left.onclick=function()
    {
        index--;
        if (index<0)
        {index=num.length-1};
        changeOption(index);
    }
    //单击右箭头
    right.onclick=function(){
        index++;
        if (index>=num.length) {index=0};
        changeOption(index);
    }
    //鼠标划在窗口上面，停止计时器
    flash.onmouseover=function(){
        clearInterval(timer);
    }
    //鼠标离开窗口，开启计时器
    flash.onmouseout=function()
    {
        timer=setInterval(run,2000)
    }
    //鼠标划在页签上面，停止计时器，手动切换
    for(var i=0;i<num.length;i++)
    {
        num[i].id=i;
        num[i].onmouseover=function()
        {
            clearInterval(timer);
            changeOption(this.id);
        }
    }
    //定义计时器
    timer=setInterval(run,2000)
    //封装函数run
    function run(){
        index++;
        if (index>=num.length) {index=0};
        changeOption(index);
    }
    //封装函数changeOption
    function changeOption(curindex)
    {
        //console.log(index);
        for(var j=0;j<num.length;j++){
            pic[j].style.display="none";
            num[j].className="";
        }
        pic[curindex].style.display="block";
        num[curindex].className="active";
        index=curindex;
    }
}