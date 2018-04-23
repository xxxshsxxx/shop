package ru.savshop.shop.controller;

import org.springframework.boot.context.config.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.savshop.shop.handler.NotFound;

import javax.jws.WebParam;

@Controller
public class ExceptionController {
    @RequestMapping(value = "/verifyError")
    public String verifyerror(ModelMap map) {
        map.addAttribute("errorMessage", "You're not verified your account. \n Check your Email!!!");
        return "login";
    }
    @RequestMapping(value = "/inccorectError")
    public String incorrectError(ModelMap map) {
        map.addAttribute("errorMessage", "Login or password are entered incorrectly!\nTry again");
        return "login";
    }
    @RequestMapping(value = "/accessError")
    public String accesstError(ModelMap map) {
        map.addAttribute("errorMessage", "Sorry, you do not have permission to view this page.");
        return "login";

    }


    @RequestMapping(value = {"/{name}", "/{name}/{name}"}, method = RequestMethod.GET)
    public String viewEdit(@PathVariable("name") final String name, ModelMap model) {
        if (name.equals("null")) throw new NotFound();
        model.addAttribute("msg", "Page not found");
        return "404";
    }
}

