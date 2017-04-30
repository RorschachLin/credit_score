package com.le.ac.core.hibernate;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.metadata.ClassMetadata;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.le.ac.core.util.ReflectionUtils;

//this transaction can be inherited
@Transactional
@SuppressWarnings("unchecked")
public abstract class SimpleHibernateDaoImpl<T> implements SimpleHibernateDao<T> {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	private SessionFactory sessionFactory;
	private Class<T> entityClass = null;

	/**
	 * 用于Dao层子类使用的构造函数. -- Constructor for subclass of Dao layer <br>
	 * 通过子类的泛型定义取得对象类型Class. -- Get the Class of object type through the
	 * definition of generic paradigm of sbuclass <br>
	 * eg. <br>
	 * public class UserDao extends SimpleHibernateDaoImpl<User>{ }
	 */
	public SimpleHibernateDaoImpl() {
		this.entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
		logger.info("----->装载bean对象:" + entityClass + "<-----");
	}

	/**
	 * 用于用于省略Dao层, 在Service层直接使用通用SimpleHibernateDao的构造函数. <br>
	 * 
	 * 在构造函数中定义对象类型Class. <br>
	 * eg. <br>
	 * SimpleHibernateDao<User> userDao = new SimpleHibernateDaoImpl
	 * <User>(sessionFactory, User.class);
	 */
	public SimpleHibernateDaoImpl(final SessionFactory sessionFactory, final Class<T> entityClass) {
		this.sessionFactory = sessionFactory;
		this.entityClass = entityClass;
	}

	/**
	 * Adopt @Autowired to inject SessionFactory by type. Override this function
	 * when having multiple SessionFactory.
	 */
	@Autowired
	public void setSessionFactory(final SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * get the currently available session object
	 * 
	 * @return
	 */
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * get sessionFactory.
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public Object save(Object entity) {
		Assert.notNull(entity, "entity can not be null");
		logger.debug("save entity: {}", entity);
		return getSession().save(entity);
	}

	public void saveOrUpdate(Object entity) {
		Assert.notNull(entity, "entity can not be null");
		getSession().saveOrUpdate(entity);
		logger.debug("save entity: {}", entity);
	}

	public void update(Object entity) {
		Assert.notNull(entity, "entity can not be null");
		getSession().update(entity);
		logger.debug("save entity: {}", entity);
	}

	public void delete(Object entity) {
		Assert.notNull(entity, "entity can not be null");
		getSession().delete(entity);
		logger.debug("delete entity: {}", entity);
	}

	public void deleteById(Object id) {
		Assert.notNull(id, "id can not be null");
		delete(get(id));
		logger.debug("delete entity {},id is {}", entityClass.getSimpleName(), id);
	}

	public T get(Object id) {
		Assert.notNull(id, "id can not be null");
		return (T) getSession().load(entityClass, (Serializable) id);
	}

	public T get(Object id, Boolean isUsedGet) {
		Assert.notNull(id, "id can not be null");
		if (isUsedGet) {
			return (T) getSession().get(entityClass, (Serializable) id);
		}
		return (T) getSession().load(entityClass, (Serializable) id);
	}

	public List<T> getAll() {
		return find();
	}

	public List<T> getAll(String orderBy, boolean isAsc) {
		Criteria c = createCriteria();
		if (isAsc) {
			c.addOrder(Order.asc(orderBy));
		} else {
			c.addOrder(Order.desc(orderBy));
		}
		return c.list();
	}

	public List<T> findBy(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return find(criterion);
	}

	public List<T> findBy(String propertyName, Object value, String propertyName1, Object value1) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Criterion criterion = Restrictions.eq(propertyName, value);
		Criterion criterion1 = Restrictions.eq(propertyName1, value1);
		return find(new Criterion[] { criterion, criterion1 });
	}

