let data = fetch("data.json");

window.addEventListener("DOMContentLoaded", async function () {
    data = await (await data).json();
    let loadingImage = document.querySelector(".loading-image");
    let headerContentVersion = document.querySelector(".header-content-version");
    document.querySelectorAll(".private-repository").forEach(privateRepository => privateRepository.onclick = function () {
        return confirm(data["confirm"]["private-repository"]);
    });
    loadingImage.src = (function () {
        let min = 1, max = 4;
        switch (Math.floor(Math.random() * (max - min + 1)) + min) {
            case max:
                return "assets/images/loading/ppCircle.webp";
            default:
                return "assets/images/loading/ppHop.webp";
        }
    })()
    headerContentVersion.textContent = data["version"];
});

window.addEventListener("load", async function () {
    let loading = document.querySelector(".loading");
    let header = document.querySelector("header");
    let headerPadding = document.querySelector(".header-padding");
    headerPadding.style.cssText = `margin-top: ${header.clientHeight}px;`;
    loading.style.cssText = "pointer-events: none; opacity: 0;";
    try {
        (function (res) {
            (res !== undefined) ? alert(res) : null
        })(data["alert"][new URLSearchParams(document.location.search).get("from")]);
    } catch (e) {
        console.warn(e);
    }
});
