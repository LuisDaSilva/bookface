// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import uk.ac.bbk.bookface.domain.BookDataOnDemand;
import uk.ac.bbk.bookface.domain.BookFaceUserDataOnDemand;
import uk.ac.bbk.bookface.domain.Favourites;
import uk.ac.bbk.bookface.domain.FavouritesDataOnDemand;

privileged aspect FavouritesDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FavouritesDataOnDemand: @Component;
    
    private Random FavouritesDataOnDemand.rnd = new SecureRandom();
    
    private List<Favourites> FavouritesDataOnDemand.data;
    
    @Autowired
    BookDataOnDemand FavouritesDataOnDemand.bookDataOnDemand;
    
    @Autowired
    BookFaceUserDataOnDemand FavouritesDataOnDemand.bookFaceUserDataOnDemand;
    
    public Favourites FavouritesDataOnDemand.getNewTransientFavourites(int index) {
        Favourites obj = new Favourites();
        return obj;
    }
    
    public Favourites FavouritesDataOnDemand.getSpecificFavourites(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Favourites obj = data.get(index);
        Long id = obj.getId();
        return Favourites.findFavourites(id);
    }
    
    public Favourites FavouritesDataOnDemand.getRandomFavourites() {
        init();
        Favourites obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Favourites.findFavourites(id);
    }
    
    public boolean FavouritesDataOnDemand.modifyFavourites(Favourites obj) {
        return false;
    }
    
    public void FavouritesDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Favourites.findFavouritesEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Favourites' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Favourites>();
        for (int i = 0; i < 10; i++) {
            Favourites obj = getNewTransientFavourites(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
