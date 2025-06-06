window.addEventListener("DOMContentLoaded", function () {
    let loading_image = document.querySelector(".loading-image");
    loading_image.src = (function () {
        let min = 1, max = 4;
        switch (Math.floor(Math.random() * (max - min + 1)) + min) {
            case max:
                return "assets/images/loading/ppCircle.webp";
            default:
                return "assets/images/loading/ppHop.webp";
        }
    })()
});

window.addEventListener("load", function () {
    let header = document.querySelector("header");
    let header_padding = document.querySelector(".header-padding");
    header_padding.style.cssText = `margin-top: ${header.clientHeight}px;`;
    let loading = document.querySelector(".loading");
    loading.style.cssText = "pointer-events: none; opacity: 0;";
    try {
        let d = fetch("strings.json").then(response => response.json()).then(response => response["alert"][new URLSearchParams(document.location.search).get("from")]);
        d.then(d => (d !== undefined) ? alert(d) : null);
    } catch (e) {
        console.error(e);
    }
});
