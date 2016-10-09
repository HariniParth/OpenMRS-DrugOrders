<%
    ui.includeCss("drugorders", "drugorders.css")
%>

<div id="singleOrderDetailsWindow">
    
    <form method="post">

        <div class="dialog-header">
            <span id="text_heading"><h4 name="action" id="orderType"></h4></span>
        </div>
              
        <br/>
        <span id="asterisk">Fields marked with asterisk (*) are required</span><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Drug name <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="drugNameEntered" oninput="autoCompleteDrug('${drugsNames}','${allergicDrugs}')" name="drugNameEntered" />
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Start Date <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDateEntered', label: '', formFieldName: 'startDateEntered', useTime: '', defaultDate: startDate ]) }
            </div>
        </div>

        <br/><br/><br/>
        
        <div id="allergicDrugOrderReasonField">
            <div class="fields" id="view_order_detail">
                <label>Note: The patient is allergic to this drug</label>
                <label>Enter the reasons for ordering this drug</label>
                <input type="textarea" id="allergicOrderReason" name="allergicOrderReason"/>
            </div>
            <br/><br/>
        </div>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="drugRoute" name="drugRoute">
                    <option value="">Choose option</option>
                    <% routes.each { route -> %>
                        <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="drugDose" name="drugDose"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="drugDoseUnits" name="drugDoseUnits">
                    <option value="">Choose option</option>
                    <% doses.each { dose -> %>
                        <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="drugQuantity" name="drugQuantity"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Qnty units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="quantityUnits" name="quantityUnits">
                    <option value="">Choose option</option>
                    <% quantities.each { quantity -> %>
                        <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="number" id="drugDuration" name="drugDuration"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Durn units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="durationUnits" name="durationUnits">
                    <option value="">Choose option</option>
                    <% durations.each { duration -> %>
                        <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Frequency <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="drugFrequency" name="drugFrequency">
                    <option value="">Choose option</option>
                    <% frequencies.each { frequency -> %>
                        <option value="${ frequency.getConcept().getDisplayString() }">${ frequency.getConcept().getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Diagnosis <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="associatedDiagnosis" name="associatedDiagnosis" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Priority <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="orderPriority" name="orderPriority">
                    <% priorities.each { priority -> %>
                        <option value="${ priority.getDisplayString() }">${ priority.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Refills </label>
            </div>
            <div id="order_value">
                <input type="number" id="refill" name="refill" value="0">
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Interval (days)</label>
            </div>
            <div id="order_value">
                <input type="number" id="refillInterval" name="refillInterval" value="0">
            </div>
        </div>
        
        <br/><br/><br/>
        
        <div class="fields" id="view_order_detail">
            <label>Instructions from the Physician for -</label>
        </div>  
            
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="patientInstructions" name="patientInstructions"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="50" id="pharmacistInstructions" name="pharmacistInstructions"/>
            </div>
        </div>

        <br/><br/><br/>
        
        <input type="hidden" id="orderClass" name="orderClass" />
        <input type="hidden" id="orderAction" name="action" />
        <input type="hidden" id="order_id" name="order_id" />
        
        <button class="confirm right" id="btn-place" type="submit" onclick="showConfirmOrderWindow()">${ ui.message("Save") }</button>
        <button class="cancel" id="btn-place" type="button" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>

    </form>
</div>


<script type="text/javascript">
    jq( function() {
        jq( "#drugNameEntered" ).autocomplete({
            source: function( request, response ) {
                var results = [];
                jq.getJSON('${ ui.actionLink("getDrugNameSuggestions") }',
                    {
                      'query': request.term, 
                    })
                .success(function(data) {
                    for (index in data) {
                        var item = data[index];
                        results.push(item.name);
                        }
                    response( results );
                })
                .error(function(xhr, status, err) {
                    alert('AJAX error ' + err);
                });
            }
        } ),
      
      jq( "#associatedDiagnosis" ).autocomplete({
        source: function( request, response ) {
          var results = [];
          jq.getJSON('${ ui.actionLink("getDiseaseNameSuggestions") }',
              {
                'query': request.term, 
              })
          .success(function(data) {
              for (index in data) {
                  var item = data[index];
                  results.push(item.name);
                  }
              response( results );
          })
         .error(function(xhr, status, err) {
              alert('AJAX error ' + err);
          });
        }
      } )
  });
</script>