// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.zzl.weierp.domain;

import com.zzl.weierp.domain.ProductType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ProductType.entityManager;
    
    public static final EntityManager ProductType.entityManager() {
        EntityManager em = new ProductType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProductType.countProductTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProductType o", Long.class).getSingleResult();
    }
    
    public static List<ProductType> ProductType.findAllProductTypes() {
        return entityManager().createQuery("SELECT o FROM ProductType o", ProductType.class).getResultList();
    }
    
    public static ProductType ProductType.findProductType(Long id) {
        if (id == null) return null;
        return entityManager().find(ProductType.class, id);
    }
    
    public static List<ProductType> ProductType.findProductTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProductType o", ProductType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ProductType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProductType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProductType attached = ProductType.findProductType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProductType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ProductType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ProductType ProductType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProductType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
