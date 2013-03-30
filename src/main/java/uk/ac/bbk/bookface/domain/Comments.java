package uk.ac.bbk.bookface.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "comments")
public class Comments {

    @NotNull
    @Column(name = "description")
    @Size(min = 2)
    private String description;

    @NotNull
    @Column(name = "person")
    private Integer person;

    @NotNull
    @Column(name = "book")
    private Integer book;
}
