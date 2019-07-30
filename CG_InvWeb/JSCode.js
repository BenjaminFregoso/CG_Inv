function onUploadControlFileUploadComplete(s, e) {
    if (e.isValid)
        document.getElementById("uploadedImage").src = "../Archivos/Fotos/" + e.callbackData;
    setElementVisible("uploadedImage", e.isValid);
}
function onImageLoad() {
    var externalDropZone = document.getElementById("externalDropZone");
    var uploadedImage = document.getElementById("uploadedImage");
    uploadedImage.style.left = (externalDropZone.clientWidth - uploadedImage.width) / 2 + "px";
    uploadedImage.style.top = (externalDropZone.clientHeight - uploadedImage.height) / 2 + "px";
    setElementVisible("dragZone", false);
}
function setElementVisible(elementId, visible) {
    document.getElementById(elementId).className = visible ? "" : "hidden";
}