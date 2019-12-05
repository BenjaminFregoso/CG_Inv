
//************************************
//Funciones para subir las fotos de los articulos en el catálogo de artículos
//************************************
function onUploadControlFileUploadComplete(s, e) {
    if (e.isValid)
        document.getElementById("uploadedImage").src = "../Archivos/Fotos/" + e.callbackData;
    setElementVisible("uploadedImage", e.isValid);
}
function onImageLoad() {
    var externalDropZone = document.getElementById("externalDropZone");
    var uploadedImage = document.getElementById("uploadedImage");
    uploadedImage.style.width = "100%";
    setElementVisible("dragZone", false);
}
function setElementVisible(elementId, visible) {
    document.getElementById(elementId).className = visible ? "" : "hidden";
}


////************************************
////Funciones para actualizar los combobox en cascada de la orden de compra
////************************************

//var curentEditingIndex;
//var lastPAIS = null;
//var lastCmb = null;
//var isCustomCascadingCallback = false;
//var isCustomCascadingCallbackTallas = false;


//function OnSelectedIndexChanged(s, e) {
//    lastPAIS = s.GetValue();
//    isCustomCascadingCallback = true;
//    isCustomCascadingCallbackTallas = true;
//    alert("OnSelectedIndexChanged");
//    RefreshDataColor(lastPAIS);
//    RefreshDataTallas(lastPAIS);
//}
//function ColorCombo_EndCallback(s, e) {
//    alert("ColorCombo_EndCallback")
//    if (isCustomCascadingCallback) {
//        if (s.GetItemCount() > 0)
//            ASPxGridView2.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_color", s.GetItem(0).text);
//        isCustomCascadingCallback = false;
//    }
//    else {
//        ASPxGridView2.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_color").index);
//    }
//}
//function TallasCombo_EndCallback(s, e) {
//    if (isCustomCascadingCallbackTallas) {
//        if (s.GetItemCount() > 0)
//            ASPxGridView2.batchEditApi.SetCellValue(curentEditingIndex, "fkey_articulos_tallas", s.GetItem(0).text);
//        isCustomCascadingCallbackTallas = false;
//    }
//    else {
//        ASPxGridView2.batchEditApi.StartEdit(curentEditingIndex, grdCliente.GetColumnByField("fkey_articulos_tallas").index);
//    }
//}

//function OnBatchEditStartEditing(s, e) {
//    curentEditingIndex = e.visibleIndex;
//    var currentPAIS = grdCliente.batchEditApi.GetCellValue(curentEditingIndex, "fkey_articulo");
//    alert("OnBatchEditStartEditing currentPAIS=" + currentPAIS + "  lasPAIS=" + lastPAIS + " lastCmb=" + lastCmb);
//    if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_tallas") && e.focusedColumn.fieldName == "fkey_articulos_color" && currentPAIS != null) {
//        e.cancel = true;
//        lastPAIS = currentPAIS;
//        alert("envia articulo para refresh color =" + currentPAIS);
//        lastCmb = "fkey_articulos_color";
//        RefreshDataColor(currentPAIS);
//    }
//    if ((currentPAIS != lastPAIS || lastCmb == "fkey_articulos_color") && e.focusedColumn.fieldName == "fkey_articulos_tallas" && currentPAIS != null) {
//        e.cancel = true;
//        lastPAIS = currentPAIS;
//        lastCmb = "fkey_articulos_tallas";
//        RefreshDataTallas(currentPAIS);
//    }
//}
//function RefreshDataColor(currentPAIS) {
//    alert("RefreshDataColor fkey_articulo=" + currentPAIS);
//    ASPxGridView2.GetEditor("fkey_articulos_color").PerformCallback(currentPAIS);
//    alert("Ya ejecutó RefreshDataColor" );
//}
//function RefreshDataTallas(currentPAIS) {
//    ASPxGridView2.GetEditor("fkey_articulos_tallas").PerformCallback(currentPAIS);
//}

