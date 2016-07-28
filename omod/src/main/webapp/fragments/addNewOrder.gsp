<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Individual Drug Order") }</h3>
    </div>
    <div class="addSingleOrderWindow">
        <form method="post">
            <div class="fields"><label>Drug name </label><input id="drugname" type="text" autocomplete="on" oninput="autoCompleteDrug('${drugsNames}')" name="drugname"/></div>
            <div class="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDate', label: 'Start Date ', formFieldName: 'startDate', useTime: '']) }</div>            
            <button class="confirm right" id="btn-place" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideIndividualDrugOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

<div id="medicationPlanWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Medication Plan Order") }</h3>
    </div>
    <div class="addMedicationPlanWindow">
        <form method="post">
            <div class="fields"><label>Disease name </label><input id="disease_name" type="text" autocomplete="on" oninput="autoCompleteDisease('${diseaseNames}')" name="disease_name"/></div>
            <div class="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'medPlanStartDate', label: 'Start Date ', formFieldName: 'medPlanStartDate', useTime: '']) }</div>            
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showMedicationPlanDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" type="button" onclick="hideMedicationPlanOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>