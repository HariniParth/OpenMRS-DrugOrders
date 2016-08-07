<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="createNewPlanWindow">
    <div class="dialog-header">
        <h4 id="text_heading">${ ui.message("Create New Medication Plan") }</h4>
    </div>
    <div class="createMedicationPlanWindow">
        <form method="post">
            <div class="fields"><label>Disease name </label><input id="disease_name" type="text" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" name="disease_name"/></div>
            <br/><br/>
            <p class="fields">Click NEXT to add standard formulations</p>
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlanWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>