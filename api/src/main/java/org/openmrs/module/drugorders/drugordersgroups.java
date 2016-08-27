/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.drugorders;

import java.io.Serializable;
import org.openmrs.BaseOpenmrsObject;

/**
 *
 * @author harini-geek
 */
public class drugordersgroups extends BaseOpenmrsObject implements Serializable {
    
    private Integer id;
    private Integer orderid;
    private Integer groupid;
        
    public drugordersgroups(){
        
    }
    
    @Override
    public Integer getId() {
            return id;
    }

    @Override
    public void setId(Integer id) {
            this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }
}
