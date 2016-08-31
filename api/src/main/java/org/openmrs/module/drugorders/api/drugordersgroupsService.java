/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders.api;

import java.util.List;
import org.openmrs.api.OpenmrsService;
import org.openmrs.module.drugorders.drugordersgroups;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author harini-geek
 */
@Transactional
public interface drugordersgroupsService extends OpenmrsService {
    
    public int getLastGroupID();
    public List<drugordersgroups> getDrugOrdersByGroupID(Integer id);
    public drugordersgroups saveDrugOrderGroup(drugordersgroups groupItem);
    
}
