package ru.savshop.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import ru.savshop.shop.model.Post;
import ru.savshop.shop.model.User;
import ru.savshop.shop.repository.*;
import ru.savshop.shop.security.CurrentUser;

import java.util.LinkedList;
import java.util.List;


@Controller
public class MainController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PostRepository postRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private CountryRepository countryRepository;
    @Autowired
    private AttribValueRepository attribValueRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String mainPage(ModelMap modelMap, @AuthenticationPrincipal UserDetails userDetails) {
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("userDetail", userRepository.findAll());
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("current", user);
        }
        return "index";
    }


    @RequestMapping(value = "/searchResult", method = RequestMethod.GET)
    public String result(ModelMap modelMap, @RequestParam(name = "search", required = false) String search) {
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        List<Post> postList = postRepository.findPostsByTitleLike(search);
        if (search != null && postList.isEmpty()) {
            modelMap.addAttribute("mess", "Search Result with " + "' " + search + " '" + " not Found");
        } else {
            modelMap.addAttribute("result", postList);
        }
        return "result";
    }

    @RequestMapping(value = "/categorySearch", method = RequestMethod.GET)
    public String catergoryResult(ModelMap modelMap, @RequestParam(name = "id") int id) {
        List<Post> postList = postRepository.findPostsByCategoryId(id);
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("result", postList);
        return "result";
    }

    @RequestMapping(value = "/middleRange")
    public String middle(ModelMap map, @RequestParam(name = "firstInt") int firstId,
                         @RequestParam(name = "secondInt") int secondId,
                         @RequestParam(name = "id") int id, @AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            map.addAttribute("user", userRepository.findOne(currentUser.getId()));
        }
        map.addAttribute("allPosts", postRepository.findAll());
        map.addAttribute("allCategories", categoryRepository.findAll());

        List<Post> list = postRepository.findAll();
        List<Post> p = new LinkedList<>();
        for (Post post : list) {
            if (post.getPrice() >= firstId & post.getPrice() <= secondId && post.getCategory().getId() == id) {
                p.add(post);
            }
            map.addAttribute("result", p);
        }
        if (p.isEmpty()) {
            map.addAttribute("mess", "There is no any posts in  " + firstId + " from " + secondId + " range");
        }

        return "result";
    }

    @RequestMapping(value = "/viewDetail", method = RequestMethod.GET)
    public String viewDetail(ModelMap post, @RequestParam(name = "id", required = false) int id,
                             @AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            post.addAttribute("current", currentUser);
        }
            Post post1 = postRepository.findPostsById(id);
        int view = post1.getView();
        post1.setView(++view);
        postRepository.save(post1);
            post1.setAttributeValues(attribValueRepository.findAllByPost(post1));
            post.addAttribute("curentPost", post1);

            post.addAttribute("allPosts", postRepository.findAll());
            post.addAttribute("allCategories", categoryRepository.findAll());
        return "detail";
        }


    @RequestMapping(value = "/contactUs", method = RequestMethod.GET)
    public String contact(ModelMap modelMap,@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("user", userRepository.findOne(currentUser.getId()));
        }
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        return "contact";
    }

    @RequestMapping(value = "/userHelp", method = RequestMethod.GET)
    public String help(ModelMap modelMap,@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("current", userRepository.findOne(currentUser.getId()));
        }
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        return "help";
    }
    @RequestMapping(value = "/userConditions", method = RequestMethod.GET)
    public String conditions(ModelMap modelMap,@AuthenticationPrincipal UserDetails userDetails) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            modelMap.addAttribute("current", userRepository.findOne(currentUser.getId()));
        }
        modelMap.addAttribute("allPosts", postRepository.findAll());
        modelMap.addAttribute("allCategories", categoryRepository.findAll());
        return "conditions";
    }
}
