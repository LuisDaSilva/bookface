package uk.ac.bbk.bookface.web;


import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import uk.ac.bbk.bookface.domain.Person;

/**
 * The person controller which has its aspects woven into it at compile time.
 */
@RequestMapping("/people")
@Controller
@RooWebScaffold(path = "people", formBackingObject = Person.class)
public class PersonController {
}
