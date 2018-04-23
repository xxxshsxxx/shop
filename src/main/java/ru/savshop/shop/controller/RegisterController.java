package ru.savshop.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ru.savshop.shop.mail.EmailServiceImp;
import ru.savshop.shop.model.Gender;
import ru.savshop.shop.model.User;
import ru.savshop.shop.model.UserType;
import ru.savshop.shop.repository.CategoryRepository;
import ru.savshop.shop.repository.CountryRepository;
import ru.savshop.shop.repository.PostRepository;
import ru.savshop.shop.repository.UserRepository;
import ru.savshop.shop.security.CurrentUser;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Controller
public class RegisterController {

    @Autowired
    private CountryRepository countryRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Value("${shop.userpic.upload.path}")
    private String imageUploadPath;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EmailServiceImp emailServiceImp;
    @Autowired
    private PostRepository postRepository;

    @RequestMapping(value = "/userRegister", method = RequestMethod.GET)
    public String register(ModelMap map, @RequestParam(name = "message",
            required = false) String message) {


        map.addAttribute("message", message != null ? message : "");
        map.addAttribute("allcountry", countryRepository.findAll());
        map.addAttribute("user", new User());
        map.addAttribute("allCategories", categoryRepository.findAll());
        map.addAttribute("allPosts", postRepository.findAll());
        return "register";
    }


    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSucces() {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getUser().getType() == UserType.ADMIN) {
            return "redirect:/admin";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@Valid @ModelAttribute(name = "registerUser") User user, BindingResult result,
                          @RequestParam(value = "picture") MultipartFile file, ModelMap map) throws IOException {
        File dir = new File(imageUploadPath);
        if (!dir.exists()) {
            dir.mkdir();
        }
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/userRegister?message=" + sb.toString();
        }
        User userByEmailLike = userRepository.findUserByEmailLike(user.getEmail());
        if (userByEmailLike != null) {
            return "redirect:/userRegister";
        }
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            return "redirect:/userRegister";
        }
        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);
        user.setPicUrl(picName);
        user.setToken(UUID.randomUUID().toString());
        String url = String.format("http://localhost:8080/verify?token=%s&email=%s", user.getToken(), user.getEmail());
        String text = String.format("hello %s you are registred, click " +
                "on this link for visiting your profile %s", user.getName(), url);
        if (user.getGender() == null) {
            user.setGender(Gender.MALE);
        }
        user.setType(UserType.USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        emailServiceImp.sendSimpleMessage(user.getEmail(), "welcome!!!", text);
        return "redirect:/";
    }

    @RequestMapping(value = "/forgetPassword", method = RequestMethod.GET)
    public String forgetPass (){

        return "forgetPass";
    }


    @RequestMapping(value = "/forget")
    public String forget(@RequestParam(name = "email", required = false) String email
    ) throws IOException {
        User user = userRepository.findOneByEmail(email);

        String alphaNumericString;
        int len = 8;
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        alphaNumericString = sb.toString();
        String pass = alphaNumericString;

        user.setPassword(passwordEncoder.encode(alphaNumericString));
        userRepository.save(user);
        String text = user.getName() + "Your new password are '" + pass + "' Please visit Your accaunt and UPDATE YOUR PASSWORD";
        emailServiceImp.sendSimpleMessage(email, "Hello!", text);
        return "redirect:/";
    }


    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verify(@RequestParam("token") String token, @RequestParam("email") String email) {
        User one = userRepository.findOneByEmail(email);
        if (one != null) {
            if (one.getToken() != null && one.getToken().equals(token)) {
                one.setToken("");
                one.setVerify(true);
                userRepository.save(one);
            }
        }
        return "redirect:/";

    }


}
