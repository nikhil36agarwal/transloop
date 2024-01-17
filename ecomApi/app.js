document.getElementById('reminder').onclick=function(){
    var url=window.location.href
    var useragent=navigator.userAgent
    var price= document.getElementById('price').textContent
    document.getElementById('url').innerHTML = price + '<br>' + url + '<br>' + useragent
    var apiData = {
        "url": url,
       "userAgent": useragent,
        "price":price
    }
    console.log(apiData)
    var jsonString = JSON.stringify(apiData);
    console.log(jsonString)
   
    var xhr = new XMLHttpRequest();
    console.log(xhr)
    xhr.open("POST", "http://127.0.0.1:5000/jsoncat", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify(apiData));
}