package com.okada.movie.controller.home;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.okada.movie.anno.UserLoginRequired;
import com.okada.movie.constant.SessionConstants;
import com.okada.movie.model.*;
import com.okada.movie.service.CommentService;
import com.okada.movie.service.MovieCollectionService;
import com.okada.movie.service.MovieService;
import com.okada.movie.service.TagService;
import com.okada.movie.util.MsgUtils;
import com.okada.movie.view.Result;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeIndexController {

    @Autowired
    private TagService tagService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private MovieCollectionService movieCollectionService;

    /**
     * 上映预告
     */
    @RequestMapping("animation")
    public String animation() {
        return "home/animation";
    }

    /**
     * 电影列表
     */
    @RequestMapping(value = {"/", "/index"})
    public String index(ModelMap map,
                        @RequestParam(required = false, name = "tid") Integer tid,  // 标签
                        @RequestParam(required = false, name = "star") Integer star,  // 星级
                        @RequestParam(required = false, name = "time") Integer time,  // 时间 1：最近 2：更早
                        @RequestParam(required = false, name = "pm") Integer pm,  // 播放数量 1：从高到低 2：从低到高
                        @RequestParam(required = false, name = "cm") Integer cm,  // 评论数量 1：从高到低 2：从低到高
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                        @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        List<Tag> tagList = tagService.list();
        map.put("tags", tagList);

        map.put("tid", tid);
        map.put("star", star);
        map.put("time", time);
        map.put("pm", pm);
        map.put("cm", cm);

        PageHelper.startPage(pageNum, pageSize);
        List<Movie> movieList = movieService.listBy(tid, star, time, pm, cm);
        PageInfo<Movie> moviePageInfo = new PageInfo<>(movieList);
        map.put("pageInfo", moviePageInfo);

        return "home/index";
    }

    /**
     * 搜索电影
     */
    @RequestMapping("search")
    public String search(ModelMap map,
                         String key,
                         @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> movieList = movieService.searchByTitle(key);
        PageInfo<Movie> moviePageInfo = new PageInfo<>(movieList);
        map.put("pageInfo", moviePageInfo);
        map.put("key", key);

        return "home/search";
    }

    /**
     * 电影详情
     */
    @GetMapping("play/{id}")
    public String play(HttpServletRequest request,
                       ModelMap map,
                       @PathVariable("id") int movieId,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        Movie movie = movieService.selectById(movieId);
        movie.setPlayNum(movie.getPlayNum() + 1);  // 播放数加1
        movieService.updateOne(movie);

        map.put("movie", movie);
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);
        map.put("hasLogin", user != null);

        PageHelper.startPage(pageNum, pageSize);
        List<Comment> commentList = commentService.listByMovieId(movieId);
        PageInfo<Comment> commentPageInfo = new PageInfo<>(commentList);
        map.put("pageInfo", commentPageInfo);

        return "home/play";
    }

    /**
     * 电影详情
     */
    @PostMapping("play/{id}")
    public String play(HttpServletRequest request,
                       RedirectAttributesModelMap map,
                       @PathVariable("id") int movieId,
                       String content) {
        if (StringUtils.isBlank(content)) {
            MsgUtils.msgFailure(map, "请输入内容");
            return "redirect:/play/" + movieId;
        }

        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);
        commentService.insert(movieId, user.getId(), content);

        Movie movie = movieService.selectById(movieId);
        movie.setCommentNum(movie.getCommentNum() + 1);  // 评论数数加1
        movieService.updateOne(movie);

        return "redirect:/play/" + movieId;
    }


    @RequestMapping("moviecol/add")
    @UserLoginRequired
    @ResponseBody
    public Result addMovieCol(HttpServletRequest request,
                              int movieId) {
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);
        MovieCollection movieCollection = movieCollectionService.selectByUserIdMovieId(user.getId(), movieId);
        if (movieCollection == null) {
            movieCollectionService.addOne(user.getId(), movieId);
            return Result.success();
        } else {
            return Result.error("已经收藏过了");
        }
    }

    /**
     * 评论记录
     */
    @UserLoginRequired
    @RequestMapping("comments")
    public String comments(HttpServletRequest request,
                           ModelMap map,
                           @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);

        PageHelper.startPage(pageNum, pageSize);
        List<Comment> commentList = commentService.listByUserId(user.getId());
        PageInfo<Comment> commentPageInfo = new PageInfo<>(commentList);
        map.put("pageInfo", commentPageInfo);

        return "home/comments";
    }


    /**
     * 电影收藏列表
     */
    @UserLoginRequired
    @RequestMapping("moviecol")
    public String moviecol(HttpServletRequest request,
                           ModelMap map,
                           @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) request.getSession().getAttribute(SessionConstants.USER_INFO);

        PageHelper.startPage(pageNum, pageSize);
        List<MovieCollection> movieCollectionList = movieCollectionService.listByUserId(user.getId());
        PageInfo<MovieCollection> movieCollectionPageInfo = new PageInfo<>(movieCollectionList);
        map.put("pageInfo", movieCollectionPageInfo);

        return "home/moviecol";
    }
}
