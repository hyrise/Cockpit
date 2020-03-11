export default function useDragElement(
  elementId: string,
  draggerId: string
): void {
  let draggableElement = document.getElementById(elementId); // whole element that moves on drag
  let dragger = document.getElementById(draggerId); // area for drag and drop action
  let pos1 = 0,
    pos2 = 0,
    pos3 = 0,
    pos4 = 0;
  if (dragger) {
    // if present, the dragger  is where you move the DIV from:
    dragger.onmousedown = dragMouseDown;
  } else if (draggableElement) {
    // otherwise, move the DIV from anywhere inside the DIV:
    draggableElement.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e: MouseEvent): void {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e: MouseEvent): void {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    if (draggableElement) {
      draggableElement.style.top =
        Math.min(
          Math.max(draggableElement.offsetTop - pos2, 0),
          window.innerHeight - draggableElement.offsetHeight
        ) + "px";
      draggableElement.style.left =
        Math.min(
          Math.max(draggableElement.offsetLeft - pos1, 0),
          window.innerWidth - draggableElement.offsetWidth
        ) + "px";
    }
  }

  function closeDragElement(): void {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
