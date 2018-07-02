package com.okada.movie.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.okada.movie.config.PathConfig;
import com.okada.movie.model.Preview;
import com.okada.movie.service.PreviewService;
import com.okada.movie.util.MsgUtils;
import com.okada.movie.util.MultipartFileUtils;
import com.okada.movie.view.PreviewView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * 电影预告
 */
@Controller
@RequestMapping("admin")
public class PreviewController {

    @Autowired
    private PreviewService previewService;

    /**
     * 添加上映预告
     */
    @GetMapping("preview/add")
    public String previewAdd(ModelMap map) {
        return "admin/preview_add";
    }

    /**
     * 添加上映预告
     */
    @PostMapping("preview/add")
    public String previewAdd(RedirectAttributesModelMap map, PreviewView previewView) throws IOException {
        String logoFilename = MultipartFileUtils.saveFile(previewView.getLogo(), PathConfig.getInstance().getPreviewBasePath());

        Preview preview = new Preview();
        preview.setTitle(previewView.getTitle());
        preview.setLogo(logoFilename);
        preview.setAddTime(new Date());

        int effect = previewService.saveOne(preview);
        MsgUtils.msg(map, effect, "添加成功", "添加失败");

        return "redirect:/admin/preview/add";
    }

    /**
     * 上映预告列表
     */
    @RequestMapping("preview/list")
    public String previewList(ModelMap map,
                              @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Preview> tagList = previewService.list();
        PageInfo<Preview> previewPageInfo = new PageInfo<>(tagList);
        map.put("pageInfo", previewPageInfo);

        return "admin/preview_list";
    }

    /**
     * 删除预告列表
     */
    @GetMapping("preview/del/{id}")
    public String previewDelete(RedirectAttributesModelMap map, @PathVariable("id") int id) {
        int effect = previewService.delete(id);
        MsgUtils.msg(map, effect, "删除成功", "删除失败");

        return "redirect:/admin/preview/list";
    }

    /**
     * 编辑预告列表
     */
    @GetMapping("preview/edit/{id}")
    public String movieEdit(ModelMap map, @PathVariable("id") int id) {
        Preview preview = previewService.selectById(id);
        map.put("preview", preview);

        return "admin/preview_edit";
    }

    /**
     * 编辑预告
     */
    @PostMapping("preview/edit")
    public String movieEdit(RedirectAttributesModelMap map, PreviewView previewView) throws IOException {
        String oldTitle = previewService.selectById(previewView.getId()).getTitle();
        int newTitleCount = previewService.countByTitle(previewView.getTitle());
        if (!previewView.getTitle().equals(oldTitle) && newTitleCount == 1) {
            map.addFlashAttribute("success", false);
            map.addFlashAttribute("msg", "预告名称 " + previewView.getTitle() + " 已存在");
            return "redirect:/admin/preview/edit/" + previewView.getId();
        }

        Preview preview = new Preview();
        preview.setId(previewView.getId());
        preview.setTitle(previewView.getTitle());
        if (!previewView.getLogo().isEmpty()) {
            String logoFilename = MultipartFileUtils.saveFile(previewView.getLogo(), PathConfig.getInstance().getPreviewBasePath());
            preview.setLogo(logoFilename);
        }

        int effect = previewService.updateOne(preview);
        MsgUtils.msg(map, effect, "修改成功", "修改失败");

        return "redirect:/admin/preview/edit/" + previewView.getId();
    }
}
