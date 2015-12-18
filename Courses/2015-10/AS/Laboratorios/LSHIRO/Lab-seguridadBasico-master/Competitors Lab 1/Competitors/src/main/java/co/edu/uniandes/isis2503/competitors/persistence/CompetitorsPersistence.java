/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.uniandes.isis2503.competitors.persistence;

import co.edu.uniandes.isis2503.competitors.persistence.entity.CompetitorEntity;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.core.Response;

/**
 *
 * @author Jj.alarcon10
 */
public class CompetitorsPersistence {

    protected EntityManagerFactory emf;
    protected EntityManager entityManager;

    public CompetitorsPersistence() {
        emf = Persistence.createEntityManagerFactory("AplicacionMundialPU");
    }

    public Response getAll() {
        List<CompetitorEntity> competitors = null;
        entityManager = emf.createEntityManager();
        int status = 200;
        try {
            entityManager.getTransaction().begin();
            Query q = entityManager.createQuery("select u from CompetitorEntity u order by u.surname ASC");
            competitors = q.getResultList();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (entityManager.isOpen());
            entityManager.close();
            status = 500;
        } finally {
            if (entityManager.isOpen());
            entityManager.close();
        }
        return Response.status(status).header("Access-Control-Allow-Origin", "*").entity(competitors).build();
    }

    public Response createCompetitor(CompetitorEntity competitor) {
        int status = 200;
        Long resp = 0L;
        entityManager = emf.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(competitor);
            entityManager.getTransaction().commit();
            resp = competitor.getId();
        } catch (Exception e) {
            e.printStackTrace();
            if (entityManager.isOpen());
            entityManager.close();
            status = 500;
        } finally {
            if (entityManager.isOpen());
            entityManager.close();
        }
        return Response.status(status).header("Access-Control-Allow-Origin", "*").entity(resp).build();
    }

}
