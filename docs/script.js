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

    headerContentVersion.text = data.version;

    data[".section-contacts"].forEach(contact => {
        let contacts, contactsItem, contactsItemImage;
        contacts = document.querySelector(".section-contacts");

        contactsItem = document.createElement("a");
        contactsItem.className = ["contacts-item", contact.name].join(" ").trimEnd();
        contactsItem.title = contact.title;
        contactsItem.href = contact.link;
        contactsItem.target = "_blank";
        contacts.appendChild(contactsItem);

        contactsItemImage = document.createElement("object");
        contactsItemImage.className = ["contacts-item-image", contact.name].join(" ").trimEnd();
        contactsItemImage.type = contact.image.type;
        contactsItemImage.data = contact.image.data;
        contactsItem.appendChild(contactsItemImage);
    });

    [".section-projects", ".section-archives", ".section-forks"].forEach(category => {
        data[category].forEach(project => {
            let projects, projectsItem, projectsItemTop, projectsItemTopTitle, projectsItemTopTitleImage,
                projectsItemTopTitleText, projectsItemTopSkillIcon, projectsItemDescriptionText;
            projects = document.querySelector(category);

            projectsItem = document.createElement("a");
            projectsItem.className = ["projects-item", project.name, project.type].join(" ").trimEnd();
            projectsItem.href = project.link;
            projectsItem.target = "_blank";
            projectsItem.style.backgroundImage = "url(" + project.background + ")";
            projects.appendChild(projectsItem);

            projectsItemTop = document.createElement("div");
            projectsItemTop.className = ["projects-item-top", project.name].join(" ");
            projectsItem.appendChild(projectsItemTop);

            projectsItemTopTitle = document.createElement("div");
            projectsItemTopTitle.className = ["projects-item-top-title", project.name].join(" ");
            projectsItemTop.appendChild(projectsItemTopTitle);

            projectsItemTopTitleImage = document.createElement("object");
            projectsItemTopTitleImage.className = ["projects-item-top-title-image", project.name].join(" ");
            projectsItemTopTitleImage.type = project.image.type;
            projectsItemTopTitleImage.data = project.image.data;
            projectsItemTopTitle.appendChild(projectsItemTopTitleImage);

            projectsItemTopTitleText = document.createElement("h3");
            projectsItemTopTitleText.className = ["projects-item-top-title-text", project.name].join(" ");
            projectsItemTopTitleText.textContent = project.title;
            projectsItemTopTitle.appendChild(projectsItemTopTitleText);

            projectsItemTopSkillIcon = document.createElement("object");
            projectsItemTopSkillIcon.className = ["projects-item-top-skill-icon", project.name].join(" ");
            projectsItemTopSkillIcon.type = "image/svg+xml";
            projectsItemTopSkillIcon.data = `assets/images/skill_icons/${project.skill_icon}.svg`;
            projectsItemTop.appendChild(projectsItemTopSkillIcon);

            projectsItemDescriptionText = document.createElement("p");
            projectsItemDescriptionText.className = ["projects-item-description", project.name].join(" ");
            projectsItemDescriptionText.textContent = project.description;
            projectsItem.appendChild(projectsItemDescriptionText);
        });
    });

    for (let [id, section] of Object.entries({
        "projects": ".section-projects",
        "forks": ".section-forks",
        "archives": ".section-archives"
    })) {
        let sectionHeader
        sectionHeader = document.getElementById(id)
        sectionHeader.textContent += ` (${data[section].length})`
    }

    for (let [selector, text] of Object.entries(data.confirm.class)) {
        document.querySelectorAll(selector).forEach(project => {
            return project.onclick = function () {
                return confirm(text);
            };
        });
    }

    data["footer"].forEach(link => {
        let footer, footerLink;
        footer = document.querySelector("footer");

        footerLink = document.createElement("a");
        footerLink.className = "footer-link resizable-link";
        footerLink.href = link.link;
        footerLink.target = "_blank";
        footerLink.text = link.title;
        footer.appendChild(footerLink);
    });
});

window.addEventListener("load", async function () {
    let loading, header, headerPadding;
    loading = document.querySelector(".loading");
    header = document.querySelector("header");
    headerPadding = document.querySelector(".header-padding");

    loading.style.pointerEvents = "none";
    loading.style.opacity = "0";

    headerPadding.style.marginTop = `${header.clientHeight}px`;

    setTimeout(function () {
        try {
            (function (res) {
                (res !== undefined) ? alert(res) : null;
            })(data.alert.from[new URLSearchParams(document.location.search).get("from")]);
        } catch (e) {
            console.warn(e);
        }
    }, 800);
});
