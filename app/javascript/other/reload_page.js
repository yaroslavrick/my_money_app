(function(){
    if(!sessionStorage.getItem('firstLoad')){
    sessionStorage['firstLoad'] = true;
    window.location.reload();
}else{
    sessionStorage.removeItem('firstLoad');
}})();
