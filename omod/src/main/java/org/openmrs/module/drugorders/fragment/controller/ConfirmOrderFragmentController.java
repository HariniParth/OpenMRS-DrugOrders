/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.HashMap;
import org.openmrs.DrugOrder;
import org.openmrs.module.drugorders.drugorders;
import org.openmrs.ui.framework.page.PageModel;

/**
 *
 * @author harini-geek
 */
public class ConfirmOrderFragmentController {
    
    public static int currentDraftOrderIndex;
    public static HashMap<Integer,DrugOrder> drugOrderMain = new HashMap<Integer,DrugOrder> ();
    public static HashMap<Integer,drugorders>  drugOrderExtension = new HashMap<Integer,drugorders>();

    public void controller(PageModel model){
        
    }
    
    public static int getCurrentDraftOrderIndex(){
        return currentDraftOrderIndex;
    }
    
    public static void setCurrentDraftOrderIndex(int currentDraftOrderIndex){
        ConfirmOrderFragmentController.currentDraftOrderIndex = currentDraftOrderIndex;
    }
    
    public static HashMap<Integer,DrugOrder> getDrugOrderMain(){
        return drugOrderMain;
    }
    
    public static HashMap<Integer,drugorders> getDrugOrderExtension(){
        return drugOrderExtension;
    }
    
}
