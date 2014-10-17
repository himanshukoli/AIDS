package org.shunya.server.dao;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.shunya.shared.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DBDaoImpl implements DBDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Agent> list() {
        return sessionFactory.getCurrentSession().createCriteria(Agent.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }

    @Override
    public void saveOrUpdate(Agent agent) {
        sessionFactory.getCurrentSession().saveOrUpdate(agent);
    }

    @Override
    public void saveOrUpdate(TaskRun taskRun) {
        sessionFactory.getCurrentSession().saveOrUpdate(taskRun);
    }

    @Override
    public void saveOrUpdate(TaskData taskData) {
        sessionFactory.getCurrentSession().saveOrUpdate(taskData);
    }

    @Override
    public void saveOrUpdate(TaskStepData taskStepData) {
        sessionFactory.getCurrentSession().saveOrUpdate(taskStepData);
    }

    @Override
    public void saveOrUpdate(TaskStepRun taskStepRun) {
        sessionFactory.getCurrentSession().saveOrUpdate(taskStepRun);
    }

    @Override
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}