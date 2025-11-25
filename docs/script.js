let data;

class Image {
    constructor(data) {
        this.type = data["type"];
        this.data = data["data"];
    }
}

class Contact {
    constructor(data) {
        this.name = data["name"];
        this.title = data["title"];
        this.link = data["link"];
        this.image = new Image(data["image"]);
    }
}

class Project {
    constructor(data) {
        this.name = data["name"];
        this.title = data["title"];
        this.description = data["description"];
        this.link = data["link"];
        this.image = new Image(data["image"]);
        this.background = data["background"];
        this.skill_icon = data["skill_icon"];
        this.type = data["type"];
    }
}

class Link {
    constructor(data) {
        this.title = data["title"];
        this.link = data["link"];
    }
}

window.addEventListener("DOMContentLoaded", async function () {
    data = await (await fetch("data.json")).json();

    let loading = document.querySelector(".loading");

    let loadingImage = document.createElement("img");
    loadingImage.className = "loading-image";
    loadingImage.alt = "Загрузка...";
    loadingImage.src = (function () {
        switch (Math.floor(Math.random() * 3)) {
            case 0:
                return "assets/images/loading/ppCircle.webp";
            default:
                return "assets/images/loading/ppHop.webp";
        }
    })();
    loading.appendChild(loadingImage);

    let headerContentVersion = document.querySelector(".header-content-version");
    headerContentVersion.text = data.version;

    [".section-contacts"].forEach(category => {
        data[category].forEach(contact_data => {
            let section = document.querySelector(category);
            let contact = new Contact(contact_data);

            let contactsItem = document.createElement("a");
            contactsItem.className = ["contacts-item", contact.name].join(" ").trimEnd();
            contactsItem.title = contact.title;
            contactsItem.href = contact.link;
            contactsItem.target = "_blank";
            section.appendChild(contactsItem);

            let contactsItemImage = document.createElement("object");
            contactsItemImage.className = ["contacts-item-image", contact.name].join(" ").trimEnd();
            contactsItemImage.type = contact.image.type;
            contactsItemImage.data = contact.image.data;
            contactsItem.appendChild(contactsItemImage);
        });
    });

    [".section-projects", ".section-archives", ".section-forks"].forEach(category => {
        data[category].forEach(project_data => {
            let section = document.querySelector(category);
            let project = new Project(project_data);

            let projectsItem = document.createElement("a");
            projectsItem.className = ["projects-item", project.name, project.type].join(" ").trimEnd();
            projectsItem.href = project.link;
            projectsItem.target = "_blank";
            projectsItem.style.backgroundImage = "url(" + project.background + ")";
            section.appendChild(projectsItem);

            let projectsItemTop = document.createElement("div");
            projectsItemTop.className = ["projects-item-top", project.name].join(" ");
            projectsItem.appendChild(projectsItemTop);

            let projectsItemTopTitle = document.createElement("div");
            projectsItemTopTitle.className = ["projects-item-top-title", project.name].join(" ");
            projectsItemTop.appendChild(projectsItemTopTitle);

            let projectsItemTopTitleImage = document.createElement("object");
            projectsItemTopTitleImage.className = ["projects-item-top-title-image", project.name].join(" ");
            projectsItemTopTitleImage.type = project.image.type;
            projectsItemTopTitleImage.data = project.image.data;
            projectsItemTopTitle.appendChild(projectsItemTopTitleImage);

            let projectsItemTopTitleText = document.createElement("h3");
            projectsItemTopTitleText.className = ["projects-item-top-title-text", project.name].join(" ");
            projectsItemTopTitleText.textContent = project.title;
            projectsItemTopTitle.appendChild(projectsItemTopTitleText);

            let projectsItemTopSkillIcon = document.createElement("object");
            projectsItemTopSkillIcon.className = ["projects-item-top-skill-icon", project.name].join(" ");
            projectsItemTopSkillIcon.type = "image/svg+xml";
            projectsItemTopSkillIcon.data = `assets/images/skill_icons/${project.skill_icon}.svg`;
            projectsItemTop.appendChild(projectsItemTopSkillIcon);

            let projectsItemDescriptionText = document.createElement("p");
            projectsItemDescriptionText.className = ["projects-item-description", project.name].join(" ");
            projectsItemDescriptionText.textContent = project.description;
            projectsItem.appendChild(projectsItemDescriptionText);
        });
    });

    for (let [id, section] of Object.entries({
        "projects": ".section-projects", "forks": ".section-forks", "archives": ".section-archives",
    })) {
        let sectionHeader = document.getElementById(id)
        sectionHeader.textContent += ` (${data[section].length})`
    }

    for (let [selector, text] of Object.entries(data.confirm)) {
        document.querySelectorAll(selector).forEach(project => {
            return project.onclick = function () {
                return confirm(text);
            };
        });
    }

    data["footer"].forEach(link_data => {
        let footer = document.querySelector("footer");
        let link = new Link(link_data);

        let footerLink = document.createElement("a");
        footerLink.className = "footer-link resizable-link";
        footerLink.href = link.link;
        footerLink.target = "_blank";
        footerLink.text = link.title;
        footer.appendChild(footerLink);
    });
});

window.addEventListener("load", async function () {
    let loading = document.querySelector(".loading");
    loading.style.pointerEvents = "none";
    loading.style.opacity = "0";

    let header = document.querySelector("header");
    let headerPadding = document.querySelector(".header-padding");
    headerPadding.style.marginTop = `${header.clientHeight}px`;

    for (let key of Object.keys(data["alert"])) {
        setTimeout(function () {
            try {
                (function (res) {
                    (res !== undefined) ? alert(res) : null;
                })(data["alert"][key][new URLSearchParams(document.location.search).get(key)]);
            } catch (e) {
                console.warn(e);
            }
        }, 800);
    }
});
