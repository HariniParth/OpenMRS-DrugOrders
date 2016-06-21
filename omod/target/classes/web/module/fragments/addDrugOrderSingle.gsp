<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderWindow">
    <div class="dialog-header">
        <h3 id="text_heading">${ ui.message("Create Individual Drug Order") }</h3>
    </div>
    <div class="addSingleOrderWindow">
        <form method="post">
            <div class="fields"><label>Drug name </label><input id="drugname" type="text" name="drugname"/></div>
            <div class="fields">${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDate', label: 'Start Date ', formFieldName: 'startDate', useTime: '']) }</div>            
            <button class="confirm right" id="btn-place" name="confirmDrug" type="submit" onclick="showIndividualOrderDetailsWindow()">${ ui.message("Next") }</button>
            <button class="cancel" id="btn-place" onclick="hideIndividualDrugOrderWindow()">${ ui.message("Cancel") }</button>
        </form>
    </div>
</div>

