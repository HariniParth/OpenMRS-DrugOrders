/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.fragment.controller;

import java.util.ArrayList;
import java.util.List;
import org.openmrs.DrugOrder;
import org.openmrs.module.drugorders.drugorders;

/**
 *
 * @author harini-geek
 */
public class ConfirmOrderFragmentController {
    
    public static List<DrugOrder> drugOrderMain = new ArrayList<DrugOrder>();
    public static List<drugorders> drugOrderExtension = new ArrayList<drugorders>();

    public void controller(){
        
    }
    
    public static List<DrugOrder> getDrugOrderMain(){
        return drugOrderMain;
    }
    
    public static List<drugorders> getDrugOrderExtension(){
        return drugOrderExtension;
    }
    
}
