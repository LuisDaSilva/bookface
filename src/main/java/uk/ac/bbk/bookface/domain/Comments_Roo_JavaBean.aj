// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.domain;

import uk.ac.bbk.bookface.domain.Comments;

privileged aspect Comments_Roo_JavaBean {
    
    public String Comments.getDescription() {
        return this.description;
    }
    
    public void Comments.setDescription(String description) {
        this.description = description;
    }
    
    public String Comments.getPerson() {
        return this.person;
    }
    
    public void Comments.setPerson(String person) {
        this.person = person;
    }
    
    public String Comments.getBook() {
        return this.book;
    }
    
    public void Comments.setBook(String book) {
        this.book = book;
    }
    
}
