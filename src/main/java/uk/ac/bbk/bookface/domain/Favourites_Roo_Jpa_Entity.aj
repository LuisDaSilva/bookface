// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import uk.ac.bbk.bookface.domain.Favourites;

privileged aspect Favourites_Roo_Jpa_Entity {
    
    declare @type: Favourites: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Favourites.id;
    
    @Version
    @Column(name = "version")
    private Integer Favourites.version;
    
    public Long Favourites.getId() {
        return this.id;
    }
    
    public void Favourites.setId(Long id) {
        this.id = id;
    }
    
    public Integer Favourites.getVersion() {
        return this.version;
    }
    
    public void Favourites.setVersion(Integer version) {
        this.version = version;
    }
    
}