	public List<T> findByAndOrder(String propertyName, Object value, String orderBy, boolean isAsc) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Criteria criteria = getSession().createCriteria(entityClass);
		criteria.add(Restrictions.eq(propertyName, value));
		// 设置排序
		if (StringUtils.isNotBlank(orderBy)) {
			if (isAsc) {
				criteria.addOrder(Order.asc(orderBy));
			} else {
				criteria.addOrder(Order.desc(orderBy));
			}
		}
		return criteria.list();
	}

	public List<T> findByAndOrder(String propertyName, Object value, String propertyName1, Object value1,
			String orderBy, boolean isAsc) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Criteria criteria = getSession().createCriteria(entityClass);
		criteria.add(Restrictions.eq(propertyName, value));
		criteria.add(Restrictions.eq(propertyName1, value1));
		// 设置排序
		if (StringUtils.isNotBlank(orderBy)) {
			if (isAsc) {
				criteria.addOrder(Order.asc(orderBy));
			} else {
				criteria.addOrder(Order.desc(orderBy));
			}
		}
		return criteria.list();
	}

	public T findUniqueBy(String propertyName, Object value) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Criterion criterion = Restrictions.eq(propertyName, value);
		return (T) createCriteria(criterion).uniqueResult();
	}

	public T findUniqueBy(String propertyName, Object value, String propertyName1, Object value1) {
		Assert.hasText(propertyName, "propertyName cannot be null");
		Assert.hasText(propertyName1, "propertyName1 cannot be null");
		Criterion criterion = Restrictions.eq(propertyName, value);
		Criterion criterion1 = Restrictions.eq(propertyName1, value1);
		return (T) createCriteria(criterion, criterion1).uniqueResult();
	}

	public List<T> findByIds(List<Object> ids) {
		return find(Restrictions.in(getIdName(), ids));
	}

	/**
	 * find the several formers in the query, usually used with hql statement
	 * "order by"
	 * 
	 * @param hql
	 * @param values
	 * @return
	 * @author Lin
	 */
	public List<T> findFormers(String hql, Integer limit, Object... values) {
		// set the max query size as limit
		Query query = createQuery(hql, values).setMaxResults(limit);
		return query.list();
	}
	
	/**
	 * find the first element in the query, usually used with hql statement
	 * "order by"
	 * @param hql
	 * @param values
	 * @return
	 * @author Lin
	 */
	public List<T> findFirst(String hql, Object... values) {
		return findFormers(hql, 1, values);
	}

	public List<T> find(String hql, Object... values) {
		return createQuery(hql, values).list();
	}

	public <X> List<X> find(final String hql, final Map<String, ?> values) {
		return createQuery(hql, values).list();
	}

	public <X> X findUnique(String hql, Object... values) {
		return (X) createQuery(hql, values).uniqueResult();
	}

	public <X> X findUnique(final String hql, final Map<String, ?> values) {
		return (X) createQuery(hql, values).uniqueResult();
	}

	public int batchExecute(final String hql, final Object... values) {
		return createQuery(hql, values).executeUpdate();
	}

	public int batchExecute(final String hql, final Map<String, ?> values) {
		return createQuery(hql, values).executeUpdate();
	}

	public Query createQuery(final String queryString, final Object... values) {
		Assert.hasText(queryString, "queryString cannot be null");
		Query query = getSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}

	public Query createQuery(final String queryString, final Map<String, ?> values) {
		Assert.hasText(queryString, "queryString cannot be null");
		Query query = getSession().createQuery(queryString);
		if (values != null) {
			query.setProperties(values);
		}
		return query;
	}

	/**
	 * Query object list by Criteria
	 * 
	 * @param criterions
	 *            Amount changeable Criterion.
	 */
	public List<T> find(final Criterion... criterions) {
		return createCriteria(criterions).list();
	}

	public List<T> find(final Set<String> refNames, final Map<String, String> orderMap, final Criterion... criterions) {
		return createCriteria(refNames, orderMap, criterions).list();
	}

	public T findUnique(final Criterion... criterions) {
		return (T) createCriteria(criterions).uniqueResult();
	}

	public Criteria createCriteria(final Set<String> refNames, Map<String, String> orderMap,
			final Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		// set referenced class

		for (String refClassName : refNames) {
			criteria.createAlias(refClassName, refClassName);
		}
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		if (orderMap != null) {
			for (String key : orderMap.keySet()) {
				if ("ASC".equals(orderMap.get(key).toUpperCase())) {
					criteria.addOrder(Order.asc(key));
				} else {
					criteria.addOrder(Order.desc(key));
				}
			}
		}
		return criteria;
	}

	public Criteria createCriteria(final Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	public void initEntity(T entity) {
		Hibernate.initialize(entity);
	}

	public void initEntity(List<T> entityList) {
		for (T entity : entityList) {
			Hibernate.initialize(entity);
		}
	}

	public void flush() {
		getSession().flush();
	}

	public Query distinct(Query query) {
		query.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return query;
	}

	public Criteria distinct(Criteria criteria) {
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return criteria;
	}

	public String getIdName() {
		ClassMetadata meta = getSessionFactory().getClassMetadata(entityClass);
		return meta.getIdentifierPropertyName();
	}

}
