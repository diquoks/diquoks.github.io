let data = fetch("data.json");
let loadingImageValues = function () {
    let min = 1, max = 3;
    return [Math.floor(Math.random() * (max - min + 1)) + min, max];
}();

window.addEventListener("DOMContentLoaded", async function () {
    data = await (await data).json();
    let loadingParent = document.querySelector(".loading");
    let headerContentVersion = document.querySelector(".header-content-version");
    for (let type in data["confirm"]["class"]) {
        document.querySelectorAll(type).forEach(repository => repository.onclick = function () {
            return confirm(data["confirm"]["class"][type]);
        })
    }
    headerContentVersion.textContent = data["version"];
    let loadingImage = document.createElement("img");
    loadingImage.className = "loading-image";
    loadingImage.src = (function () {
        switch (loadingImageValues[0]) {
            case loadingImageValues[1]:
                return "assets/images/loading/ppCircle.webp";
            default:
                return "assets/images/loading/ppHop.webp";
        }
    })()
    loadingImage.alt = "Загрузка...";
    loadingParent.appendChild(loadingImage);
});

window.addEventListener("load", async function () {
    let loading = document.querySelector(".loading");
    let header = document.querySelector("header");
    let headerPadding = document.querySelector(".header-padding");
    headerPadding.style.cssText = `margin-top: ${header.clientHeight}px;`;
    loading.style.cssText = "pointer-events: none; opacity: 0;";
    setTimeout(
        function () {
            try {
                (function (res) {
                    (res !== undefined) ? alert(res) : null
                })(data["alert"]["from"][new URLSearchParams(document.location.search).get("from")]);
            } catch (e) {
                console.warn(e);
            }
        },
        800
    )
});
