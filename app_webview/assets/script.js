function submitChangeColor() {
    var changeColor = document.getElementById('bodyColor');
    changeColor.setAttribute('style', 'background:blue');

    //...send message to Flutter
    MyJSChannel.postMessage('Hello Flutter from JsavaScript');
}

function sendOk(){
    var changeColor = document.getElementById('bodyColor');
    changeColor.setAttribute('style', 'background:black');
}