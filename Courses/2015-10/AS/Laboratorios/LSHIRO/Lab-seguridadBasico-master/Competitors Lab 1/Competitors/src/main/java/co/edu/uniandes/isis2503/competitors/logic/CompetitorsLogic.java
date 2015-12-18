/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniandes.isis2503.competitors.logic;

import co.edu.uniandes.isis2503.competitors.persistence.CompetitorsPersistence;
import co.edu.uniandes.isis2503.competitors.persistence.entity.CompetitorEntity;
import javax.ws.rs.core.Response;

/**
 *
 * @author Jj.alarcon10
 */
public class CompetitorsLogic {
    
    protected CompetitorsPersistence persistance;
    
    
     public CompetitorsLogic() {
        persistance = new CompetitorsPersistence();
    }
    
    public Response getAll() {
        return persistance.getAll();
    }
     
    public Response createCompetitor(CompetitorEntity competitor){
        return persistance.createCompetitor(competitor);
    }
    
     
     
     
     
     
    
}
