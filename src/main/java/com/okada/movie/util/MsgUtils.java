package com.okada.movie.util;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

public class MsgUtils {

    public static void msg(ModelMap map, int effect, String successMsg, String failureMsg) {
        if (effect == 1) {
            map.put("success", true);
            map.put("msg", successMsg);
        } else {
            map.put("success", false);
            map.put("msg", failureMsg);
        }
    }

    public static void msg(RedirectAttributesModelMap map, int effect, String successMsg, String failureMsg) {
        if (effect == 1) {
            map.addFlashAttribute("success", true);
            map.addFlashAttribute("msg", successMsg);
        } else {
            map.addFlashAttribute("success", false);
            map.addFlashAttribute("msg", failureMsg);
        }
    }

    public static void msgFailure(ModelMap map, String failureMsg) {
        map.put("success", false);
        map.put("msg", failureMsg);
    }

    public static void msgFailure(RedirectAttributesModelMap map, String failureMsg) {
        map.addFlashAttribute("success", false);
        map.addFlashAttribute("msg", failureMsg);
    }
}
