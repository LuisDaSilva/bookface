// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package uk.ac.bbk.bookface.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import uk.ac.bbk.bookface.domain.Book;
import uk.ac.bbk.bookface.domain.Favourites;
import uk.ac.bbk.bookface.domain.Person;
import uk.ac.bbk.bookface.web.FavouritesController;

privileged aspect FavouritesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FavouritesController.create(@Valid Favourites favourites, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, favourites);
            return "favouriteses/create";
        }
        uiModel.asMap().clear();
        favourites.persist();
        return "redirect:/favouriteses/" + encodeUrlPathSegment(favourites.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FavouritesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Favourites());
        return "favouriteses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FavouritesController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("favourites", Favourites.findFavourites(id));
        uiModel.addAttribute("itemId", id);
        return "favouriteses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FavouritesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("favouriteses", Favourites.findFavouritesEntries(firstResult, sizeNo));
            float nrOfPages = (float) Favourites.countFavouriteses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("favouriteses", Favourites.findAllFavouriteses());
        }
        return "favouriteses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FavouritesController.update(@Valid Favourites favourites, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, favourites);
            return "favouriteses/update";
        }
        uiModel.asMap().clear();
        favourites.merge();
        return "redirect:/favouriteses/" + encodeUrlPathSegment(favourites.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FavouritesController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Favourites.findFavourites(id));
        return "favouriteses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FavouritesController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Favourites favourites = Favourites.findFavourites(id);
        favourites.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/favouriteses";
    }
    
    void FavouritesController.populateEditForm(Model uiModel, Favourites favourites) {
    	favourites.setPerson(Integer.parseInt(Person.findPersonByScreenName(SecurityContextHolder.getContext().getAuthentication().getName()).getId().toString()));
        uiModel.addAttribute("favourites", favourites);
        uiModel.addAttribute("books", Book.findAllBooks());
    }
    
    String FavouritesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
