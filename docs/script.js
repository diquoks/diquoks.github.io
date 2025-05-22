window.addEventListener("load", function () {
    let loading = document.getElementsByClassName("loading")[0];
    loading.style.pointerEvents = "none";
    loading.style.opacity = "0";
    try {
        let d = fetch("strings.json").then(response => response.json()).then(response => response["alert"][new URLSearchParams(document.location.search).get("from")]);
        d.then(d => (d !== undefined) ? alert(d) : null);
    } catch (e) {
        console.error(e);
    }
});