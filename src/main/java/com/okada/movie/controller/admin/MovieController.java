package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.config.PathConfig;
import com.okada.movie.model.Movie;
import com.okada.movie.model.Tag;
import com.okada.movie.service.MovieService;
import com.okada.movie.service.TagService;
import com.okada.movie.util.MsgUtils;
import com.okada.movie.util.MultipartFileUtils;
import com.okada.movie.view.MovieView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin")
public class MovieController {

    @Autowired
    private TagService tagService;

    @Autowired
    private MovieService movieService;

    /**
     * 添加电影
     */
    @GetMapping("movie/add")
    public String movieAdd(ModelMap map) {
        map.put("tagList", tagService.list());
        return "admin/movie_add";
    }

    /**
     * 添加电影
     */
    @PostMapping("movie/add")
    public String movieAdd(RedirectAttributesModelMap map, MovieView movieView) throws IOException {
        String movieFilename = MultipartFileUtils.saveFile(movieView.getMovie(), PathConfig.getInstance().getMovieBasePath());
        String logoFilename = MultipartFileUtils.saveFile(movieView.getLogo(), PathConfig.getInstance().getImageBsePath());

        Movie movie = new Movie();
        movie.setTitle(movieView.getTitle());
        movie.setUrl(movieFilename);
        movie.setInfo(movieView.getInfo());
        movie.setLogo(logoFilename);
        movie.setStar(movieView.getStar());
        movie.setPlayNum(0L);
        movie.setCommentNum(0L);
        Tag tag = new Tag();
        tag.setId(movieView.getTag_id());
        movie.setTag(tag);
        movie.setArea(movieView.getArea());
        try {
            movie.setReleaseTime(new SimpleDateFormat("yyyy-MM-dd").parse(movieView.getRelease_time()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        movie.setLength(movieView.getLength());
        movie.setAddTime(new Date());

        int effect = movieService.saveOne(movie);
        MsgUtils.msg(map, effect, "添加成功", "添加失败");

        return "redirect:/admin/movie/add";
    }

    /**
     * 电影列表
     */
    @GetMapping("movie/list")
    public String movieList(ModelMap map,
                            @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> movieList = movieService.list();
        PageInfo<Movie> moviePageInfo = new PageInfo<>(movieList);
        map.put("pageInfo", moviePageInfo);

        return "admin/movie_list";
    }

    /**
     * 电影删除
     */
    @GetMapping("movie/del/{id}")
    public String movieDelete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = movieService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/movie/list";
    }

    /**
     * 编辑电影
     */
    @GetMapping("movie/edit/{id}")
    public String movieEdit(ModelMap map, @PathVariable("id") int id) {
        Movie movie = movieService.selectById(id);
        map.put("movie", movie);
        map.put("tagList", tagService.list());

        return "admin/movie_edit";
    }

    /**
     * 编辑电影
     */
    @PostMapping("movie/edit")
    public String movieEdit(RedirectAttributesModelMap map, MovieView movieView) throws IOException {
        String oldMovieTitle = movieService.selectById(movieView.getId()).getTitle();
        int newMovieTitleCount = movieService.countByTitle(movieView.getTitle());
        if (!movieView.getTitle().equals(oldMovieTitle) && newMovieTitleCount == 1) {
            map.addFlashAttribute("success", false);
            map.addFlashAttribute("msg", "电影名称 " + movieView.getTitle() + " 已存在");
            return "redirect:/admin/movie/edit/" + movieView.getId();
        }

        Movie movie = new Movie();
        movie.setId(movieView.getId());
        movie.setTitle(movieView.getTitle());
        if (!movieView.getMovie().isEmpty()) {
            String movieFilename = MultipartFileUtils.saveFile(movieView.getMovie(), PathConfig.getInstance().getMovieBasePath());
            movie.setUrl(movieFilename);
        }
        movie.setInfo(movieView.getInfo());
        if (!movieView.getLogo().isEmpty()) {
            String logoFilename = MultipartFileUtils.saveFile(movieView.getLogo(), PathConfig.getInstance().getImageBsePath());
            movie.setLogo(logoFilename);
        }
        movie.setStar(movieView.getStar());
        Tag tag = new Tag();
        tag.setId(movieView.getTag_id());
        movie.setTag(tag);
        movie.setArea(movieView.getArea());
        try {
            movie.setReleaseTime(new SimpleDateFormat("yyyy-MM-dd").parse(movieView.getRelease_time()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        movie.setLength(movieView.getLength());

        int effect = movieService.updateOne(movie);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");

        return "redirect:/admin/movie/edit/" + movieView.getId();
    }
}
