package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.anno.AuthRequire;
import com.okada.movie.model.Tag;
import com.okada.movie.service.TagService;
import com.okada.movie.util.MsgUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.Date;
import java.util.List;

/**
 * 标签
 */
@Controller
@RequestMapping("admin")
public class TagController {

    @Autowired
    private TagService tagService;

    /**
     * 添加标签
     */
    @AuthRequire
    @GetMapping("tag/add")
    public String tagAdd() {
        return "admin/tag_add";
    }

    /**
     * 添加标签
     */
    @PostMapping("tag/add")
    public String tagAdd(ModelMap map, String name) {
        if (StringUtils.isBlank(name)) {
            map.put("success", false);
            map.put("msg", "标签名不能为空");
            return "admin/tag_add";
        }

        name = name.trim();

        int count = tagService.countByName(name);
        if (count >= 1) {
            map.put("success", false);
            map.put("msg", "标签名不能重复");
            return "admin/tag_add";
        }

        int effect = tagService.insert(name, new Date());
        MsgUtils.msg(map, effect, "添加成功", "添加失败");

        return "admin/tag_add";
    }

    /**
     * 标签列表
     */
    @GetMapping("tag/list")
    public String tagList(ModelMap map,
                          @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                          @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Tag> tagList = tagService.list();
        PageInfo<Tag> tagPageInfo = new PageInfo<>(tagList);
        map.put("pageInfo", tagPageInfo);

        return "admin/tag_list";
    }

    /**
     * 标签删除
     */
    @GetMapping("tag/del/{id}")
    public String tagDelete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = tagService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/tag/list";
    }

    /**
     * 编辑标签
     */
    @GetMapping("tag/edit/{id}")
    public String tagEdit(ModelMap map, @PathVariable("id") int id) {
        Tag tag = tagService.selectById(id);
        map.put("tag", tag);

        return "admin/tag_edit";
    }

    /**
     * 编辑标签
     */
    @PostMapping("tag/edit")
    public String tagEdit(ModelMap map,
                          @RequestParam("id") int id,
                          @RequestParam("name") String name) {
        Tag tag = tagService.selectById(id);
        if (!tag.getName().equals(name) && tagService.countByName(name) == 1) {
            map.put("success", false);
            map.put("msg", "标签名称 " + name + " 已存在");
            map.put("tag", tag);
            return "admin/tag_edit";
        }

        int effect = tagService.updateTag(id, name);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");
        tag.setName(name);
        map.put("tag", tag);

        return "admin/tag_edit";
    }
}
