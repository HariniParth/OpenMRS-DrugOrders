/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api.db;

import java.util.List;
import org.openmrs.module.drugorders.drugordersgroups;

/**
 *
 * @author harini-geek
 */
public interface drugordersgroupsDAO {
    
    public List<drugordersgroups> getDrugOrdersByGroupID(Integer id);
    
}
