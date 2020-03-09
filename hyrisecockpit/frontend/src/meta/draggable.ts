function dragElement(elementId: string, headerId: string) {
  let element = document.getElementById(elementId);
  var pos1 = 0,
    pos2 = 0,
    pos3 = 0,
    pos4 = 0;
  if (document.getElementById(headerId)) {
    // if present, the header is where you move the DIV from:
    document.getElementById(headerId).onmousedown = dragMouseDown;
  } else {
    // otherwise, move the DIV from anywhere inside the DIV:
    element.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    console.log(element.offsetHeight);
    element.style.top =
      Math.min(
        Math.max(element.offsetTop - pos2, 0),
        window.innerHeight - element.offsetHeight
      ) + "px";
    element.style.left =
      Math.min(
        Math.max(element.offsetLeft - pos1, 0),
        window.innerWidth - element.offsetWidth
      ) + "px";
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
