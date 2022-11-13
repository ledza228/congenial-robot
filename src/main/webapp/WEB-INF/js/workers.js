
let workerList;
const currentId = location.pathname.split("/").filter(element => element).at(-1);

async function putRequest(){
    let number = document.getElementById("number").value
    let isHidden = document.getElementById("isHidden").checked
    let owners = getOwnerIds()

    let phone = {
        number: number,
        isHidden: isHidden,
        owners: owners
    }

    await fetch("/api/admin/phone/"+currentId, {
        method: 'PUT',
        body: JSON.stringify(phone),
        headers: {
            'X-CSRF-TOKEN': '${_csrf.token}',
            'Content-Type': 'application/json'
        }
    }).then(r => {
        location.reload()
    }).catch(c => {
        alert("Error while updating!")
    })
}

function getOwnerIds(){
    let owners = []

    let domOwners = document.getElementsByClassName("owner");
    Array.from(domOwners).forEach((el) => {
        owners.push(el.id)
    })
    return owners
}

async function changeSearch(){

    let name = document.getElementsByClassName("search")[0].value.trim()
    console.log(name)
    if (name === "") {
        clearDropDown()
        return
    }

    let workers = await fetchWorkersByName(name)
    workers = filterWorkers(workers)
    workerList = workers;

    clearDropDown()
    addNewDropDown(workers)
}

async function fetchWorkersByName(name){
    let workers;
    workers = await fetch("/api/admin/workers?" + new URLSearchParams({name: name}))
    return await workers.json()
}

function clearDropDown(){
    let dropdown = document.querySelector(".dropdown-menu")

    while (dropdown.childElementCount > 1){
        dropdown.removeChild(dropdown.lastChild)
    }
}

function addNewDropDown(workers){
    let dropdown = document.getElementsByClassName("dropdown-menu")[0]

    workers.forEach(worker => {
        let copy = document.getElementsByClassName("drop-worker-example")[0].cloneNode(true)
        copy.className = "drop-worker dropdown-item";
        copy.style.display="block"
        copy.textContent = worker.name;
        copy.id = worker.id;

        let func = "addToOwners("+worker.id+")"
        copy.setAttribute("onClick", func)

        dropdown.appendChild(copy);
    })
}

function filterWorkers(workers){
    let ids = getOwnerIds()

    workers = workers.filter(worker => !ids.includes(worker.id.toString()))
    return workers
}


function addToOwners(id){
    console.log(id)

    let workerForAdding;
    workerList.forEach(w => {
        if (w.id == id){
            workerForAdding = w;
        }
    })
    console.log(workerForAdding)

    let el = document.getElementsByClassName("example-owner")[0].cloneNode(true)
    el.className = "owner"
    el.id = workerForAdding.id

    el.children[0].textContent = workerForAdding.name
    el.children[1].textContent = workerForAdding.email
    el.children[2].textContent = workerForAdding.position
    el.children[3].textContent = workerForAdding.department
    el.children[4].innerHTML = '<button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick=' +
        'deleteFromOwners(' + workerForAdding.id + ')> <i class="fa fa-trash"></i></button>'
    el.children[4].style.textAlign="center"

    let owners = document.getElementsByClassName("owners")[0].children[0]
    owners.appendChild(el)

    clearDropDown()
}

function deleteFromOwners(id){
    let table = document.getElementsByClassName("owners")[0].children[0]

    Array.from(table.children).forEach(tr => {
        if (tr.id == id){
            table.removeChild(tr)
        }
    })
}


async function createPhone(){
    let number = document.getElementById("number").value
    let isHidden = document.getElementById("isHidden").checked
    let owners = getOwnerIds()

    phone = {
        number: number,
        isHidden: isHidden,
        owners: owners
    }

    await fetch("/api/admin/phone/", {
        method: 'POST',
        body: JSON.stringify(phone),
        headers: {
            'X-CSRF-TOKEN': '${_csrf.token}',
            'Content-Type': 'application/json'
        }
    }).then(r => {
        if (r.status === 200){
            location.reload()
        }
    }).catch(c => {
        alert("Error while creating!")
    })
}