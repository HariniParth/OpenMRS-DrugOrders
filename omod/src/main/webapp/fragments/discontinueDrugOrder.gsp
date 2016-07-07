<div id="showDiscontinueOrderView">
    <form method="post">
        <h4 id="header">${ ui.message("Discontinue Order") }</h4>

        <div class="fields"><label class="col-lg-3">Order ID </label>
            <label id="dis_order_id" value="dis_order_id" class="col-lg-7"></label>
        </div>   

        <label class="fields">Select the reason to discontinue </label>

        <div class="fields">
            <select id="discontinueOrderReasonCoded" name="discontinueOrderReasonCoded">
                <option value="">Choose option</option>
            </select>
        </div>

        <label class="fields">Enter the reason to discontinue </label>
        <input class="fields" type="textarea" maxlength="30" id="discontinueOrderReasonNonCoded" name="discontinueOrderReasonNonCoded"/>

        <button class="confirm right" id="btn-place" name="discontinueOrder" type="submit" onclick="discontinueOrderWindow()">${ ui.message("Discontinue") }</button>
        <button class="cancel " id="btn-place" onclick="hideDiscontinueOrderWindow()">${ ui.message("Close") }</button></div>
    </form>
</div>