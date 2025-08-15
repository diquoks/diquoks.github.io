let data, loadingImageValues;
data = fetch("data.json");
loadingImageValues = function () {
    let min = 1, max = 3;
    return [Math.floor(Math.random() * (max - min + 1)) + min, max];
}();

window.addEventListener("DOMContentLoaded", async function () {
    data = await (await data).json();
    let loading, loadingImage, headerContentVersion;
    loading = document.querySelector(".loading");
    loadingImage = document.createElement("img");
    headerContentVersion = document.querySelector(".header-content-version");

    loadingImage.className = "loading-image";
    loadingImage.alt = "Загрузка...";
    loadingImage.src = (function () {
        switch (loadingImageValues[0]) {
            case loadingImageValues[1]:
                return "assets/images/loading/ppCircle.webp";
            default:
                return "assets/images/loading/ppHop.webp";
        }
    })();
    loading.appendChild(loadingImage);

    headerContentVersion.text = data["version"];

    ["projects", "forks"].forEach((category) => {
        data[category].forEach((project) => {
            let projectsItems, projectsItemsUnit, projectsItemsUnitTitle, projectsItemsUnitTitleImage, projectsItemsUnitTitleText, projectsItemsUnitDescriptionText;
            projectsItems = document.getElementById(category);

            projectsItemsUnit = document.createElement("a");
            projectsItemsUnit.className = ["projects-items-unit", project["name"], project["repository"]].join(" ").trimEnd();
            projectsItemsUnit.href = project["link"];
            projectsItemsUnit.target = "_blank";
            projectsItems.appendChild(projectsItemsUnit);

            projectsItemsUnitTitle = document.createElement("div");
            projectsItemsUnitTitle.className = ["projects-items-unit-title", project["name"]].join(" ");
            projectsItemsUnit.appendChild(projectsItemsUnitTitle);

            projectsItemsUnitTitleImage = document.createElement("object");
            projectsItemsUnitTitleImage.className = ["projects-items-unit-title-image", project["name"]].join(" ");
            projectsItemsUnitTitleImage.type = project["image"]["type"];
            projectsItemsUnitTitleImage.data = project["image"]["data"];
            projectsItemsUnitTitle.appendChild(projectsItemsUnitTitleImage);

            projectsItemsUnitTitleText = document.createElement("h3");
            projectsItemsUnitTitleText.className = ["projects-items-unit-title-text", project["name"]].join(" ");
            projectsItemsUnitTitleText.textContent = project["title"];
            projectsItemsUnitTitle.appendChild(projectsItemsUnitTitleText);

            projectsItemsUnitDescriptionText = document.createElement("p");
            projectsItemsUnitDescriptionText.className = ["projects-items-unit-description", project["name"]].join(" ");
            projectsItemsUnitDescriptionText.textContent = project["description"];
            projectsItemsUnit.appendChild(projectsItemsUnitDescriptionText);
        });
    });

    for (let type in data["confirm"]["class"]) {
        document.querySelectorAll(type).forEach(repository => repository.onclick = function () {
            return confirm(data["confirm"]["class"][type]);
        });
    }

    data["footer"].forEach((link) => {
        let footer, footerLink;
        footer = document.querySelector("footer");

        footerLink = document.createElement("a");
        footerLink.className = "footer-link resizable-link";
        footerLink.href = link["link"];
        footerLink.target = "_blank";
        footerLink.text = link["text"];
        footer.appendChild(footerLink);
    });
});

window.addEventListener("load", async function () {
    let loading, header, headerPadding;
    loading = document.querySelector(".loading");
    header = document.querySelector("header");
    headerPadding = document.querySelector(".header-padding");

    loading.style.cssText = "pointer-events: none; opacity: 0;";

    headerPadding.style.cssText = `margin-top: ${header.clientHeight}px;`;

    setTimeout(function () {
        try {
            (function (res) {
                (res !== undefined) ? alert(res) : null;
            })(data["alert"]["from"][new URLSearchParams(document.location.search).get("from")]);
        } catch (e) {
            console.warn(e);
        }
    }, 700);
});
